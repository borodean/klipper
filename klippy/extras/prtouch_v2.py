# prtouch support
#
# Copyright (C) 2018-2021  Creality <wangyulong878@sina.com>
#
# This file may be distributed under the terms of the GNU GPLv3 license.
import logging
import time
import math
import random


# COMMANDS

# SELF_CHECK_PRTOUCH
# START_STEP_PRTOUCH DIR=1 SPD=10 DIS=10
# NOZZLE_CLEAR HOT_MIN_TEMP=140 HOT_MAX_TEMP=260 BED_MAX_TEMP=100
# PRTOUCH_READY
# FORCE_MOVE STEPPER=stepper_x DISTANCE=5 VELOCITY=10
# PID_CALIBRATE HEATER=extruder TARGET=210
# PID_CALIBRATE HEATER=heater_bed TARGET=60
# SAFE_DOWN_Z DOWN_DIS=10 UP_DIS=5


ERR_PRES_READ_DATA_TIMEOUT  = 'The data read interval is too large, need=11ms, actual=%s'
ERR_PRES_VAL_IS_CONSTANT    = 'The pressure data for channel=%s is incorrect. The value is constant %s'
ERR_PRES_NOT_BE_SENSED      = 'The pressure data in channel=%s cannot be properly sensed'
ERR_PRES_LOST_RUN_DATA      = 'The pressure data is lost when the probe is over and waiting for the data to be sent back'
ERR_PRES_NOISE_TOO_BIG      = 'Sensor data noise is too big, channel=%s'
ERR_STEP_LOST_RUN_DATA      = 'The motor step data is lost when the probe is over and waiting for data return'
ERR_G28_Z_DETECTION_TIMEOUT = 'G28 Z try probe out of times'
ERR_G28_Z_DETECTION_ERROR   = 'G28 Z probe ERROR'
ERR_SWAP_PIN_DETECTI        = 'The synchronization pin test failed, pres_swap_pin=%s, step_swap_pin=%s'

MAX_PRES_CNT = 4
MAX_BUF_LEN = 32


# PRTouch "endstop" wrapper
class PRTouchEndstopWrapper:
    def __init__(self, config):
        self.config = config
        self.printer = config.get_printer()
        self.shut_down = False
        self.jump_probe_ready, self.has_save_sys_acc = False, False
        self.safe_move_z_tri_call_back, self.safe_move_z_all_cnt = None, 0
        self.mm_per_step, self.pres_tri_time, self.step_tri_time, self.pres_tri_chs, self.pres_buf_cnt = 0, 0, 0, 0, 0
        self.rdy_pos = None
        self.mm_per_step = None
        self.sys_max_velocity, self.sys_max_accel, self.sys_max_z_velocity, self.sys_max_z_accel = 0, 0, 0, 0

        self.public_step_res, self.pres_res = [], []
        self.public_read_swap_prtouch_cmd, self.public_start_step_prtouch_cmd = None, None
        self.public_write_swap_prtouch_cmd, self.read_pres_prtouch_cmd, self.start_pres_prtouch_cmd = None, None, None
        self.bed_mesh, self.toolhead, self.bed_mesh, self.pheaters, self.heater_hot, self.heater_bed = None, None, None, None, None, None
        # 0. Base Cfg
        self.use_adc            = config.getboolean('use_adc', default=False)
        # 1. Tri Cfg
        self.tri_acq_ms         = config.getint('tri_acq_ms', default=(1 if self.use_adc else 12), minval=1, maxval=1000)
        self.public_tri_send_ms        = config.getint('tri_send_ms', default=10, minval=1, maxval=1000)
        self.tri_need_cnt       = config.getint('tri_need_cnt', default=1, minval=1, maxval=MAX_PRES_CNT)
        self.tri_hftr_cut       = config.getfloat('tri_hftr_cut', default=2, minval=0.01, maxval=100.)
        self.cal_hftr_cut       = config.getfloat('cal_hftr_cut', default=10, minval=0.01, maxval=100.)
        self.tri_lftr_k1        = config.getfloat('tri_lftr_k1', default=(0.50 if self.use_adc else 0.70), minval=0., maxval=1.)
        self.cal_lftr_k1        = config.getfloat('cal_lftr_k1', default=(0.65 if self.use_adc else 0.85), minval=0., maxval=1.)
        self.tri_min_hold       = config.getint('tri_min_hold', default=(3 if self.use_adc else 2000), minval=1, maxval=200000)
        self.tri_max_hold       = config.getint('tri_max_hold', default=(3072 if self.use_adc else 6000), minval=self.tri_min_hold, maxval=600000)
        # 2. Debug Cfg
        # 3. Shake Z Cfg
        self.shake_cnt          = config.getint('shake_cnt', default=8, minval=1, maxval=512)
        self.shake_range        = config.getint('shake_range', default=0.5, minval=0.1, maxval=2)
        # 4. Clear Nozzle Cfg
        self.hot_min_temp       = config.getfloat('hot_min_temp', default=140, minval=80, maxval=200)
        self.hot_max_temp       = config.getfloat('hot_max_temp', default=200, minval=180, maxval=300)
        self.bed_max_temp       = config.getfloat('bed_max_temp', default=60, minval=45, maxval=100)
        self.pa_clr_dis_mm      = config.getfloat('pa_clr_dis_mm', default=30, minval=2, maxval=100)
        self.pa_clr_down_mm     = config.getfloat('pa_clr_down_mm', default=-0.15, minval=-1, maxval=1)
        self.clr_noz_start_x    = config.getfloat('clr_noz_start_x', default=0, minval=0, maxval=1000)
        self.clr_noz_start_y    = config.getfloat('clr_noz_start_y', default=0, minval=0, maxval=1000)
        self.clr_noz_len_x      = config.getfloat('clr_noz_len_x', default=0, minval=self.pa_clr_dis_mm + 6, maxval=1000)
        self.clr_noz_len_y      = config.getfloat('clr_noz_len_y', default=0, minval=0, maxval=1000)
        self.clr_xy_spd         = config.getfloat('clr_xy_spd', default=2.0, minval=0.1, maxval=10)
        # 5. Speed Cfg
        self.tri_z_down_spd     = config.getfloat('speed', default=(10 if self.use_adc else 2.5), minval=0.1, maxval=(30 if self.use_adc else 5)) # speed
        self.tri_z_up_spd       = config.getfloat('lift_speed', self.tri_z_down_spd * (1.0 if self.use_adc else 2.0), minval=0.1, maxval=100)
        self.rdy_xy_spd         = config.getfloat('rdy_xy_spd', default=(300 if self.use_adc else 200), minval=1, maxval=1000)
        self.rdy_z_spd          = config.getfloat('rdy_z_spd', default=self.tri_z_up_spd, minval=1, maxval=50)
        self.acc_ctl_mm         = config.getfloat('acc_ctl_mm', (0.5 if self.use_adc else 0.25), minval=0, maxval=10)
        self.low_spd_nul        = config.getint('low_spd_nul', 5, minval=1, maxval=10)
        self.send_step_duty     = config.getint('send_step_duty', 16, minval=0, maxval=10)
        self.run_max_velocity   = config.getfloat('run_max_velocity', default=500, minval=1, maxval=5000)
        self.run_max_accel      = config.getfloat('run_max_accel', default=500, minval=1, maxval=50000)
        self.run_max_z_velocity = config.getfloat('run_max_z_velocity', default=20, minval=1, maxval=5000)
        self.run_max_z_accel    = config.getfloat('run_max_z_accel', default=200, minval=1, maxval=50000)
        # 6. Gap Cfg
        self.stored_profs       = config.get_prefix_sections('prtouch')
        self.stored_profs       = self.stored_profs[1] if len(self.stored_profs) == 2 else None
        # 6. Other Cfg
        self.need_self_check    = config.getboolean('need_self_check', default=False)
        self.bed_max_err        = config.getfloat('bed_max_err', (5 if self.use_adc else 3), minval=1, maxval=10)
        self.max_z              = config.getsection('stepper_z').getfloat('position_max', default=300, minval=10, maxval=500)
        self.g29_down_min_z     = config.getfloat('g29_down_min_z', default=25, minval=5, maxval=500)
        self.probe_min_3err     = config.getfloat('probe_min_3err', default=0.1, minval=0.01, maxval=1)
        self.step_base          = config.getint('step_base', 1, minval=1, maxval=10)
        self.g28_wait_cool_down = config.getboolean('g28_wait_cool_down', default=False)
        self.best_above_z       = config.getfloat('best_above_z', default=(3 if self.use_adc else 2), minval=2, maxval=10) # above
        self.safe_z_dead_dis    = config.getfloat('safe_z_dead_dis', default=2, minval=0, maxval=10)
        # 7. Fan Cfg
        self.fan_heat_min_spd   = config.getfloat('fan_heat_min_spd', default=0.3, minval=0, maxval=255)
        self.fan_heat_max_spd   = config.getfloat('fan_heat_max_spd', default=1.0, minval=0, maxval=255)

        self.gcode              = self.printer.lookup_object('gcode')

        self.sys_time_duty      = config.getfloat('sys_time_duty', default=0.001, minval=0.00001, maxval=0.010)
        self.is_corexz          = str(config.getsection('printer').get('kinematics')) == 'corexz'
        # 1. Load Swap Pins
        self.step_swap_pin = config.get('step_swap_pin')
        self.pres_swap_pin = config.get('pres_swap_pin')
        # 1. Load Pres Pins
        self.pres_cnt = config.getint('pres_cnt', 1, 1, MAX_PRES_CNT)
        self.pres_clk_pins, self.pres_sdo_pins, self.pres_adc_pins = [], [], []
        for i in range(self.pres_cnt):
            if self.use_adc:
                self.pres_adc_pins.append(config.get('pres%d_adc_pins' % i))
            else:
                self.pres_clk_pins.append(config.get('pres%d_clk_pins' % i))
                self.pres_sdo_pins.append(config.get('pres%d_sdo_pins' % i))
        # 2. Load Step Pins
        self.z_step_pins, self.z_dir_pins = [], []
        for s in ['stepper_z', 'stepper_x' if self.is_corexz else 'stepper_z1', 'stepper_z2', 'stepper_z3']:
            if config.has_section(s):
                sec = config.getsection(s)
                self.z_step_pins.append(sec.get('step_pin'))
                self.z_dir_pins.append(sec.get('dir_pin'))
        # 3. Creat Step And Pres Oid
        self.ppins = self.printer.lookup_object('pins')
        self.step_mcu, self.pres_mcu = self.ppins.chips['mcu'], self.ppins.chips['mcu']
        if self.step_swap_pin and self.pres_swap_pin:
            self.step_mcu = self.ppins.parse_pin(self.step_swap_pin, True, True)['chip']
            self.pres_mcu = self.ppins.parse_pin(self.pres_swap_pin, True, True)['chip']
        self.public_step_oid, self.public_pres_oid = self.step_mcu.create_oid(), self.pres_mcu.create_oid()

        self.step_mcu.register_config_callback(self._build_step_config)
        self.pres_mcu.register_config_callback(self._build_pres_config)

        self.gcode.register_command('PRTOUCH_READY', self.cmd_PRTOUCH_READY, desc=self.cmd_PRTOUCH_READY_help)
        self.gcode.register_command('NOZZLE_CLEAR', self.cmd_NOZZLE_CLEAR, desc=self.cmd_NOZZLE_CLEAR_help)
        self.gcode.register_command('SAFE_DOWN_Z', self.cmd_SAFE_DOWN_Z, desc=self.cmd_SAFE_DOWN_Z_help)
        self.gcode.register_command('SAFE_MOVE_Z', self.cmd_SAFE_MOVE_Z, desc=self.cmd_SAFE_MOVE_Z_help)
        self.gcode.register_command('COARSE_HOME_Z', self.cmd_COARSE_HOME_Z, desc=self.cmd_COARSE_HOME_Z_help)
        self.gcode.register_command('SELF_CHECK_PRTOUCH', self.cmd_SELF_CHECK_PRTOUCH, desc=self.cmd_SELF_CHECK_PRTOUCH_help)
        self.gcode.register_command('START_STEP_PRTOUCH', self.cmd_START_STEP_PRTOUCH, desc=self.cmd_START_STEP_PRTOUCH_help)

        self.step_mcu.register_response(self._handle_result_run_step_prtouch, "result_run_step_prtouch", self.public_step_oid)
        self.pres_mcu.register_response(self._handle_result_run_pres_prtouch, "result_run_pres_prtouch", self.public_pres_oid)
        self.pres_mcu.register_response(self._handle_result_read_pres_prtouch, "result_read_pres_prtouch", self.public_pres_oid)

    def _build_step_config(self):
        self.bed_mesh   = self.printer.lookup_object('bed_mesh')
        self.toolhead   = self.printer.lookup_object("toolhead")
        self.pheaters   = self.printer.lookup_object('heaters')
        self.heater_hot = self.printer.lookup_object('extruder').heater
        self.heater_bed = self.printer.lookup_object('heater_bed').heater

        min_x, min_y = self.bed_mesh.bmc.mesh_min
        max_x, max_y = self.bed_mesh.bmc.mesh_max

        if self.clr_noz_start_x <= 0 or self.clr_noz_start_y <= 0 or self.clr_noz_len_x <= 0 or self.clr_noz_len_y <= 0:
            self.clr_noz_start_x = (max_x - min_x) * 1 / 3 + min_x
            self.clr_noz_start_y = max_y - 6
            self.clr_noz_len_x = (max_x - min_x) * 1 / 3
            self.clr_noz_len_y = 5

        random.seed(time.time())
        self.rdy_pos = [[min_x, min_y, self.bed_max_err], [min_x, max_y, self.bed_max_err],
                        [max_x, max_y, self.bed_max_err], [max_x, min_y, self.bed_max_err]]

        self.step_mcu.add_config_cmd('config_step_prtouch oid=%d step_cnt=%d swap_pin=%s sys_time_duty=%u'
                                     % (self.public_step_oid, len(self.z_step_pins), self.ppins.parse_pin(self.step_swap_pin, True, True)['pin'], int(self.sys_time_duty * 100000)))

        for i in range(len(self.z_step_pins)):
            step_par = self.ppins.parse_pin(self.z_step_pins[i], True, True)
            dir_par = self.ppins.parse_pin(self.z_dir_pins[i], True, True)
            if self.is_corexz:
                if i == 0:
                    self.step_mcu.add_config_cmd('add_step_prtouch oid=%d index=%d dir_pin=%s step_pin=%s dir_invert=%d step_invert=%d' % (self.public_step_oid, i, dir_par['pin'], step_par['pin'], not dir_par['invert'], step_par['invert']))
                else:
                    self.step_mcu.add_config_cmd('add_step_prtouch oid=%d index=%d dir_pin=%s step_pin=%s dir_invert=%d step_invert=%d' % (self.public_step_oid, i, dir_par['pin'], step_par['pin'], dir_par['invert'], step_par['invert']))
            else:
                self.step_mcu.add_config_cmd('add_step_prtouch oid=%d index=%d dir_pin=%s step_pin=%s dir_invert=%d step_invert=%d' % (self.public_step_oid, i, dir_par['pin'], step_par['pin'], dir_par['invert'], step_par['invert']))

        self.public_read_swap_prtouch_cmd = self.step_mcu.lookup_query_command('read_swap_prtouch oid=%c', 'result_read_swap_prtouch oid=%c sta=%c', oid=self.public_step_oid)
        self.public_start_step_prtouch_cmd = self.step_mcu.lookup_command('start_step_prtouch oid=%c dir=%c send_ms=%c step_cnt=%u step_us=%u acc_ctl_cnt=%u low_spd_nul=%c send_step_duty=%c auto_rtn=%c', cq=None)
        self.manual_get_steps_cmd = self.step_mcu.lookup_query_command('manual_get_steps oid=%c index=%c', 'result_manual_get_steps oid=%c index=%c tri_time=%u tick0=%u tick1=%u tick2=%u tick3=%u step0=%u step1=%u step2=%u step3=%u', oid=self.public_step_oid)

    def _build_pres_config(self):
        self.pres_mcu.add_config_cmd('config_pres_prtouch oid=%d use_adc=%d pres_cnt=%d swap_pin=%s sys_time_duty=%u'
                                     % (self.public_pres_oid, self.use_adc, self.pres_cnt, self.ppins.parse_pin(self.pres_swap_pin, True, True)['pin'], int(self.sys_time_duty * 100000)))
        for i in range(self.pres_cnt):
            if self.use_adc:
                adc_par = self.ppins.parse_pin(self.pres_adc_pins[i], True, True)
                self.pres_mcu.add_config_cmd('add_pres_prtouch oid=%d index=%d clk_pin=%s sda_pin=%s' % (self.public_pres_oid, i, adc_par['pin'], adc_par['pin']))
            else:
                clk_par = self.ppins.parse_pin(self.pres_clk_pins[i], True, True)
                sdo_par = self.ppins.parse_pin(self.pres_sdo_pins[i], True, True)
                self.pres_mcu.add_config_cmd('add_pres_prtouch oid=%d index=%d clk_pin=%s sda_pin=%s' % (self.public_pres_oid, i, clk_par['pin'], sdo_par['pin']))

        self.public_write_swap_prtouch_cmd = self.pres_mcu.lookup_query_command('write_swap_prtouch oid=%c sta=%c', 'resault_write_swap_prtouch oid=%c', oid=self.public_pres_oid)
        self.read_pres_prtouch_cmd = self.pres_mcu.lookup_command('read_pres_prtouch oid=%c acq_ms=%u cnt=%u', cq=None)
        self.start_pres_prtouch_cmd = self.pres_mcu.lookup_command('start_pres_prtouch oid=%c tri_dir=%c acq_ms=%c send_ms=%c need_cnt=%c tri_hftr_cut=%u tri_lftr_k1=%u min_hold=%u max_hold=%u', cq=None)
        self.deal_avgs_prtouch_cmd = self.pres_mcu.lookup_query_command('deal_avgs_prtouch oid=%c base_cnt=%c', 'result_deal_avgs_prtouch oid=%c ch0=%i ch1=%i ch2=%i ch3=%i', oid=self.public_pres_oid)

        self.manual_get_pres_cmd = self.pres_mcu.lookup_query_command('manual_get_pres oid=%c index=%c', 'resault_manual_get_pres oid=%c index=%c tri_time=%u tri_chs=%c buf_cnt=%u tick_0=%u ch0_0=%i ch1_0=%i ch2_0=%i ch3_0=%i tick_1=%u ch0_1=%i ch1_1=%i ch2_1=%i ch3_1=%i', oid=self.public_pres_oid)

    def _handle_result_run_step_prtouch(self, params):
        self.step_tri_time = params['tri_time'] / 10000.
        for i in range(4):
            sdir = {'tick': params['tick%d' % i] / 10000., 'step': params['step%d' % i], 'index': params['index']}
            self.public_step_res.append(sdir)
        if self.safe_move_z_tri_call_back is not None and len(self.public_step_res) == MAX_BUF_LEN:
            run_dis = (self.safe_move_z_all_cnt - self.public_step_res[-1]['step']) * self.mm_per_step
            self.safe_move_z_tri_call_back(run_dis)
            self.safe_move_z_tri_call_back = None
            self._print_msg('SAFE_MOVE_Z', 'tri_dis = %f' % run_dis, True)

    def _handle_result_run_pres_prtouch(self, params):
        self.pres_tri_time = params['tri_time'] / 10000.
        self.pres_tri_chs = params['tri_chs']
        self.pres_buf_cnt = params['buf_cnt']
        for i in range(2):
            rdir = {'tick':params['tick_%d' % i] / 10000., 'ch0':params['ch0_%d' % i], 'ch1':params['ch1_%d' % i], 'ch2':params['ch2_%d' % i], 'ch3':params['ch3_%d' % i], 'index': params['index']}
            self.pres_res.append(rdir)

    def _handle_result_read_pres_prtouch(self, params):
        self.pres_res.append(params)

    def _print_msg(self, title, msg, force=False):
        logging.info('[%s] %s' , title, msg)
        if force and title != 'SHOW_WAVE':
            self.gcode.respond_info('[' + title + ']' + msg)

    def _print_ary(self, title, ary, lent=32, pt_cnt=2, force=False):
        st = '['
        for i in range(len(ary) - lent, len(ary)):
            st = st + ("%." + ("%df, " % pt_cnt)) % (ary[i])
        st += ']'
        logging.info('[%s] %s' , title, st)
        if force:
            self._print_msg(title, st, force)

    def _print_res(self):
        t_buf, p_buf = [], []
        for i in range(len(self.public_step_res)):
            t_buf.append(self.public_step_res[i]['tick'])
            p_buf.append(self.public_step_res[i]['step'])
        self._print_ary('STEP_TICK', t_buf, len(t_buf))
        self._print_ary('STEP_DATA', p_buf, len(p_buf))

        t_buf, p_buf = [], [[], [], [], []]
        for i in range(len(self.pres_res)):
            t_buf.append(self.pres_res[i]['tick'])
            for j in range(self.pres_cnt):
                p_buf[j].append(self.pres_res[i]['ch%d' % j])

        self._print_ary('PRES_TICK', t_buf, len(t_buf))
        for i in range(self.pres_cnt):
            self._send_wave_tri(i, p_buf[i])
            self._print_ary('PRES_CH%d' % i, p_buf[i], len(p_buf[i]))

    def _ck_and_raise_error(self, ck, err, vals=[]):
        if not ck:
            return
        self.public_enable_steps()
        now_pos = self.toolhead.get_position()
        step_cnt, step_us, acc_ctl_cnt = self.public_get_step_cnts(self.g29_down_min_z, self.tri_z_down_spd)
        self.public_start_step_prtouch_cmd.send([self.public_step_oid, 1, self.public_tri_send_ms, step_cnt, step_us, acc_ctl_cnt, self.low_spd_nul, self.send_step_duty, 0])
        t_last = time.time()
        while (time.time() - t_last < 20) and (len(self.public_step_res) != MAX_BUF_LEN):
            self._delay_s(0.010)
        self.public_start_step_prtouch_cmd.send([self.public_step_oid, 0, 0, 0, 0, 0, self.low_spd_nul, self.send_step_duty, 0])
        self.toolhead.set_position(now_pos[:2] + [0, now_pos[3]], homing_axes=[2])

        self.public_disable_steps()
        msg = err % tuple(vals)
        self._print_msg('RAISE_ERROR', msg, True)
        shutdown_msg = 'Shutdown due to ' + msg
        self.printer.invoke_shutdown(shutdown_msg)
        raise self.printer.command_error(shutdown_msg)

    def _send_wave_tri(self, ch, ary):
        msg = '%d' % ch
        for i in range(len(ary)):
            msg += ',%d' % ary[i]
        self._print_msg('SHOW_WAVE', msg)

    def _delay_s(self, delay_s):
        reactor = self.printer.get_reactor()
        eventtime = reactor.monotonic()
        if not self.printer.is_shutdown():
            self.toolhead.get_last_move_time()
            eventtime = reactor.pause(eventtime + delay_s)

    def _ck_g28ed(self):
        for i in range(3):
            if self.toolhead.kin.limits[i][0] > self.toolhead.kin.limits[i][1]:
                self.gcode.run_script_from_command('G28')
                break

    def _set_step_par(self, load_sys=True):
        if load_sys:
            self.toolhead.max_velocity = self.sys_max_velocity
            self.toolhead.max_accel = self.sys_max_accel
            self.toolhead.kin.max_z_velocity = self.sys_max_z_velocity
            self.toolhead.kin.max_z_accel = self.sys_max_z_accel
            self.has_save_sys_acc = False
            return
        if not self.has_save_sys_acc:
            self.sys_max_velocity = self.toolhead.max_velocity
            self.sys_max_accel = self.toolhead.max_accel
            self.sys_max_z_velocity = self.toolhead.kin.max_z_velocity
            self.sys_max_z_accel = self.toolhead.kin.max_z_accel

            self.toolhead.max_velocity = self.run_max_velocity
            self.toolhead.max_accel = self.run_max_accel
            self.toolhead.kin.max_z_velocity = self.run_max_z_velocity
            self.toolhead.kin.max_z_accel = self.run_max_z_accel
            self.has_save_sys_acc = True

    def public_enable_steps(self):
        self._print_msg('ENABLE_STEPS', 'Start enable_steps()...')
        for stepper in self.toolhead.get_kinematics().get_steppers():
            print_time = self.toolhead.get_last_move_time()
            stepper_enable = self.printer.lookup_object('stepper_enable')
            enable = stepper_enable.lookup_enable(stepper.get_name())
            was_enable = enable.is_motor_enabled()
            if not was_enable:
                enable.motor_enable(print_time)
                self.toolhead.dwell(0.100)
                self._delay_s(0.5)

    def public_disable_steps(self):
        self._print_msg('DISABLE_STEPS', 'Start disable_steps()...')
        for stepper in self.toolhead.get_kinematics().get_steppers():
            print_time = self.toolhead.get_last_move_time()
            stepper_enable = self.printer.lookup_object('stepper_enable')
            enable = stepper_enable.lookup_enable(stepper.get_name())
            was_enable = enable.is_motor_enabled()
            if was_enable:
                enable.motor_disable(print_time)
                self.toolhead.dwell(0.100)
                self._delay_s(0.5)

    def public_move(self, pos, speed, wait=True):

        if not self.shut_down:
            gcmd = 'G1 F%d X%.3f Y%.3f Z%.3f' % (speed * 60, pos[0], pos[1], pos[2]) if len(pos) >= 3 else 'G1 F%d X%.3f Y%.3f' % (speed * 60, pos[0], pos[1])
            self._print_msg('PRTOUCH_MOVE', 'Start Move, gcmd=' + gcmd)
            self.gcode.run_script_from_command(gcmd)
            if wait:
                self.toolhead.wait_moves()

    def _set_fan_speed(self, fan_name='None', fan_spd=0.):
        self._print_msg('SET_FAN_SPEED', 'fan_name=%s, fan_spd=%f' % (fan_name, fan_spd))
        if fan_name == 'heater_fan':
            for key in self.printer.objects:
                if 'heater_fan' in key:
                    self.printer.objects[key].fan.set_speed_from_command(fan_spd)
                    break

        if fan_name == 'fan':
            if 'fan' in self.printer.objects:
                self.printer.lookup_object('fan').fan.set_speed_from_command(fan_spd)
            else:
                self.gcode.run_script_from_command('M106 P0 S%d' % (fan_spd * 255))

    def _set_hot_temps(self, temp, wait=False, err=5):
        self._print_msg('SET_HOT_TEMPS', 'temp=%.2f, wait=%d, err=%f'% (temp, wait, err))
        self.pheaters.set_temperature(self.heater_hot, temp, False)
        if wait:
            while not self.shut_down and abs(self.heater_hot.target_temp - self.heater_hot.smoothed_temp) > err and self.heater_hot.target_temp > 0:
                self._delay_s(0.100)

    def _set_bed_temps(self, temp, wait=False, err=5):
        self._print_msg('SET_BED_TEMPS', 'temp=%.2f, wait=%d, err=%f'% (temp, wait, err))
        self.pheaters.set_temperature(self.heater_bed, temp, False)
        if wait:
            while not self.shut_down and abs(self.heater_bed.target_temp - self.heater_bed.smoothed_temp) > err and self.heater_bed.target_temp > 0:
                self._delay_s(0.100)

    def _shake_motor(self, cnt):
        self._print_msg('SHAKE_MOTOR', 'cnt=%d' % cnt)
        now_pos = self.toolhead.get_position()
        max_z_velocity = self.toolhead.kin.max_z_velocity
        for _ in range(int(cnt / 2)):
            self.gcode.run_script_from_command('G1 X%.2f Y%.2f Z%.2f F%d' % (now_pos[0] - self.shake_range, now_pos[1] - self.shake_range, now_pos[2] - self.shake_range / 2, int(60 * max_z_velocity * 0.25)))
            self.gcode.run_script_from_command('G1 X%.2f Y%.2f Z%.2f F%d' % (now_pos[0] + self.shake_range, now_pos[1] - self.shake_range, now_pos[2] + self.shake_range / 2, int(60 * max_z_velocity * 0.25)))
            self.gcode.run_script_from_command('G1 X%.2f Y%.2f Z%.2f F%d' % (now_pos[0] + self.shake_range, now_pos[1] + self.shake_range, now_pos[2] - self.shake_range / 2, int(60 * max_z_velocity * 0.25)))
            self.gcode.run_script_from_command('G1 X%.2f Y%.2f Z%.2f F%d' % (now_pos[0] - self.shake_range, now_pos[1] + self.shake_range, now_pos[2] + self.shake_range / 2, int(60 * max_z_velocity * 0.25)))
            while len(self.toolhead.move_queue.queue) >= 5:
                self._delay_s(0.010)
        self.public_move(now_pos, self.rdy_z_spd)

    def _ck_and_manual_get_step(self):
        if len(self.public_step_res) == MAX_BUF_LEN:
            return
        self._ck_and_raise_error(len(self.public_step_res) < MAX_BUF_LEN / 4, ERR_STEP_LOST_RUN_DATA, [len(self.public_step_res)])
        self._print_msg('CK_AND_MANUAL_GET_STEP', 'need=%d, recv=%d' % (MAX_BUF_LEN, len(self.public_step_res)))

        for i in range(0, MAX_BUF_LEN, 4):
            if len(self.public_step_res) > i and self.public_step_res[i]['index'] == i:
                continue
            self._print_msg('CK_AND_MANUAL_GET_STEP', 'Re trans index=%d' % i)
            params = self.manual_get_steps_cmd.send([self.public_step_oid, i])
            self.step_tri_time = params['tri_time'] / 10000.
            for j in range(4):
                sdir = {'tick': params['tick%d' % j] / 10000., 'step': params['step%d' % j], 'index': params['index']}
                self.public_step_res.insert(i + j, sdir)

        self._ck_and_raise_error(len(self.public_step_res) != MAX_BUF_LEN, ERR_STEP_LOST_RUN_DATA, [len(self.public_step_res)])

    def _ck_and_manual_get_pres(self):
        if len(self.pres_res) == MAX_BUF_LEN:
            return
        self._ck_and_raise_error(len(self.pres_res) < MAX_BUF_LEN / 4, ERR_PRES_LOST_RUN_DATA, [len(self.pres_res)])

        self._print_msg('CK_AND_MANUAL_GET_PRES', 'need=%d, recv=%d' % (MAX_BUF_LEN, len(self.pres_res)))
        for i in range(0, MAX_BUF_LEN, 2):
            if len(self.pres_res) > i and self.pres_res[i]['index'] == i:
                continue
            self._print_msg('CK_AND_MANUAL_GET_PRES', 'Re trans index=%d' % i)
            params = self.manual_get_pres_cmd.send([self.public_step_oid, i])
            self.pres_tri_time = params['tri_time'] / 10000.
            self.pres_tri_chs = params['tri_chs']
            self.pres_buf_cnt = params['buf_cnt']
            for j in range(2):
                rdir = {'tick':params['tick_%d' % j] / 10000., 'ch0': params['ch0_%d' % j], 'ch1': params['ch1_%d' % j], 'ch2': params['ch2_%d' % j], 'ch3': params['ch3_%d' % j], 'index': params['index']}
                self.pres_res.insert(i + j, rdir)

        self._ck_and_raise_error(len(self.pres_res) != MAX_BUF_LEN, ERR_PRES_LOST_RUN_DATA, [len(self.pres_res)])

    def _get_valid_ch(self):
        now_pos = self.toolhead.get_position()
        min_x, min_y = self.bed_mesh.bmc.mesh_min
        max_x, max_y = self.bed_mesh.bmc.mesh_max
        l_chs = []
        l_chs.append(math.sqrt((now_pos[0] - min_x) ** 2 + (now_pos[1] - min_y) ** 2) if (self.pres_tri_chs & 0x01) else max_x * max_y * 2)
        l_chs.append(math.sqrt((now_pos[0] - max_x) ** 2 + (now_pos[1] - min_y) ** 2) if (self.pres_tri_chs & 0x02) else max_x * max_y * 2)
        l_chs.append(math.sqrt((now_pos[0] - min_x) ** 2 + (now_pos[1] - max_y) ** 2) if (self.pres_tri_chs & 0x04) else max_x * max_y * 2)
        l_chs.append(math.sqrt((now_pos[0] - max_y) ** 2 + (now_pos[1] - max_y) ** 2) if (self.pres_tri_chs & 0x08) else max_x * max_y * 2)
        valid_ch = l_chs.index(min(l_chs))
        self._print_msg('VALID_CH', 'Tri_mark=%d best_ch=%d Chs=' % (self.pres_tri_chs, valid_ch) + '  ' + str(l_chs))
        return l_chs

    def _cal_tri_data(self, start_step, start_pos_z, step_res, pres_res, oft_z=0):

        # 0. Send Debut Msg.
        self._print_res()
        # 1. Get Best Tri Ch
        max_x, max_y = self.bed_mesh.bmc.mesh_max
        l_chs = self._get_valid_ch()
        out_mms = []
        for valid_ch in range(len(l_chs)):
            if l_chs[valid_ch] == max_x * max_y * 2:
                continue
            # 2. Copy Pres Tick And Data.
            pres_t_buf, pres_d_buf = [], []
            for i in range(len(pres_res)):
                pres_t_buf.append(pres_res[i]['tick'] - self.pres_tri_time)
                pres_d_buf.append(pres_res[i]['ch%d' % valid_ch])

            # 3. Copy Step Tick And Data.
            step_t_buf, step_d_buf = [], []
            for i in range(len(step_res)):
                step_t_buf.append(step_res[i]['tick'] - self.step_tri_time)
                step_d_buf.append(step_res[i]['step'])

            # 4. Filter The Pres Data
            if not self.use_adc:
                for i in range(len(pres_d_buf) - 2):
                    d3_abs = [math.fabs(pres_d_buf[i]), math.fabs(pres_d_buf[i+1]), math.fabs(pres_d_buf[i+2])]
                    pres_d_buf[i] = pres_d_buf[i + d3_abs.index(min(d3_abs))]

                rc = 1. / 2. / math.pi / self.cal_hftr_cut
                coff = rc / (rc + 1. / (1000 / self.tri_acq_ms))
                _pres_d_buf = list(pres_d_buf)
                pres_d_buf = [0]

                for i in range(1, len(_pres_d_buf)):
                    pres_d_buf.append((_pres_d_buf[i] - _pres_d_buf[i - 1] + pres_d_buf[-1]) * coff)

            for i in range(1, len(pres_d_buf)):
                pres_d_buf[i] = pres_d_buf[i - 1] * (1 - self.cal_lftr_k1) + pres_d_buf[i] * self.cal_lftr_k1
            self._print_ary('CAL_TRI_DATA_FILTER_CH%d' % valid_ch, pres_d_buf, len(pres_d_buf), 0)

            # 5. Cal The Pres Tri Index And Tick
            vals_p = list(pres_d_buf)
            min_val, max_val = min(vals_p), max(vals_p)
            for i in range(len(vals_p)):
                vals_p[i] = (vals_p[i] - min_val) / (max_val - min_val)
            angle = math.atan((vals_p[-1] - vals_p[0]) / len(vals_p))
            sin_angle, cos_angle = math.sin(-angle), math.cos(-angle)
            for i in range(len(vals_p)):
                vals_p[i] = (i - 0) * sin_angle + (vals_p[i] - 0) * cos_angle + 0
            pres_tri_index = vals_p.index(min(vals_p))
            pres_tri_tick = pres_t_buf[pres_tri_index]
            # 6. Cal The Step Tri Index And Tick
            step_tri_index = MAX_BUF_LEN - 1
            step_tri_tick = step_t_buf[step_tri_index]
            for i in range(len(step_t_buf) - 1):
                if ((step_t_buf[i] <= pres_tri_tick <= step_t_buf[i + 1]) or (step_t_buf[i] == pres_tri_tick)) and step_d_buf[i] != 0:
                    step_tri_index = i
                    step_tri_tick = step_t_buf[step_tri_index]
                    break
            out_step = step_d_buf[-1]
            if 0 < step_tri_index < len(step_res) - 1:
                out_step = step_d_buf[step_tri_index] + (step_d_buf[step_tri_index + 1] - step_d_buf[step_tri_index]) * (pres_tri_tick - step_tri_tick) / (step_t_buf[step_tri_index + 1] - step_t_buf[step_tri_index])
            out_val_mm = start_pos_z - (start_step - out_step) * self.mm_per_step + oft_z
            self._print_msg('TRI_PRES_MSG', 'start_pres=%d, tri_pres=%d, end_pres=%d, pres_tri_index=%d, pres_tri_tick=%.3f' % (pres_d_buf[0], pres_d_buf[pres_tri_index], pres_d_buf[-1], pres_tri_index, pres_tri_tick))
            self._print_msg('TRI_STEP_MSG', 'start_step=%d, tri_step=%d, end_step=%d, step_tri_index=%d, step_tri_tick=%.3f' % (start_step,    out_step,                   step_d_buf[-1], step_tri_index, step_tri_tick))
            self._print_msg('TRI_OUT_MM', 'mm_pre_step=%f, out_mm=%f' % (self.mm_per_step, out_val_mm))
            out_mms.append(out_val_mm)
        self._print_ary('OUT_MMS', out_mms, len(out_mms), 2)
        return sum(out_mms) / len(out_mms) # out_val_mm

    def public_get_step_cnts(self, run_dis, run_spd):
        if not self.mm_per_step:
            self.public_get_mm_per_step()
        step_cnt = int(run_dis / self.mm_per_step)
        step_us = int(((run_dis / run_spd) * 1000 * 1000) / step_cnt)
        acc_ctl_cnt = int(self.acc_ctl_mm / self.mm_per_step)
        self._print_msg('GET_STEP_CNTS', 'run_dis=%.2f, run_spd=%.2f, step_cnt=%d, step_us=%d acc_ctl_cnt=%d' % (run_dis, run_spd, step_cnt, step_us, acc_ctl_cnt))
        return step_cnt, step_us, acc_ctl_cnt

    def public_get_mm_per_step(self):
        if self.mm_per_step:
            return
        for stepper in self.toolhead.get_kinematics().get_steppers():
            if stepper.is_active_axis('z'):
                self.mm_per_step = self.step_base * stepper.get_step_dist()
                self._print_msg('GET_MM_PER_STEP', str(stepper.get_step_dist()))

    def _env_self_check(self, force=False):
        # 1. PR_ERR_CODE_SWAP_PIN_DETECTI
        self.public_write_swap_prtouch_cmd.send([self.public_pres_oid, 0])
        params0 = self.public_read_swap_prtouch_cmd.send([self.public_step_oid])
        self.public_write_swap_prtouch_cmd.send([self.public_pres_oid, 1])
        params1 = self.public_read_swap_prtouch_cmd.send([self.public_step_oid])
        self._ck_and_raise_error(not params0 or not params1 or params0['sta'] != 0 or params1['sta'] != 1,
                                ERR_SWAP_PIN_DETECTI, [self.pres_swap_pin, self.step_swap_pin])
        self._print_msg('DEBUG', '--Self Test 1 = PR_ERR_CODE_SWAP_PIN_DETECTI, Pass!!--', force)

        if not self.need_self_check and not force:
            return

        # 2. PR_ERR_CODE_PRES_READ_DATA_TIMEOUT
        self.deal_avgs_prtouch_cmd.send([self.public_pres_oid, 0])
        self.pres_res = []
        self.read_pres_prtouch_cmd.send([self.public_pres_oid, self.tri_acq_ms, 32 + 8])
        start_tick_s = time.time()
        while ((time.time() - start_tick_s) < (1.5 * (self.tri_acq_ms / 1000.) * 64)) and len(self.pres_res) < 32:
            self._delay_s(0.010)
        self.read_pres_prtouch_cmd.send([self.public_pres_oid, self.tri_acq_ms, 0])
        self._ck_and_raise_error(len(self.pres_res) < 32, ERR_PRES_READ_DATA_TIMEOUT, [32, len(self.pres_res)])

        pnt_tick, pnt_vals = [], [[], [], [], []]
        for i in range(4, len(self.pres_res) - 4):
            pnt_tick.append(self.pres_res[i]['tick'] / 10000.)
            for j in range(self.pres_cnt):
                pnt_vals[j].append(self.pres_res[i]['ch%d' % j])
        tr = 0
        for i in range(1, len(pnt_tick)):
            tr += pnt_tick[i] - pnt_tick[i - 1]
        self._print_msg('SELF_CHECK_TICK', str(pnt_tick))
        self._print_msg('SELF_CHECK_DATA', str(pnt_vals))
        self._ck_and_raise_error(tr / (len(pnt_tick) - 1) > 2 * self.tri_acq_ms, ERR_PRES_READ_DATA_TIMEOUT, [self.tri_acq_ms, tr / (len(pnt_tick) - 1)])
        self._print_msg('DEBUG', '--Self Test 2 = PR_ERR_CODE_PRES_READ_DATA_TIMEOUT, Pass!!--', force)

        # 3. PR_ERR_CODE_PRES_VAL_IS_CONSTANT
        for i in range(self.pres_cnt):
            sums, avg = 0, sum(pnt_vals[i]) / len(pnt_vals[i])
            for j in range(len(pnt_vals[i])):
                pnt_vals[i][j] -= avg
                sums += math.fabs(pnt_vals[i][j])
            self._ck_and_raise_error(not sums, ERR_PRES_VAL_IS_CONSTANT)
        self._print_msg('DEBUG', '--Self Test 3 = PR_ERR_CODE_PRES_VAL_IS_CONSTANT, Pass!!--', force)

        # 4. PR_ERR_CODE_PRES_NOISE_TOO_BIG
        for i in range(self.pres_cnt):
            big_cnt = 0
            for j in range(len(pnt_vals[i])):
                big_cnt += (1 if math.fabs(pnt_vals[i][j]) > (self.tri_min_hold if not self.use_adc else 200) else 0)
            self._ck_and_raise_error(big_cnt > len(pnt_vals[i]) / 2, ERR_PRES_NOISE_TOO_BIG)
        self._print_msg('DEBUG', '--Self Test 4 = PR_ERR_CODE_PRES_NOISE_TOO_BIG, Pass!!--', force=force)

        # 4. PR_ERR_CODE_PRES_NOT_BE_SENSED
        self.public_enable_steps()
        self.deal_avgs_prtouch_cmd.send([self.public_pres_oid, 16])
        now_pos = self.toolhead.get_position()
        self.toolhead.set_position(now_pos[:2] + [0, now_pos[3]], homing_axes=[2])
        self.pres_res = []
        self.read_pres_prtouch_cmd.send([self.public_pres_oid, self.tri_acq_ms, 32 + 8])
        self._shake_motor(self.shake_cnt)
        while ((time.time() - start_tick_s) < (1.5 * (self.tri_acq_ms / 1000.) * 64)) and len(self.pres_res) < 32:
            self._delay_s(0.010)
        self.read_pres_prtouch_cmd.send([self.public_pres_oid, self.tri_acq_ms, 0])
        self._ck_and_raise_error(len(self.pres_res) < 32, ERR_PRES_READ_DATA_TIMEOUT, [32, len(self.pres_res)])
        pnt_tick, pnt_vals = [], [[], [], [], []]
        for i in range(4, len(self.pres_res) - 4):
            pnt_tick.append(self.pres_res[i]['tick'] / 10000.)
            for j in range(self.pres_cnt):
                pnt_vals[j].append(self.pres_res[i]['ch%d' % j])
        for i in range(self.pres_cnt):
            low_cnt = 0
            for j in range(len(pnt_vals[i])):
                low_cnt += (1 if abs(pnt_vals[i][j]) < (200 if self.use_adc else 500) else 0)
            self._ck_and_raise_error(low_cnt > len(pnt_vals[i]) / 2, ERR_PRES_NOT_BE_SENSED)
        self._print_msg('DEBUG', '--Self Test 5 = PR_ERR_CODE_PRES_NOT_BE_SENSED, Pass!!--', force)

    def _probe_ready(self):
        self._print_msg('PROBE_READY', 'Start probe_ready()...')
        if self.jump_probe_ready:
            self.jump_probe_ready = False
            return False
        self._ck_g28ed()
        for i in range(len(self.rdy_pos)):
            self.rdy_pos[i][2] = self.bed_max_err
        now_pos = self.toolhead.get_position()
        self.public_move(now_pos[:2] + [self.bed_max_err, now_pos[3]], self.rdy_z_spd)
        for i in range(4):
            self._print_msg('PROBE_READY', 'Start Probe Point=%s' % str(self.rdy_pos[i]))
            self.public_move(self.rdy_pos[i], self.rdy_xy_spd)
            self.rdy_pos[i][2] = self.public_run_step_prtouch(self.g29_down_min_z, self.probe_min_3err, True, 5, 3, True)
        self._print_msg('RDY_POS', "[00=%.2f, 01=%.2f, 11=%.2f, 10=%.2f]" % (self.rdy_pos[0][2], self.rdy_pos[1][2], self.rdy_pos[2][2], self.rdy_pos[3][2]))
        return True

    def _safe_move_z(self, run_sta, run_dis, run_spd, run_rdo, tri_call_back = None):
        self._print_msg('SAFE_MOVE_Z', 'run_sta=%d, run_dis=%f, run_spd=%f, run_rdo=%f' % (run_sta, run_dis, run_spd, run_rdo))
        run_dir = 1 if run_dis > 0 else 0
        run_dis = math.fabs(run_dis)

        self.safe_move_z_tri_call_back = tri_call_back

        self.public_start_step_prtouch_cmd.send([self.public_step_oid, run_dir, 0, 0, 0, 0, self.low_spd_nul, self.send_step_duty, 0])
        self.start_pres_prtouch_cmd.send([self.public_pres_oid, run_dir, 0, 0, 0, 0, 0, 0, 0])

        if run_sta == 1:
            self.public_step_res, self.pres_res = [], []
            self.public_enable_steps()
            if run_spd == 0 or run_dis == 0 or run_rdo == 0:
                return

            self.deal_avgs_prtouch_cmd.send([self.public_pres_oid, 8])
            step_cnt, step_us, acc_ctl = self.public_get_step_cnts(run_dis, run_spd)

            if step_cnt == 0 or step_us == 0 or acc_ctl == 0:
                return
            self.safe_move_z_all_cnt = step_cnt
            self.start_pres_prtouch_cmd.send([self.public_pres_oid, run_dir, self.tri_acq_ms, self.public_tri_send_ms, self.tri_need_cnt,
                                              int(self.tri_hftr_cut * 1000), int(self.tri_lftr_k1 * 1000) if self.use_adc else int(self.tri_lftr_k1 * 1000 / run_rdo),
                                              self.tri_min_hold if self.use_adc else int(self.tri_min_hold * run_rdo), self.tri_max_hold if self.use_adc else int(self.tri_max_hold * run_rdo)])
            self.public_start_step_prtouch_cmd.send([self.public_step_oid, run_dir, self.public_tri_send_ms, step_cnt, step_us, acc_ctl, self.low_spd_nul, self.send_step_duty, 0])

    def public_run_step_prtouch(self, down_min_z, probe_min_3err, rt_last=False, pro_cnt=3, crt_cnt=3, fast_probe=False, tri_min_hold=None, tri_max_hold=None):
        if not tri_min_hold or not tri_max_hold:
            tri_min_hold = self.tri_min_hold
            tri_max_hold = self.tri_max_hold
        tri_base_radio = 1.0
        res_z = []
        now_pos = self.toolhead.get_position()
        lost_min_cnt = 0
        self._print_msg('RUN_STEP_PRTOUCH', 'down_min_z=%f, probe_min_3err=%f, rt_last=%d, pro_cnt=%d, crt_cnt=%d, fast_probe=%d, tri_min_hold=%d, tri_max_hold=%d' %
                       (down_min_z, probe_min_3err, rt_last, pro_cnt, crt_cnt, fast_probe, tri_min_hold, tri_max_hold))
        for i in range(pro_cnt):
            self.public_step_res, self.pres_res = [], []
            self.deal_avgs_prtouch_cmd.send([self.public_pres_oid, 8])
            step_cnt_down, step_us_down, acc_ctl_cnt = self.public_get_step_cnts(self.g29_down_min_z, self.tri_z_down_spd)
            step_us_down = int(step_us_down * 0.8) if (i == 0 and not self.use_adc) else step_us_down
            self.start_pres_prtouch_cmd.send([self.public_pres_oid, 0, self.tri_acq_ms, self.public_tri_send_ms, self.tri_need_cnt,
                                              int(self.tri_hftr_cut * 1000), int(self.tri_lftr_k1 * 1000) if self.use_adc else int(self.tri_lftr_k1 * 1000 / tri_base_radio),
                                              tri_min_hold if self.use_adc else int(tri_min_hold * tri_base_radio), tri_max_hold if self.use_adc else int(tri_max_hold * tri_base_radio)])
            self.public_start_step_prtouch_cmd.send([self.public_step_oid, 0, self.public_tri_send_ms, step_cnt_down, step_us_down, acc_ctl_cnt, self.low_spd_nul, self.send_step_duty, 0])
            t_last = time.time()
            while (time.time() - t_last < (down_min_z / self.tri_z_down_spd + 10)) and (len(self.public_step_res) != MAX_BUF_LEN or len(self.pres_res) != MAX_BUF_LEN):
                self._delay_s(0.010)
            self.public_start_step_prtouch_cmd.send([self.public_step_oid, 0, 0, 0, 0, 0, self.low_spd_nul, self.send_step_duty, 0])
            self.start_pres_prtouch_cmd.send([self.public_pres_oid, 0, 0, 0, 0, 0, 0, 0, 0])
            self._ck_and_manual_get_step()
            self._ck_and_manual_get_pres()
            tri_base_radio += (0 if (self.pres_buf_cnt >= (MAX_BUF_LEN / 2) or self.use_adc) else 0.25)
            self._print_msg('RUN_STEP_PRTOUCH', 'pres_buf_cnt = %d, tri_base_radio = %f' % (self.pres_buf_cnt, tri_base_radio))
            step_par_down, pres_par_down = list(self.public_step_res), list(self.pres_res)
            res_z.append(self._cal_tri_data(step_cnt_down, now_pos[2], step_par_down, pres_par_down, -lost_min_cnt * self.mm_per_step))

            can_rt = bool(i == 1 and not self.use_adc and math.fabs(res_z[0] - res_z[1]) < 0.05 and crt_cnt != pro_cnt)
            can_rt = True if (can_rt and tri_base_radio <= 1.0) else (i == (crt_cnt - 1)) and (max(res_z) - min(res_z) <= probe_min_3err)

            up_min_z = (step_cnt_down - self.public_step_res[-1]['step']) * self.mm_per_step
            step_cnt_up, step_us_up, acc_ctl_cnt = self.public_get_step_cnts(up_min_z, self.tri_z_up_spd)
            step_cnt_up = int(step_cnt_down - self.public_step_res[-1]['step'])

            if fast_probe and pro_cnt > 2:
                if i == 0 and up_min_z > self.best_above_z / 2:
                    _step_cnt_up = (self.best_above_z / 2) / self.mm_per_step
                    lost_min_cnt = step_cnt_up - _step_cnt_up
                    step_cnt_up = int(_step_cnt_up)
                elif i == pro_cnt - 1 or can_rt:
                    step_cnt_up += int(lost_min_cnt)

            self.public_step_res, self.pres_res = [], []
            self.public_start_step_prtouch_cmd.send([self.public_step_oid, 1, self.public_tri_send_ms, step_cnt_up, step_us_up, acc_ctl_cnt, self.low_spd_nul, self.send_step_duty, 0])
            t_last = time.time()
            while (time.time() - t_last < (down_min_z / self.tri_z_down_spd + 5)) and (len(self.public_step_res) != MAX_BUF_LEN):
                self._delay_s(0.010)
            self.public_start_step_prtouch_cmd.send([self.public_step_oid, 1, 0, 0, 0, 0, self.low_spd_nul, self.send_step_duty, 0])
            self._ck_and_manual_get_step()
            if can_rt:
                break
        res_z.sort()
        self._print_ary('RES_Z', res_z, len(res_z))
        return res_z[int((len(res_z) - 1) / 2)] if len(res_z) != 2 else (res_z[0] + res_z[1]) / 2

    def _clear_nozzle(self, hot_min_temp, hot_max_temp, bed_max_temp):
        self._print_msg('CLEAR_NOZZLE', 'Start clear_nozzle(), hot_min_temp=%.2f, hot_max_temp=%.2f, bed_max_temp=%.2f' % (hot_min_temp, hot_max_temp, bed_max_temp))
        min_x, min_y = self.clr_noz_start_x, self.clr_noz_start_y
        self._set_bed_temps(temp=bed_max_temp, wait=False)
        self._set_hot_temps(temp=hot_min_temp, wait=False, err=10)
        self._ck_g28ed()
        mesh = self.bed_mesh.get_mesh()
        self.bed_mesh.set_mesh(None)
        self._set_step_par(load_sys=False)
        random.seed(time.time())
        cur_pos = self.toolhead.get_position()
        src_pos = [min_x + random.uniform(0, self.clr_noz_len_x - self.pa_clr_dis_mm - 5),
                   min_y + random.uniform(0, self.clr_noz_len_y), self.bed_max_err, cur_pos[3]]
        end_pos = [src_pos[0] + self.pa_clr_dis_mm, src_pos[1], src_pos[2], src_pos[3]]
        self._set_hot_temps(temp=hot_min_temp, wait=True, err=10)
        self._set_hot_temps(temp=hot_min_temp + 40, wait=False, err=10)

        self._print_msg('CLEAR_NOZZLE', 'Start Src Pos Probe...')
        self.public_move([src_pos[0], src_pos[1], src_pos[2]], self.rdy_xy_spd)
        src_pos[2] = self.public_run_step_prtouch(self.g29_down_min_z, 0.1, False, 5, 3, True, self.tri_min_hold, self.tri_max_hold)
        if self.use_adc:
            self._set_fan_speed('heater_fan', self.fan_heat_max_spd)

        self._print_msg('CLEAR_NOZZLE', 'Start End Pos Probe...')
        self.public_move([end_pos[0], end_pos[1], end_pos[2]], self.rdy_xy_spd)
        if self.use_adc:
            self._set_fan_speed('heater_fan', self.fan_heat_min_spd)
        self._set_fan_speed('fan', 0.0)
        end_pos[2] = self.public_run_step_prtouch(self.g29_down_min_z, 0.1, False, 5, 3, True, self.tri_min_hold, self.tri_max_hold)

        self._print_msg('CLEAR_NOZZLE', 'Down And Wait Temp For %.2f...' % hot_max_temp)
        self.public_move([src_pos[0], src_pos[1], self.bed_max_err], self.rdy_xy_spd)
        self.public_move([src_pos[0], src_pos[1], src_pos[2] - self.pa_clr_down_mm], self.rdy_z_spd)
        self._set_hot_temps(temp=hot_max_temp, wait=True, err=10)

        self._print_msg('CLEAR_NOZZLE', 'Start Clear The Noz...')
        self.public_move(end_pos[:2] + [end_pos[2] + self.pa_clr_down_mm], self.clr_xy_spd)
        self._set_fan_speed('fan', 1.0)

        self._print_msg('CLEAR_NOZZLE', 'Start Cool Down The Noz...')
        self._set_hot_temps(temp=hot_min_temp, wait=True, err=5)

        self._print_msg('CLEAR_NOZZLE', 'Start Finish Clear...')
        self.public_move([end_pos[0] + self.pa_clr_dis_mm, end_pos[1], end_pos[2] + self.bed_max_err], self.clr_xy_spd)
        self._set_fan_speed('fan', 0.)
        self._set_bed_temps(temp=bed_max_temp, wait=True, err=5)
        self._set_step_par(load_sys=True)
        self.bed_mesh.set_mesh(mesh)
        self.gcode.run_script_from_command('G28 Z')

    def _run_G28_Z(self, accurate=True):
        self._print_msg('RUN_G28_Z', 'Start run_G28_Z()...')
        self.public_enable_steps()
        self.public_get_mm_per_step()
        self.jump_probe_ready = False
        self.toolhead.wait_moves()
        if not self.bed_mesh.get_mesh() and self.bed_mesh.pmgr.profiles.get('default', None):
            self.gcode.run_script_from_command('BED_MESH_PROFILE LOAD=\"default\"')
        mesh = self.bed_mesh.get_mesh()
        self.bed_mesh.set_mesh(None)
        self._set_step_par(load_sys=False)
        now_pos = self.toolhead.get_position()
        self.toolhead.set_position(now_pos[:2] + [0, now_pos[3]], homing_axes=[2])
        min_x, min_y = self.bed_mesh.bmc.mesh_min
        max_x, max_y = self.bed_mesh.bmc.mesh_max
        now_pos = [min_x + (max_x - min_x) / 2, min_y + (max_y - min_y) / 2, now_pos[2], now_pos[3]]
        # 1. Check hot temp
        target_temp = self.heater_hot.target_temp
        if self.g28_wait_cool_down and self.heater_hot.smoothed_temp > (self.hot_min_temp + 5):
            self._print_msg('DEBUG', 'G28_Z: Wait for Nozzle to cool down[%.2f -> %.2f]...' % (target_temp, self.hot_min_temp))
            self._set_fan_speed('fan', 1.0)
            self._set_hot_temps(temp=self.hot_min_temp, wait=True, err=5)
            self._set_fan_speed('fan', 0.0)
        # 2. First probe z
        random.seed(int(time.time()))
        now_pos0 = [now_pos[0] + (1 if (int(time.time() * 1000) % 2 == 0) else -1) * random.uniform(4, 8),
                    now_pos[1] + (1 if (int(time.time() * 100) % 2 == 0) else -1) * random.uniform(4, 8), 0, now_pos[3]]
        now_pos1 = [now_pos[0] + random.uniform(-1.0, +1.0), now_pos[1] + random.uniform(-1.0, +1.0), self.best_above_z * 2, now_pos[3]]
        if self.use_adc:
            self._set_fan_speed('heater_fan', self.fan_heat_min_spd)
        self._set_fan_speed('fan', 0.0)
        self.public_move(now_pos0, self.rdy_xy_spd / 5)
        self._env_self_check()
        out_mms = []
        old_tri_z_spd = self.tri_z_down_spd
        old_best_above_z = self.best_above_z
        for i in range(20):
            self.public_enable_steps()
            self._print_msg('RUN_G28_Z', 'Start Coarse Probe, Test Index=%d...' % i)
            self.public_step_res, self.pres_res = [], []
            params = self.deal_avgs_prtouch_cmd.send([self.public_pres_oid, 8])
            self._print_msg('AVGS_RESAULT', str(params))
            step_cnt_down, step_us_down, acc_ctl_cnt = self.public_get_step_cnts(self.max_z * 1.2, self.tri_z_down_spd * (1.2 if self.use_adc else 2.0))
            self.start_pres_prtouch_cmd.send([self.public_pres_oid, 0, self.tri_acq_ms, self.public_tri_send_ms, self.tri_need_cnt,
                                              int(self.tri_hftr_cut*1000),  int(self.tri_lftr_k1 * 1000) if self.use_adc else int(self.tri_lftr_k1 * 1000 * 0.85),
                                              self.tri_min_hold if self.use_adc else int(self.tri_min_hold * 2), self.tri_max_hold if self.use_adc else int(self.tri_max_hold * 2)])
            self.public_start_step_prtouch_cmd.send([self.public_step_oid, 0, self.public_tri_send_ms, step_cnt_down, step_us_down, acc_ctl_cnt, self.low_spd_nul, self.send_step_duty, 0])
            t_last = time.time()
            while (time.time() - t_last < (self.max_z * 2.0) / (self.tri_z_down_spd * 1.2)) and (len(self.public_step_res) != MAX_BUF_LEN or len(self.pres_res) != MAX_BUF_LEN):
                self._delay_s(0.010)
            self.public_start_step_prtouch_cmd.send([self.public_step_oid, 0, 0, 0, 0, 0, self.low_spd_nul, self.send_step_duty, 0])
            self.start_pres_prtouch_cmd.send([self.public_pres_oid, 0, 0, 0, 0, 0, 0, 0, 0])
            self._ck_and_manual_get_step()

            if len(self.pres_res) == 0:
                self.gcode.run_script_from_command('FORCE_MOVE STEPPER=stepper_z DISTANCE=-1 VELOCITY=5')
                self.gcode.run_script_from_command('FORCE_MOVE STEPPER=stepper_z DISTANCE=1 VELOCITY=5')

            out_mm = (self.toolhead.get_position()[2] - (step_cnt_down - self.public_step_res[-1]['step']) * self.mm_per_step) \
                    if len(self.pres_res) != MAX_BUF_LEN else self._cal_tri_data(step_cnt_down, self.toolhead.get_position()[2], self.public_step_res, self.pres_res)

            self.toolhead.set_position(now_pos0[:2] + [0, now_pos0[3]], homing_axes=[2])
            self.public_move(now_pos0[:2] + [self.best_above_z * 2, now_pos0[3]], self.tri_z_up_spd * (1.2 if self.use_adc else 2.0))
            out_mms.append(math.fabs(out_mm))
            if len(out_mms) > 3:
                del out_mms[0]
            _out_mms = list(out_mms)
            _out_mms.sort()
            self._print_ary('G28_FIRST_MMS', _out_mms, len(_out_mms), 3)
            if len(_out_mms) == 3 and (_out_mms[0] + _out_mms[1] < 2.0):
                break
            if i == 9:
                self._print_msg('RUN_G28_Z', 'Out of 5, shake motor...')
                self.tri_z_down_spd *= 0.40
                self.best_above_z *= 2
                self._shake_motor(self.shake_cnt)
            self._ck_and_raise_error(i == 19, ERR_G28_Z_DETECTION_TIMEOUT)
        if not accurate:
            return
        # 3. Normal probe z
        self.tri_z_down_spd = old_tri_z_spd
        self.best_above_z = old_best_above_z

        for i in range(3):
            self._print_msg('RUN_G28_Z', 'Start Precision Probe...')
            self.public_move(self.toolhead.get_position()[:2] + [now_pos1[2]], self.rdy_z_spd)
            self.public_move(now_pos1, self.rdy_xy_spd / 5)
            self._shake_motor(self.shake_cnt)
            res_z = self.public_run_step_prtouch(self.max_z * 1.2, self.probe_min_3err, False, 5, 5, True)
            self.toolhead.set_position(now_pos1[:2] + [self.toolhead.get_position()[2] - res_z, now_pos[3]], homing_axes=[2])
            self._print_msg('RUN_G28_Z', 'Start Result Check Probe...')
            self.public_move(now_pos1[:2] + [self.bed_max_err, now_pos[3]], self.rdy_z_spd)
            ck_z = self.public_run_step_prtouch(self.max_z * 1.2, self.probe_min_3err, False, 3, 3, True)
            if math.fabs(ck_z) > 1.0:
                self.tri_z_down_spd *= 0.9
                self._ck_and_raise_error(i == 2, ERR_G28_Z_DETECTION_ERROR)
                continue
            break
        self.tri_z_down_spd = old_tri_z_spd

        # 4. Set hot temp to old target
        if self.g28_wait_cool_down:
            self._print_msg('DEBUG', 'G28_Z: Wait for Nozzle to recovery[%.2f -> %.2f]...' % (self.hot_min_temp, target_temp))
            self._set_hot_temps(temp=target_temp, wait=target_temp > self.hot_min_temp, err=5)
        if self.use_adc:
            self._set_fan_speed('heater_fan', self.fan_heat_max_spd)
        self._set_step_par(load_sys=True)
        self.bed_mesh.set_mesh(mesh)

    cmd_NOZZLE_CLEAR_help = "Clear the nozzle on bed."
    def cmd_NOZZLE_CLEAR(self, gcmd):
        hot_min_temp = gcmd.get_float('HOT_MIN_TEMP', self.hot_min_temp)
        hot_max_temp = gcmd.get_float('HOT_MAX_TEMP', self.hot_max_temp)
        bed_max_temp = gcmd.get_float('BED_MAX_TEMP', self.bed_max_temp)
        self._clear_nozzle(hot_min_temp, hot_max_temp, bed_max_temp)

    cmd_START_STEP_PRTOUCH_help = "Start the step prtouch."
    def cmd_START_STEP_PRTOUCH(self, gcmd):
        self.public_enable_steps()
        self.public_get_mm_per_step()
        run_dir = gcmd.get_int('DIR', 0)
        run_spd = gcmd.get_float('SPD', 10)
        run_dis = gcmd.get_float('DIS', 10)
        self.public_step_res = []
        step_cnt, step_us, acc_ctl_cnt = self.public_get_step_cnts(run_dis, run_spd)
        self.public_start_step_prtouch_cmd.send([self.public_step_oid, run_dir, self.public_tri_send_ms, step_cnt, step_us, acc_ctl_cnt, self.low_spd_nul, self.send_step_duty, 0])
        t_last = time.time()
        while (time.time() - t_last < (run_dis / run_spd + 5)) and (len(self.public_step_res) != MAX_BUF_LEN):
            self._delay_s(0.010)
        self.public_start_step_prtouch_cmd.send([self.public_step_oid, 0, 0, 0, 0, 0, self.low_spd_nul, self.send_step_duty, 0])
        self._ck_and_raise_error(len(self.public_step_res) != MAX_BUF_LEN, ERR_STEP_LOST_RUN_DATA, [len(self.public_step_res)])

    cmd_PRTOUCH_READY_help = "Test the ready point."
    def cmd_PRTOUCH_READY(self, gcmd):
        del gcmd

        self._probe_ready()

    cmd_SAFE_MOVE_Z_help = "Safe move z"
    def cmd_SAFE_MOVE_Z(self, gcmd):
        run_sta = gcmd.get_int('STA', 0)
        run_dis = gcmd.get_float('DIS', +10)
        run_spd = gcmd.get_float('SPD', 5.0)
        run_rdo = gcmd.get_float('RDO', 1.0)
        self._safe_move_z(run_sta, run_dis, run_spd, run_rdo)

    cmd_COARSE_HOME_Z_help = "Coarse home z"
    def cmd_COARSE_HOME_Z(self, gcmd):
        del gcmd

        self._run_G28_Z(False)

    cmd_SAFE_DOWN_Z_help = "Safe down z before G28"
    def cmd_SAFE_DOWN_Z(self, gcmd):
        self.public_get_mm_per_step()
        self.public_enable_steps()
        down_dis = gcmd.get_float('DOWN_DIS', 5)
        up_dis = gcmd.get_float('UP_DIS', 0)

        if down_dis != 0:
            if self.safe_z_dead_dis != 0 and down_dis > self.safe_z_dead_dis + 1:
                self.public_step_res, self.pres_res = [], []
                step_cnt_down, step_us_down, acc_ctl_cnt = self.public_get_step_cnts(self.safe_z_dead_dis, self.tri_z_down_spd)
                self.public_start_step_prtouch_cmd.send([self.public_step_oid, 1, self.public_tri_send_ms, step_cnt_down, step_us_down, acc_ctl_cnt, self.low_spd_nul, self.send_step_duty, 0])
                t_last = time.time()
                while ((time.time() - t_last) < ((self.safe_z_dead_dis / 1.0) + 10)) and (len(self.public_step_res) != MAX_BUF_LEN):
                    self._delay_s(0.010)
                self.public_start_step_prtouch_cmd.send([self.public_step_oid, 1, 0, 0, 0, 0, self.low_spd_nul, self.send_step_duty, 0])
                self._ck_and_manual_get_step()
                down_dis -= self.safe_z_dead_dis
            self.public_step_res, self.pres_res = [], []
            params = self.deal_avgs_prtouch_cmd.send([self.public_pres_oid, 8])
            self._print_msg('AVGS_RESAULT', str(params))
            step_cnt_down, step_us_down, acc_ctl_cnt = self.public_get_step_cnts(down_dis, self.tri_z_down_spd)
            self.start_pres_prtouch_cmd.send([self.public_pres_oid, 1, self.tri_acq_ms, self.public_tri_send_ms, self.tri_need_cnt,
                                              int(self.tri_hftr_cut * 1000), int(self.tri_lftr_k1 * 1000),
                                              self.tri_min_hold if self.use_adc else (self.tri_min_hold * 2), self.tri_max_hold if self.use_adc else (self.tri_max_hold * 2)])
            self.public_start_step_prtouch_cmd.send([self.public_step_oid, 1, self.public_tri_send_ms, step_cnt_down, step_us_down, acc_ctl_cnt, self.low_spd_nul, self.send_step_duty, 0])
            t_last = time.time()
            while ((time.time() - t_last) < ((down_dis / self.tri_z_down_spd) + 10)) and (len(self.public_step_res) != MAX_BUF_LEN):
                self._delay_s(0.010)
            self.public_start_step_prtouch_cmd.send([self.public_step_oid, 1, 0, 0, 0, 0, self.low_spd_nul, self.send_step_duty, 0])
            self.start_pres_prtouch_cmd.send([self.public_pres_oid, 1, 0, 0, 0, 0, 0, 0, 0])
            self._print_res()
            self._ck_and_manual_get_step()

        if up_dis != 0:
            if self.safe_z_dead_dis != 0 and up_dis > self.safe_z_dead_dis + 1:
                self.public_step_res, self.pres_res = [], []
                step_cnt_up, step_us_up, acc_ctl_cnt = self.public_get_step_cnts(self.safe_z_dead_dis, self.tri_z_down_spd)
                self.public_start_step_prtouch_cmd.send([self.public_step_oid, 0, self.public_tri_send_ms, step_cnt_up, step_us_up, 0, self.low_spd_nul, self.send_step_duty, 0])
                t_last = time.time()
                while ((time.time() - t_last) < ((self.safe_z_dead_dis / 1.0) + 10)) and (len(self.public_step_res) != MAX_BUF_LEN):
                    self._delay_s(0.010)
                self.public_start_step_prtouch_cmd.send([self.public_step_oid, 0, 0, 0, 0, 0, self.low_spd_nul, self.send_step_duty, 0])
                self._ck_and_manual_get_step()
                up_dis -= self.safe_z_dead_dis
            self.public_step_res, self.pres_res = [], []
            params = self.deal_avgs_prtouch_cmd.send([self.public_pres_oid, 8])
            self._print_msg('AVGS_RESAULT', str(params))
            step_cnt_up, step_us_up, acc_ctl_cnt = self.public_get_step_cnts(up_dis, self.tri_z_down_spd)
            self.start_pres_prtouch_cmd.send([self.public_pres_oid, 0, self.tri_acq_ms, self.public_tri_send_ms, self.tri_need_cnt,
                                              int(self.tri_hftr_cut * 1000), int(self.tri_lftr_k1 * 1000),
                                              self.tri_min_hold if self.use_adc else (self.tri_min_hold * 2), self.tri_max_hold if self.use_adc else (self.tri_max_hold * 2)])
            self.public_start_step_prtouch_cmd.send([self.public_step_oid, 0, self.public_tri_send_ms, step_cnt_up, step_us_up, acc_ctl_cnt, self.low_spd_nul, self.send_step_duty, 0])
            t_last = time.time()
            while ((time.time() - t_last) < ((up_dis / self.tri_z_down_spd) + 10)) and (len(self.public_step_res) != MAX_BUF_LEN):
                self._delay_s(0.010)
            self.public_start_step_prtouch_cmd.send([self.public_step_oid, 0, 0, 0, 0, 0, self.low_spd_nul, self.send_step_duty, 0])
            self.start_pres_prtouch_cmd.send([self.public_pres_oid, 0, 0, 0, 0, 0, 0, 0, 0])
            self._ck_and_manual_get_step()

    cmd_SELF_CHECK_PRTOUCH_help = "Self check the pres."
    def cmd_SELF_CHECK_PRTOUCH(self, gcmd):
        del gcmd

        self._env_self_check(force=True)

def load_config(config):
    vrt = PRTouchEndstopWrapper(config)
    return vrt
