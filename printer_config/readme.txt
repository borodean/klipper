V1.1 Changes
1. Adjust [safe_z_home] speed to 200
2. Adjust [printer], max_accel limit to 5000, enable max_z_velocity: 5, max_z_accel: 100
3. Adjust [extruder], disable pressure_advance
4. Adjust [extruder], nozzle max_temp for ender3S1 PRO is 305, ender3S1/ender3V2 max_temp is 265
5. Adjust [bed_mesh], speed limit for ender3V2 is 120, for ender3S1 PRO/ender3S1 is 150
6. Add timelapse configuration [include /mnt/UDISK/printer_config/timelapse.cfg]

V1.2 Changes
1. Remove redundant configuration code
2. Change [virtual_sdcard] value to path: ~/gcode_files
3. Modify Ender 3V2 [extruder] [heater_bed] values, min_temp to 0
4. Add compilation and installation instructions for klipper firmware

V1.3 Changes
1. Emergency fix for [display] field causing CR6SE nozzle heating issues. This field is for dot matrix displays, not useful for sonic screens, delete this field
2. Fix Ender3 V2-CRtouch [stepper_z], enable_pin: !PC3, was not enabled causing Z-axis not to lift
3. Change model name Ender 3V2-CRtouch to Ender 3V2 ABL

V1.4 Changes
1. Modify Ender3-S1 [safe_z_home] home_xy_position: 155,155
2. Modify [stepper_x] homing_speed: 80
3. Modify [stepper_y] homing_speed: 80
4. Modify Ender-3S1/S1 Pro [stepper_y] position_max: 230
5. Add model forming dimension note # printer_size: 220x220x270
6. Add [adxl345] spi_speed: 2000000

V1.5 Changes
1. Fix error report of out-of-range during auto-leveling

V1.6 Changes
1. Remove Ender3-V2 series filament detection configuration
2. Add Ender3-V2-V4.2.7 motherboard configuration file
3. Add Ender3V2-CRtouch-V4.2.7 motherboard configuration file
4. Unify configuration file naming style

V1.7 Changes
1. Adapt adaptive leveling, add dual interpolation algorithm
2. Standardize model naming conventions

V1.8 Changes
1. Add [verify_heater extruder]
      check_gain_time: 200
      hysteresis: 5
2. Modify default [extruder] and [heater_bed] PID values

V1.9 Changes
1. Modify Ender3-S1/S1Pro in [safe_z_home] home_xy_position: 145,155
2. Modify Ender3-S1/S1Pro in [bltouch] x_offset: -30.0

V2.0 Changes
1. Modify Ender3-S1/S1 Pro in [printer] max_z_velocity: 10   max_z_accel: 1000
2. Add Ender3-S1/S1 Pro/V2 [printer] square_corner_velocity: 5.0

V2.1 Changes
1. Modify Ender3-S1/S1 Pro in [stepper_z] position_max: 275
2. Modify Ender3-V2 in [stepper_z] position_max: 255

V2.2 Changes
1. Modify [gcode_macro CANCEL_PRINT] macro definition
2. Modify Ender3-V2-CRtouch in [stepper_x] position_max: 240
3. Update firmware to add exceptional heating logic

V2.3 Changes
1. Modify Ender3-S1/S1 Pro [stepper_x] position_min: -6 position_endstop: -6
2. Delete Ender3-V2 macro command [delayed_gcode AUTOSTART]

V2.4 Changes
1. Modify Ender3-S1/S1 Pro [stepper_x] position_min: -3 position_endstop: -3

V2.5 Changes
1. Modify Ender3-S1/S1 Pro [stepper_x] position_min: -5 position_endstop: -5
2. Modify Ender3-S1/S1 Pro print forming range

V2.6 Changes
1. Add new model Ender3-V2 Neo
2. Add new model Ender3-s1pro-103
2. Add macro definition [gcode_macro G29]

V2.7 Changes
1. Modify Ender3-V2-CRtouch-V4.2.7 [stepper_z] modify touch configuration
