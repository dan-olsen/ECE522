###################################################################

# Created by write_sdc on Tue Apr 12 10:55:59 2016

###################################################################
set sdc_version 1.9

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_wire_load_model -name 8000 -library saed90nm_max
set_max_area 0
set_driving_cell -lib_cell INVX1 [get_ports A]
set_driving_cell -lib_cell INVX1 [get_ports B]
set_driving_cell -lib_cell INVX1 [get_ports Cin]
set_fanout_load 8 [get_ports Cout]
set_fanout_load 8 [get_ports S]
set_load -pin_load 4 [get_ports Cout]
set_load -pin_load 4 [get_ports S]
set_max_fanout 1 [get_ports A]
set_max_fanout 1 [get_ports B]
set_max_fanout 1 [get_ports Cin]
create_clock -name CK  -period 2  -waveform {0 1}
set_clock_latency 0.55  [get_clocks CK]
set_clock_uncertainty -setup 0.3  [get_clocks CK]
set_clock_uncertainty -hold 0.2  [get_clocks CK]
set_input_delay -clock CK  -max 0.07  [get_ports A]
set_input_delay -clock CK  -min 0  [get_ports A]
set_input_delay -clock CK  -max 0.07  [get_ports B]
set_input_delay -clock CK  -min 0  [get_ports B]
set_input_delay -clock CK  -max 0.07  [get_ports Cin]
set_input_delay -clock CK  -min 0  [get_ports Cin]
set_output_delay -clock CK  -max 0.07  [get_ports Cout]
set_output_delay -clock CK  -min 0  [get_ports Cout]
set_output_delay -clock CK  -max 0.07  [get_ports S]
set_output_delay -clock CK  -min 0  [get_ports S]
