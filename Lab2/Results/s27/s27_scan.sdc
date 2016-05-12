###################################################################

# Created by write_sdc on Tue Apr 12 11:10:27 2016

###################################################################
set sdc_version 1.9

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_wire_load_model -name 8000 -library saed90nm_max
set_max_area 0
set_driving_cell -lib_cell INVX1 [get_ports CK]
set_driving_cell -lib_cell INVX1 [get_ports G0]
set_driving_cell -lib_cell INVX1 [get_ports G1]
set_driving_cell -lib_cell INVX1 [get_ports G2]
set_driving_cell -lib_cell INVX1 [get_ports G3]
set_fanout_load 8 [get_ports G17]
set_load -pin_load 0.2 [get_ports G17]
set_max_fanout 1 [get_ports CK]
set_max_fanout 1 [get_ports G0]
set_max_fanout 1 [get_ports G1]
set_max_fanout 1 [get_ports G2]
set_max_fanout 1 [get_ports G3]
create_clock [get_ports CK]  -period 3  -waveform {0 1.5}
set_clock_latency 0.55  [get_clocks CK]
set_clock_uncertainty -setup 0.3  [get_clocks CK]
set_clock_uncertainty -hold 0.2  [get_clocks CK]
set_input_delay -clock CK  -max 0.1  [get_ports CK]
set_input_delay -clock CK  -min 0  [get_ports CK]
set_input_delay -clock CK  -max 0.1  [get_ports G0]
set_input_delay -clock CK  -min 0  [get_ports G0]
set_input_delay -clock CK  -max 0.1  [get_ports G1]
set_input_delay -clock CK  -min 0  [get_ports G1]
set_input_delay -clock CK  -max 0.1  [get_ports G2]
set_input_delay -clock CK  -min 0  [get_ports G2]
set_input_delay -clock CK  -max 0.1  [get_ports G3]
set_input_delay -clock CK  -min 0  [get_ports G3]
set_output_delay -clock CK  -max 0.1  [get_ports G17]
set_output_delay -clock CK  -min 0  [get_ports G17]
set_drive 0.5  [get_ports test_si]
set_drive 0.5  [get_ports test_se]
