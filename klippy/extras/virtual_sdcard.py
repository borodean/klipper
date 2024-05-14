# Virtual sdcard support (print files directly from a host g-code file)
#
# Copyright (C) 2018-2024  Kevin O'Connor <kevin@koconnor.net>
#
# This file may be distributed under the terms of the GNU GPLv3 license.
import os, sys, logging, io
import json, time

VALID_GCODE_EXTS = ['gcode', 'g', 'gco']
LAYER_KEYS = [";LAYER:", "; layer:", "; LAYER:", ";AFTER_LAYER_CHANGE"]

DEFAULT_ERROR_GCODE = """
{% if 'heaters' in printer %}
   TURN_OFF_HEATERS
{% endif %}
"""

class VirtualSD:
    def __init__(self, config):
        self.printer = config.get_printer()
        self.printer.register_event_handler("klippy:shutdown",
                                            self.handle_shutdown)
        # sdcard state
        sd = config.get('path')
        self.sdcard_dirname = os.path.normpath(os.path.expanduser(sd))
        self.current_file = None
        self.file_position = self.file_size = 0
        # Print Stat Tracking
        self.print_stats = self.printer.load_object(config, 'print_stats')
        # Work timer
        self.reactor = self.printer.get_reactor()
        self.must_pause_work = self.cmd_from_sd = False
        self.next_file_position = 0
        self.work_timer = None
        # Error handling
        gcode_macro = self.printer.load_object(config, 'gcode_macro')
        self.on_error_gcode = gcode_macro.load_template(
            config, 'on_error_gcode', DEFAULT_ERROR_GCODE)
        if self.printer.start_args.get("apiserver")[-1] != "s":
            self.index = self.printer.start_args.get("apiserver")[-1]
        else:
            self.index = "1"
        # Register commands
        self.gcode = self.printer.lookup_object('gcode')
        for cmd in ['M20', 'M21', 'M23', 'M24', 'M25', 'M26', 'M27']:
            self.gcode.register_command(cmd, getattr(self, 'cmd_' + cmd))
        for cmd in ['M28', 'M29', 'M30']:
            self.gcode.register_command(cmd, self.cmd_error)
        self.gcode.register_command(
            "SDCARD_RESET_FILE", self.cmd_SDCARD_RESET_FILE,
            desc=self.cmd_SDCARD_RESET_FILE_help)
        self.gcode.register_command(
            "SDCARD_PRINT_FILE", self.cmd_SDCARD_PRINT_FILE,
            desc=self.cmd_SDCARD_PRINT_FILE_help)
        self.count = 0
        self.count_G1 = 0
        self.count_line = 0
        self.do_resume_status = False
        self.do_cancel_status = False
        self.cancel_print_state = False
        self.power_loss_pause_flag = False
        self.pause_flag = 1  # 1 Pause during printing, 2 Suspension of preheating process after power failure
        self.fan_state = ""
        self.cmd_fan = ""
        self.toolhead_moved = False
        self.print_id = ""
        self.cur_print_data = {}
    def handle_shutdown(self):
        if self.work_timer is not None:
            self.must_pause_work = True
            try:
                readpos = max(self.file_position - 1024, 0)
                readcount = self.file_position - readpos
                self.current_file.seek(readpos)
                data = self.current_file.read(readcount + 128)
            except:
                logging.exception("virtual_sdcard shutdown read")
                return
            logging.info("Virtual sdcard (%d): %s\nUpcoming (%d): %s",
                         readpos, repr(data[:readcount]),
                         self.file_position, repr(data[readcount:]))
    def stats(self, eventtime):
        if self.work_timer is None:
            return False, ""
        return True, "sd_pos=%d" % (self.file_position,)
    def get_file_list(self, check_subdirs=False):
        if check_subdirs:
            flist = []
            for root, dirs, files in os.walk(
                    self.sdcard_dirname, followlinks=True):
                for name in files:
                    ext = name[name.rfind('.')+1:]
                    if ext not in VALID_GCODE_EXTS:
                        continue
                    full_path = os.path.join(root, name)
                    r_path = full_path[len(self.sdcard_dirname) + 1:]
                    size = os.path.getsize(full_path)
                    flist.append((r_path, size))
            return sorted(flist, key=lambda f: f[0].lower())
        else:
            dname = self.sdcard_dirname
            try:
                filenames = os.listdir(self.sdcard_dirname)
                return [(fname, os.path.getsize(os.path.join(dname, fname)))
                        for fname in sorted(filenames, key=str.lower)
                        if not fname.startswith('.')
                        and os.path.isfile((os.path.join(dname, fname)))]
            except:
                logging.exception("virtual_sdcard get_file_list")
                raise self.gcode.error("Unable to get file list")
    def get_status(self, eventtime):
        return {
            'file_path': self.file_path(),
            'progress': self.progress(),
            'is_active': self.is_active(),
            'file_position': self.file_position,
            'file_size': self.file_size,
        }
    def file_path(self):
        if self.current_file:
            return self.current_file.name
        return None
    def progress(self):
        if self.file_size:
            try:
                return float(self.file_position) / self.file_size
            except Exception as e:
                logging.exception(e)
                return 0.
        else:
            return 0.
    def is_active(self):
        return self.work_timer is not None
    def do_pause(self):
        if self.work_timer is not None:
            self.must_pause_work = True
            while self.work_timer is not None and not self.cmd_from_sd:
                self.reactor.pause(self.reactor.monotonic() + .001)
    def do_resume(self):
        if self.work_timer is not None:
            logging.error("do_resume work_timer is not None")
            raise self.gcode.error("SD busy")
        self.must_pause_work = False
        self.work_timer = self.reactor.register_timer(
            self.work_handler, self.reactor.NOW)
    def do_cancel(self):
        self.do_cancel_status = True
        if self.current_file is not None:
            self.do_pause()
            self.current_file.close()
            self.current_file = None
            self.print_stats.note_cancel()
        self.file_position = self.file_size = 0
        from subprocess import call
        mcu = self.printer.lookup_object('mcu', None)
        pre_serial = mcu._serial.serial_dev.port.split("/")[-1]
        path = "/mnt/UDISK/%s_gcode_coordinate.save" % pre_serial
        print_file_name_save_path = "/mnt/UDISK/%s_print_file_name.save" % pre_serial
        if os.path.exists(path):
            os.remove(path)
        if os.path.exists(print_file_name_save_path):
            os.remove(print_file_name_save_path)
        call("sync", shell=True)
        gcode_move = self.printer.lookup_object('gcode_move')
        toolhead = self.printer.lookup_object('toolhead')
        if toolhead and gcode_move and gcode_move.is_delta and gcode_move.is_power_loss:
            gcode_move.is_power_loss = False
            gcode_move.homing_position = gcode_move.homing_position_bak
        self.update_print_history_info(only_update_status=True, state="cancelled")
        if self.print_id and self.cur_print_data:
            self.print_id = ""
            self.cur_print_data = {}
        if os.path.exists(self.gcode.exclude_object_info):
            os.remove(self.gcode.exclude_object_info)
    # G-Code commands
    def cmd_error(self, gcmd):
        raise gcmd.error("SD write not supported")
    def _reset_file(self):
        if self.current_file is not None:
            self.do_pause()
            self.current_file.close()
            self.current_file = None
        self.file_position = self.file_size = 0
        self.print_stats.reset()
        self.printer.send_event("virtual_sdcard:reset_file")
    cmd_SDCARD_RESET_FILE_help = "Clears a loaded SD File. Stops the print "\
        "if necessary"
    def cmd_SDCARD_RESET_FILE(self, gcmd):
        if self.cmd_from_sd:
            raise gcmd.error(
                "SDCARD_RESET_FILE cannot be run from the sdcard")
        self._reset_file()
    cmd_SDCARD_PRINT_FILE_help = "Loads a SD file and starts the print.  May "\
        "include files in subdirectories."
    def cmd_SDCARD_PRINT_FILE(self, gcmd):
        self.print_id = ""
        if self.work_timer is not None:
            raise gcmd.error("SD busy")
        # add load default bed_mesh
        try:
            logging.info("BED_MESH_PROFILE LOAD=default")
            self.gcode.run_script_from_command("BED_MESH_PROFILE LOAD=default")
        except Exception as e:
            logging.info(e.__str__())
        self._reset_file()
        filename = gcmd.get("FILENAME")
        if filename[0] == '/':
            filename = filename[1:]
        try:
            os.system("rm /tmp/*.temp")
        except:
            pass
        self.do_resume()
    def update_print_history_info(self, only_update_status=False, state="", error_msg=""):
        if self.print_id:
            ret = {}
            try:
                update_obj = None
                index = -1
                ret = self.cur_print_data
                if ret and ret.get("jobs", []):
                    print_list = ret.get("jobs", [])
                    for obj in print_list:
                        if obj.get("start_time", "") and str(obj.get("start_time", "")) == self.print_id:
                            index = print_list.index(obj)
                            update_obj = obj
                            if not only_update_status:
                                update_obj["filament_used"] = self.print_stats.filament_used
                                update_obj["print_duration"] = self.print_stats.print_duration
                                update_obj["total_duration"] = self.print_stats.total_duration
                            update_obj["end_time"] = time.time()
                            if not state:
                                state = "in_progress"
                            if error_msg:
                                update_obj["error_msg"] = error_msg
                            update_obj["status"] = state
                            if only_update_status and self.print_id and (state == "error" or state == "completed") and os.path.exists("/dev/video0"):
                                update_obj["jpg_filename"] = "%s.jpg" % self.print_id
                                time.sleep(0.2)
                if index != -1:
                    print_list[index] = update_obj
                    ret["jobs"] = print_list
                    self.cur_print_data = ret
            except Exception as err:
                logging.error(err)
    def cmd_M20(self, gcmd):
        # List SD card
        files = self.get_file_list()
        gcmd.respond_raw("Begin file list")
        for fname, fsize in files:
            gcmd.respond_raw("%s %d" % (fname, fsize))
        gcmd.respond_raw("End file list")
    def cmd_M21(self, gcmd):
        # Initialize SD card
        gcmd.respond_raw("SD card ok")
    def cmd_M23(self, gcmd):
        # Select SD file
        if self.work_timer is not None:
            raise gcmd.error("SD busy")
        self._reset_file()
        try:
            filename = gcmd.get_raw_command_parameters().strip()
            if filename.startswith(''):
                filename = filename[1:]
        except:
            raise gcmd.error("Unable to extract filename")
        if filename.startswith('/'):
            filename = filename[1:]
        self._load_file(gcmd, filename)
    def _load_file(self, gcmd, filename, check_subdirs=False):
        files = self.get_file_list(check_subdirs)
        flist = [f[0] for f in files]
        files_by_lower = { fname.lower(): fname for fname, fsize in files }
        fname = filename
        try:
            if fname not in flist:
                fname = files_by_lower[fname.lower()]
            fname = os.path.join(self.sdcard_dirname, fname)
            f = io.open(fname, 'r', newline='', encoding="utf-8")
            f.seek(0, os.SEEK_END)
            fsize = f.tell()
            f.seek(0)
        except Exception as e:
            logging.exception(e)
            raise gcmd.error("Unable to open file")
        gcmd.respond_raw("File opened:%s Size:%d" % (filename, fsize))
        gcmd.respond_raw("File selected")
        logging.error("File opened:%s Size:%d start_print" % (filename, fsize))
        self.current_file = f
        self.file_position = 0
        self.file_size = fsize
        self.print_stats.set_current_file(filename)
        return fname
    def cmd_M24(self, gcmd):
        # Start/resume SD print
        self.do_resume()
    def cmd_M25(self, gcmd):
        # Pause SD print
        self.do_pause()
    def cmd_M26(self, gcmd):
        # Set SD position
        if self.work_timer is not None:
            raise gcmd.error("SD busy")
        pos = gcmd.get_int('S', minval=0)
        self.file_position = pos
    def cmd_M27(self, gcmd):
        # Report SD print status
        if self.current_file is None:
            gcmd.respond_raw("Not SD printing.")
            return
        gcmd.respond_raw("SD printing byte %d/%d"
                         % (self.file_position, self.file_size))
    def get_file_position(self):
        return self.next_file_position
    def set_file_position(self, pos):
        self.next_file_position = pos
    def is_cmd_from_sd(self):
        return self.cmd_from_sd
    def record_status(self, path, line_pos):
        gcode_move = self.printer.lookup_object('gcode_move')
        gcode_move.cmd_CX_SAVE_GCODE_STATE(self.file_position, path, line_pos)
    def tail_read(self, f):
        cur_pos = f.tell()
        buf = ''
        while True:
            try:
                b = str(f.read(1))
            except UnicodeDecodeError as err:
                logging.error("UnicodeDecodeError err:%s" % str(err))
                cur_pos -= 1
                if cur_pos < 0: break
                f.seek(cur_pos)
                continue
            buf = b + buf
            cur_pos -= 1
            if cur_pos < 0: break
            f.seek(cur_pos)
            if b.startswith("\n") or b.startswith("\r"):
                buf = '\n'
            if (buf.startswith("G1") or buf.startswith("G0") or buf.startswith(";")) and buf.endswith("\n"):
                break
        return buf
    def getXYZE(self, file_path, file_position):
        result = {"X": 0, "Y": 0, "Z": 0, "E": 0}
        try:
            import io
            with io.open(file_path, "r", encoding="utf-8") as f:
                f.seek(file_position)
                while True:
                    cur_pos = f.tell()
                    if cur_pos <= 0:
                        break
                    line = self.tail_read(f)
                    line_list = line.split(" ")
                    if not result["E"] and "E" in line:
                        for obj in line_list:
                            if obj.startswith("E"):
                                ret = obj[1:].split("\r")[0]
                                ret = ret.split("\n")[0]
                                if ret.startswith("."):
                                    result["E"] = float(("0" + ret.strip(" ")))
                                else:
                                    result["E"] = float(ret.strip(" "))
                    if not result["X"] and not result["Y"]:
                        for obj in line_list:
                            if obj.startswith("X"):
                                result["X"] = float(obj.split("\r")[0][1:])
                            if obj.startswith("Y"):
                                result["Y"] = float(obj.split("\r")[0][1:])
                    if not result["Z"] and "Z" in line:
                        for obj in line_list:
                            if obj.startswith("Z"):
                                result["Z"] = float(obj.split("\r")[0][1:])
                    if result["X"] and result["Y"] and result["Z"] and result["E"]:
                        logging.info("get XYZE:%s" % str(result))
                        break
                    self.reactor.pause(self.reactor.monotonic() + .001)
        except Exception as err:
            logging.exception(err)
        return result
    def get_print_temperature(self, file_path):
        import re
        bed = 0
        nozzle = 0
        try:
            with open(file_path, "r") as f:
                count = 50000
                while count > 0:
                    count -= 1
                    line = f.readline()
                    M109_state = re.findall(r"M109 S(\d+)", line)
                    if M109_state:
                        nozzle = int(M109_state[0])
                        if nozzle < 180:
                            nozzle = 0
                        continue
                    M190_state = re.findall(r"M190 S(\d+)", line)
                    if M190_state:
                        bed = int(M190_state[0])
                        continue
                    M104_state = re.findall(r"M104 S(\d+)", line)
                    if M104_state:
                        nozzle = int(M104_state[0])
                        if nozzle < 180:
                            nozzle = 0
                        continue
                    M140_state = re.findall(r"M140 S(\d+)", line)
                    if M140_state:
                        bed = int(M140_state[0])
                        continue
                    if bed and nozzle:
                        break
        except Exception as err:
            bed = 60
            nozzle = 200
            logging.error(err)
        return bed, nozzle
    # Background work timer
    def work_handler(self, eventtime):
        self.count_line = 0
        import time
        # When the nozzle is moved
        mcu = self.printer.lookup_object('mcu', None)
        pre_serial = mcu._serial.serial_dev.port.split("/")[-1]
        path = "/mnt/UDISK/%s_gcode_coordinate.save" % pre_serial
        calc_layer_count = 0
        logging.info("Starting SD card print (position %d)", self.file_position)
        import threading
        t = threading.Thread(target=self._record_local_log_start_print)
        t.start()
        print_file_name_save_path = "/mnt/UDISK/%s_print_file_name.save" % pre_serial
        path2 = "/mnt/UDISK/.crealityprint/print_switch.txt"
        print_switch = False
        if os.path.exists(path2):
            try:
                with open(path2, "r") as f:
                    ret = json.loads(f.read())
                    print_switch = ret.get("switch", False)
            except Exception as err:
                pass
        state = {}
        if print_switch and os.path.exists(path) and os.path.exists(print_file_name_save_path):
            try:
                    self.print_stats.note_start(info_path=print_file_name_save_path)
                    with open(path, "r") as f:
                        ret = f.readlines()
                        info = {}
                        for obj in ret:
                            obj = obj.strip("'").strip("\n")
                            if len(obj) > 10:
                                obj = eval(obj)
                                if not info:
                                    info = obj
                                else:
                                    if obj.get("file_position", 0) > info.get("file_position", 0):
                                        info = obj
                        state = info
                        if not self.do_resume_status:
                            self.file_position = int(state.get("file_position", 0))
                            gcode = self.printer.lookup_object('gcode')
                            temperature = self.get_print_temperature(self.current_file.name)
                            gcode.run_script("M140 S%s" % temperature[0])
                            gcode.run_script("M109 S%s" % temperature[1])
                            if self.power_loss_pause_flag:
                                self.pause_flag = 2
                        if self.pause_flag == 2 and not self.do_resume_status:
                            pass
                        elif self.pause_flag == 1 and self.do_resume_status:
                            pass
                        elif self.cancel_print_state:
                            self.pause_flag = 1
                        elif self.pause_flag == 2 and self.do_resume_status:
                            self.pause_flag = 1
                            gcode_move = self.printer.lookup_object('gcode_move', None)
                            XYZE = self.getXYZE(self.current_file.name, self.file_position)
                            gcode_move.cmd_CX_RESTORE_GCODE_STATE(path, print_file_name_save_path, XYZE)
                        else:
                            self.pause_flag = 1
                            gcode_move = self.printer.lookup_object('gcode_move', None)
                            XYZE = self.getXYZE(self.current_file.name, self.file_position)
                            gcode_move.cmd_CX_RESTORE_GCODE_STATE(path, print_file_name_save_path, XYZE)
            except Exception as err:
                logging.exception(err)
        else:
            self.print_stats.note_start()
        if print_switch:
            gcode_move = self.printer.lookup_object('gcode_move')
        self.reactor.unregister_timer(self.work_timer)
        try:
            self.current_file.seek(self.file_position)
        except:
            logging.exception("virtual_sdcard seek")
            self.work_timer = None
            return self.reactor.NEVER
        self.print_stats.note_start()
        gcode_mutex = self.gcode.get_mutex()
        partial_input = ""
        lines = []
        error_message = None
        gcode_move = self.printer.lookup_object('gcode_move')
        line_pos = 1
        end_filename = self.file_path()
        while not self.must_pause_work:
            if not lines:
                # Read more data
                try:
                    data = self.current_file.read(8192)
                except:
                    logging.exception("virtual_sdcard read")
                    break
                if not data:
                    # End of file
                    self.current_file.close()
                    self.current_file = None
                    logging.info("Finished SD card print")
                    self.gcode.respond_raw("Done printing file")
                    if os.path.exists(path):
                        os.remove(path)
                    if os.path.exists(print_file_name_save_path):
                        os.remove(print_file_name_save_path)
                    if os.path.exists(self.gcode.exclude_object_info):
                        os.remove(self.gcode.exclude_object_info)
                    toolhead = self.printer.lookup_object('toolhead')
                    gcode = self.printer.lookup_object('gcode')
                    if gcode and toolhead and gcode_move and gcode_move.is_delta and gcode_move.is_power_loss:
                        gcode_move.is_power_loss = False
                        gcode_move.homing_position = gcode_move.homing_position_bak
                    self.update_print_history_info(only_update_status=True, state="completed")
                    time.sleep(0.2)
                    self.cur_print_data = {}
                    self.print_id = ""
                    break
                lines = data.split('\n')
                lines[0] = partial_input + lines[0]
                partial_input = lines.pop()
                lines.reverse()
                self.reactor.pause(self.reactor.NOW)
                continue
            # Pause if any other request is pending in the gcode class
            if gcode_mutex.test():
                self.reactor.pause(self.reactor.monotonic() + 0.100)
                continue
            # Dispatch command
            self.cmd_from_sd = True
            line = lines.pop()
            if sys.version_info.major >= 3:
                next_file_position = self.file_position + len(line.encode()) + 1
            else:
                next_file_position = self.file_position + len(line) + 1
            self.next_file_position = next_file_position
            if self.count_line % 4999 == 0:
                self.update_print_history_info()
            try:
                if print_switch and self.count_G1 >= 20 and self.count % 9 == 0:
                    if not os.path.exists(path):
                        with open(path, "w") as f:
                            f.writelines([" \n", " "])
                            f.flush()
                    self.record_status(path, line_pos)
                    if line_pos == 1:
                        line_pos = 2
                    else:
                        line_pos = 1
                if line.startswith("M106"):
                    self.fan_state = line.strip("\r").strip("\n")
                if self.cmd_fan:
                    self.fan_state = self.cmd_fan
                    self.cmd_fan = ""
                if calc_layer_count < 5:
                    for layer_key in LAYER_KEYS:
                        if ";LAYER_COUNT:" in layer_key:
                            break
                        if line.startswith(layer_key):
                            calc_layer_count += 1
                            break
                    if calc_layer_count == 5:
                        os.system("touch /tmp/layer_count_%s.temp" % self.index)
                self.toolhead_moved = False
                self.gcode.run_script(line)
                self.count_line += 1
                self.count += 1
                if self.count_G1 < 20 and line.startswith("G1"):
                    self.count_G1 += 1
            except self.gcode.error as e:
                error_message = str(e)
                try:
                    self.gcode.run_script(self.on_error_gcode.render())
                except:
                    logging.exception("virtual_sdcard on_error")
                break
            except:
                logging.exception("virtual_sdcard dispatch")
                break
            self.cmd_from_sd = False
            self.file_position = self.next_file_position
            # Do we need to skip around?
            if self.next_file_position != next_file_position:
                try:
                    self.current_file.seek(self.file_position)
                except:
                    logging.exception("virtual_sdcard seek")
                    self.work_timer = None
                    return self.reactor.NEVER
                lines = []
                partial_input = ""
        logging.info("Exiting SD card print (position %d)", self.file_position)
        self.count = 0
        self.count_G1 = 0
        self.count_line = 0
        state = {}
        self.do_resume_status = False
        self.do_cancel_status = False
        self.work_timer = None
        self.cmd_from_sd = False
        if error_message is not None:
            self.print_stats.note_error(error_message)
            logging.error("file:" + str(end_filename) + ",error:" + error_message)
        elif self.current_file is not None:
            self.print_stats.note_pause()
        else:
            self.print_stats.note_complete()
            import threading
            t = threading.Thread(target=self._last_reset_file)
            t.start()
        logging.error("filename:%s end print", end_filename)
        import threading
        t = threading.Thread(target=self._record_local_log, args=(end_filename,))
        t.start()
        return self.reactor.NEVER
    def local_log_save(self, end_filename):
        import threading
        t = threading.Thread(target=self._local_log_save, args=(end_filename,))
        t.start()
    def _local_log_save(self, end_filename):
        logging.info("_local_log_save:%s" % end_filename)
        try:
            url = "http://127.0.0.1/control/command?method=local_log_save&index=%s&filename=%s" % (
                    self.index, end_filename)
            from sys import version_info
            if version_info.major == 2:
                import urllib2
                urllib2.urlopen(url)
            else:
                from urllib import parse
                import string
                new_url = parse.quote(url, safe=string.printable)
                import urllib.request
                urllib.request.urlopen(new_url)
        except Exception as e:
            logging.exception(e)
    def timelapse_move(self, print_file_name_save_path, z_upraise):
        try:
            result = {}
            with open(print_file_name_save_path, "r") as f:
                result = json.loads(f.read())
            with open(print_file_name_save_path, "w") as f:
                result["z_toolhead_moved"] = z_upraise
                f.write(json.dumps(result))
                f.flush()
        except Exception as err:
            logging.error(err)
    def _last_reset_file(self):
        logging.info("will use _last_rest_file after 5s...")
        import time
        time.sleep(5)
        logging.info("use _last_rest_file")
        self._reset_file()
    def _record_local_log(self, end_filename):
        self.local_log_save(end_filename)
        if self.printer.in_shutdown_state:
            return
        with open("/mnt/UDISK/.crealityprint/printer%s_stat" % self.index, "w+") as f:
            f.write("1")
        url = "http://127.0.0.1:8000/settings/machine_info/?method=record_local_log&message=print_exit_upload_log&index=%s&filename=%s" % (
                self.index, end_filename)
        from sys import version_info
        if version_info.major == 2:
            import urllib2
            urllib2.urlopen(url)
        else:
            from urllib import parse
            new_url = parse.quote(url, safe=string.printable)
            import urllib.request
            urllib.request.urlopen(new_url)
    def _record_local_log_start_print(self):
        with open("/mnt/UDISK/.crealityprint/printer%s_stat" % self.index, "w+") as f:
            f.write("2")
        url = "http://127.0.0.1:8000/settings/machine_info/?method=record_local_log&message=start_print&index=%s&filename=%s" % (
            self.index, self.current_file.name)
        from sys import version_info
        if version_info.major == 2:
            import urllib2
            urllib2.urlopen(url)
        else:
            from urllib import parse
            new_url = parse.quote(url, safe=string.printable)
            import urllib.request
            urllib.request.urlopen(new_url)

def load_config(config):
    return VirtualSD(config)
