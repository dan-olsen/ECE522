# ECE 522 - Lab 1 - Daniel Olsen

## Full Adder

### Design Constraints
* Clock Latency = 0.55
* Min. Input and Output Delay = 0.0
* Driving Cell = INVX1
* Max Fanout = 1
* Fanout Load = 8
* Wire Load Model = 8000 in "saed90nm_max"

### Objectives
* Clock Period: Least feasible value
* Input and Output Delay: Highest feasible values
* Output Load: Highest feasible value

### Procedure
1. Find minimum clock period with no input/output delay or load.
  * Iteration 1
2. Using minimum clock period, find maximum output load.
  * Iteration 9
3. Slightly increase clock period to support some input/output delay.
4. Using increased clock rate, find maximum input/output delay.
  * Iteration 11
  * This gives a good lower bound to work from if a higher input or output delay is needed.
5. Try to increase output load.
  * Iteration 12
  * Found that with a higher output load the input/output delays could be increased.
6. Increase output load to find maximum input/output delays.
  * Iteration 17

### Results
| Iteration | Clock Period    | Input Delay | Output Delay | Output Load | Max Timing Slack |
|:---------:|:---------------:|:-----------:|:------------:|:-----------:|:----------------:|
| 1         | 0               | 0           | 0            | 0           | -1.74            |
| 2         | 1.8             | 0           | 0            | 0           | 0.01             |
| 3         | 1.8             | 0           | 0            | 10          | -0.23            |
| 4         | 1.8             | 0           | 0            | 8           | -0.17            |
| 5         | 1.8             | 0           | 0            | 6           | -0.11            |
| 6         | 1.8             | 0           | 0            | 4           | -0.05            |
| 7         | 1.8             | 0           | 0            | 3.8         | -0.05            |
| 8         | 1.8             | 0           | 0            | 3           | -0.02            |
| 9         | 1.8             | 0           | 0            | 2           | 0.00             |
| 10        | 2               | 0           | 0            | 2           | 0.08             |
| 11        | 2               | 0.04        | 0.04         | 2           | 0.00             |
| 12        | 2               | 0.04        | 0.04         | 3           | 0.02             |
| 13        | 2               | 0.05        | 0.05         | 3           | 0.02             |
| 14        | 2               | 0.06        | 0.06         | 3           | 0.01             |
| 15        | 2               | 0.06        | 0.06         | 4           | 0.02             |
| 16        | 2               | 0.08        | 0.08         | 4           | -0.01            |
| 17        | 2               | 0.07        | 0.07         | 4           | 0.00             |

###Final Values
* Clock Period: 2
* Input Delay: 0.07
* Output Delay: 0.07
* Output Load: 4

### TCL Script
```tcl
# Daniel Olsen
# FullAdder.tcl

set myFiles [list ./../HalfAdder.v ./../FullAdder.v];
set basename FullAdder;
set virtual 1;

set myPeriod_ns 2;
set myClkLatency_ns 0.55;
set myInDelay_ns 0.07;
set myOutDelay_ns 0.07;
set myOutputLoad 4;
set mySetup 0.3;
set myHold 0.2;

set myClk CK;
set runname _syn17;
set search_path "/synopsys/GPDK/SAED_EDK90nm/Digital_Standard_Cell_Library/synopsys/models";
set link_library "saed90nm_max.db";
set target_library "saed90nm_max.db";
set symbol_library "saed90nm_max.db";
set myInputBuf INVX1;
set myMaxFanout 1;

remove_design -all
analyze -format verilog -library WORK $myFiles
elaborate $basename -library WORK -update

current_design $basename

link
uniquify

if { $virtual == 0} {
	create_clock -period $myPeriod_ns $myClk
	set_input_delay 0.0 -min -clock $myClk [all_inputs]
	set_input_delay $myInDelay_ns -max -clock $myClk [all_inputs]
	set_driving_cell -lib_cell $myInputBuf [all_inputs]
} else {
	create_clock -period $myPeriod_ns -name $myClk
	set_input_delay 0.0 -min -clock $myClk [remove_from_collection [all_inputs] $myClk]
	set_input_delay $myInDelay_ns -max -clock $myClk [remove_from_collection [all_inputs] $myClk]
	set_driving_cell -lib_cell $myInputBuf [remove_from_collection [all_inputs] $myClk]
}
set_clock_latency $myClkLatency_ns $myClk
set_output_delay $myOutDelay_ns -max -clock $myClk [all_outputs]
set_output_delay 0.0 -min -clock $myClk [all_outputs]

set_load $myOutputLoad [all_outputs]
set_max_fanout $myMaxFanout [all_inputs]
set_fanout_load 8 [all_outputs]
set_wire_load_model -name 8000 -library saed90nm_max
set_max_area 0
set_clock_uncertainty -setup $mySetup [get_clocks $myClk]
set_clock_uncertainty -hold $myHold [get_clocks $myClk]

set_fix_multiple_port_nets -all -buffer_constants

compile -map_effort medium -exact_map
check_design

set filebase [concat $basename$runname]
set fileext .v
write -format verilog -hierarchy -output [concat ./$basename/$runname/$filebase$fileext]
set fileext .vio
redirect [concat ./$basename/$runname/$filebase$fileext] { report_constraint -all_violators }
set fileext .maxtiming
redirect [concat ./$basename/$runname/$filebase$fileext] { report_timing -path full -delay max -nworst 5 }
set fileext .mintiming
redirect [concat ./$basename/$runname/$filebase$fileext] { report_timing -path full -delay min -nworst 5 }
set fileext .qor
redirect [concat ./$basename/$runname/$filebase$fileext] { report_qor -significant_digits 4 }
```

##Clocked Ripple Carry Adder
### Design Constraints
* Clock Latency = 0.38
* Min. Input and Output Delay = 0.0
* Driving Cell = INVX1
* Max Fanout = 1
* Fanout Load = 8
* Wire Load Model = 8000 in "saed90nm_max"

### Objectives
* Clock Period: Least feasible value
* Input and Output Delay: Highest feasible values
* Output Load: Highest feasible value

### Procedure
1. Find minimum clock period with no input/output delay or load.
  * Iteration 1
2. Using minimum clock period, find maximum output load.
  * Iteration 4 (Verified with iteration 5)
3. Slightly increase clock period to support some input/output delay.
4. Using increased clock rate, find maximum input/output delay.
  * Iteration 6 (Verified with iteration 7)
  * This gives a good lower bound to work from if a higher input or output delay is needed.
6. Increase output load to find maximum input/output delays.
  * Iteration 11

### Results
| Iteration | Clock Period    | Input Delay | Output Delay | Output Load | Max Timing Slack |
|:---------:|:---------------:|:-----------:|:------------:|:-----------:|:----------------:|
| 1         | 0               | 0           | 0            | 0           | -1.71            |
| 2         | 1.8             | 0           | 0            | 0           | 0.00             |
| 3         | 1.8             | 0           | 0            | 2           | 0.00             |
| 4         | 1.8             | 0           | 0            | 3           | 0.00             |
| 5         | 1.8             | 0           | 0            | 4           | -0.02            |
| 6         | 2               | 0.1         | 0.1          | 3           | 0.00             |
| 7         | 2               | 0.2         | 0.2          | 3           | -0.19            |
| 8         | 2               | 0.1         | 0.1          | 4           | -0.02            |
| 9         | 2               | 0.1         | 0.1          | 3.5         | 0.00 (sig. dig.) |
| 10        | 2               | 0.1         | 0.1          | 3.4         | 0.00 (sig. dig.) |
| 11        | 2               | 0.1         | 0.1          | 3.2         | 0.00             |

###Final Values
* Clock Period: 2
* Input Delay: 0.1
* Output Delay: 0.1
* Output Load: 3.2

### TCL Script
```tcl
# Daniel Olsen
# ClkRstRipAdder4.tcl

set myFiles [list ./../HalfAdder.v ./../FullAdder.v ./../RipAdder4.v ./../ClkRstRipAdder4.v];
set basename ClkRstRipAdder4;
set virtual 1;

set myPeriod_ns 2;
set myClkLatency_ns 0.38;
set myInDelay_ns 0.1;
set myOutDelay_ns 0.1;
set myOutputLoad 3.2;
set mySetup 0.3;
set myHold 0.2;

set myClk CK;
set runname _syn11;
set search_path "/synopsys/GPDK/SAED_EDK90nm/Digital_Standard_Cell_Library/synopsys/models";
set link_library "saed90nm_max.db";
set target_library "saed90nm_max.db";
set symbol_library "saed90nm_max.db";
set myInputBuf INVX1;
set myMaxFanout 1;

remove_design -all
analyze -format verilog -library WORK $myFiles
elaborate $basename -library WORK -update

current_design $basename

link
uniquify

if { $virtual == 0} {
	create_clock -period $myPeriod_ns $myClk
	set_input_delay 0.0 -min -clock $myClk [all_inputs]
	set_input_delay $myInDelay_ns -max -clock $myClk [all_inputs]
	set_driving_cell -lib_cell $myInputBuf [all_inputs]
} else {
	create_clock -period $myPeriod_ns -name $myClk
	set_input_delay 0.0 -min -clock $myClk [remove_from_collection [all_inputs] $myClk]
	set_input_delay $myInDelay_ns -max -clock $myClk [remove_from_collection [all_inputs] $myClk]
	set_driving_cell -lib_cell $myInputBuf [remove_from_collection [all_inputs] $myClk]
}
set_clock_latency $myClkLatency_ns $myClk
set_output_delay $myOutDelay_ns -max -clock $myClk [all_outputs]
set_output_delay 0.0 -min -clock $myClk [all_outputs]

set_load $myOutputLoad [all_outputs]
set_max_fanout $myMaxFanout [all_inputs]
set_fanout_load 8 [all_outputs]
set_wire_load_model -name 8000 -library saed90nm_max
set_max_area 0
set_clock_uncertainty -setup $mySetup [get_clocks $myClk]
set_clock_uncertainty -hold $myHold [get_clocks $myClk]

set_fix_multiple_port_nets -all -buffer_constants

compile -map_effort medium -exact_map
check_design

set filebase [concat $basename$runname]
set fileext .v
write -format verilog -hierarchy -output [concat ./$basename/$runname/$filebase$fileext]
set fileext .vio
redirect [concat ./$basename/$runname/$filebase$fileext] { report_constraint -all_violators }
set fileext .maxtiming
redirect [concat ./$basename/$runname/$filebase$fileext] { report_timing -path full -delay max -nworst 100 }
set fileext .mintiming
redirect [concat ./$basename/$runname/$filebase$fileext] { report_timing -path full -delay min -nworst 100 }
set fileext .qor
redirect [concat ./$basename/$runname/$filebase$fileext] { report_qor -significant_digits 4 }
```
