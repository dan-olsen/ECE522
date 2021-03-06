###################################################################

# Created by write_sdc on Tue Apr 12 11:05:02 2016

###################################################################
set sdc_version 1.9

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_wire_load_model -name 8000 -library saed90nm_max
set_max_area 0
set_driving_cell -lib_cell INVX1 [get_ports CIN]
set_driving_cell -lib_cell INVX1 [get_ports {A[3]}]
set_driving_cell -lib_cell INVX1 [get_ports {A[2]}]
set_driving_cell -lib_cell INVX1 [get_ports {A[1]}]
set_driving_cell -lib_cell INVX1 [get_ports {A[0]}]
set_driving_cell -lib_cell INVX1 [get_ports {B[3]}]
set_driving_cell -lib_cell INVX1 [get_ports {B[2]}]
set_driving_cell -lib_cell INVX1 [get_ports {B[1]}]
set_driving_cell -lib_cell INVX1 [get_ports {B[0]}]
set_fanout_load 8 [get_ports {SUM[3]}]
set_fanout_load 8 [get_ports {SUM[2]}]
set_fanout_load 8 [get_ports {SUM[1]}]
set_fanout_load 8 [get_ports {SUM[0]}]
set_fanout_load 8 [get_ports COUT]
set_load -pin_load 1 [get_ports {SUM[3]}]
set_load -pin_load 1 [get_ports {SUM[2]}]
set_load -pin_load 1 [get_ports {SUM[1]}]
set_load -pin_load 1 [get_ports {SUM[0]}]
set_load -pin_load 1 [get_ports COUT]
set_max_fanout 1 [get_ports CIN]
set_max_fanout 1 [get_ports {A[3]}]
set_max_fanout 1 [get_ports {A[2]}]
set_max_fanout 1 [get_ports {A[1]}]
set_max_fanout 1 [get_ports {A[0]}]
set_max_fanout 1 [get_ports {B[3]}]
set_max_fanout 1 [get_ports {B[2]}]
set_max_fanout 1 [get_ports {B[1]}]
set_max_fanout 1 [get_ports {B[0]}]
create_clock -name CK  -period 3.6  -waveform {0 1.8}
set_clock_latency 0.38  [get_clocks CK]
set_clock_uncertainty -setup 0.3  [get_clocks CK]
set_clock_uncertainty -hold 0.2  [get_clocks CK]
set_input_delay -clock CK  -max 0.1  [get_ports CIN]
set_input_delay -clock CK  -min 0  [get_ports CIN]
set_input_delay -clock CK  -max 0.1  [get_ports {A[3]}]
set_input_delay -clock CK  -min 0  [get_ports {A[3]}]
set_input_delay -clock CK  -max 0.1  [get_ports {A[2]}]
set_input_delay -clock CK  -min 0  [get_ports {A[2]}]
set_input_delay -clock CK  -max 0.1  [get_ports {A[1]}]
set_input_delay -clock CK  -min 0  [get_ports {A[1]}]
set_input_delay -clock CK  -max 0.1  [get_ports {A[0]}]
set_input_delay -clock CK  -min 0  [get_ports {A[0]}]
set_input_delay -clock CK  -max 0.1  [get_ports {B[3]}]
set_input_delay -clock CK  -min 0  [get_ports {B[3]}]
set_input_delay -clock CK  -max 0.1  [get_ports {B[2]}]
set_input_delay -clock CK  -min 0  [get_ports {B[2]}]
set_input_delay -clock CK  -max 0.1  [get_ports {B[1]}]
set_input_delay -clock CK  -min 0  [get_ports {B[1]}]
set_input_delay -clock CK  -max 0.1  [get_ports {B[0]}]
set_input_delay -clock CK  -min 0  [get_ports {B[0]}]
set_output_delay -clock CK  -max 0.1  [get_ports {SUM[3]}]
set_output_delay -clock CK  -min 0  [get_ports {SUM[3]}]
set_output_delay -clock CK  -max 0.1  [get_ports {SUM[2]}]
set_output_delay -clock CK  -min 0  [get_ports {SUM[2]}]
set_output_delay -clock CK  -max 0.1  [get_ports {SUM[1]}]
set_output_delay -clock CK  -min 0  [get_ports {SUM[1]}]
set_output_delay -clock CK  -max 0.1  [get_ports {SUM[0]}]
set_output_delay -clock CK  -min 0  [get_ports {SUM[0]}]
set_output_delay -clock CK  -max 0.1  [get_ports COUT]
set_output_delay -clock CK  -min 0  [get_ports COUT]
