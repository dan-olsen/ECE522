# Daniel Olsen
# FullAdder.tcl

set myFiles [list ./../HalfAdder.v ./../FullAdder.v];
set basename FullAdder;
set virtual 1;

set myPeriod_ns 10;
set myClkLatency_ns 0.3;
set myInDelay_ns 2.0;
set myOutDelay_ns 1.65;
set myOutputLoad 0.1;
set mySetup 0.3;
set myHold 0.2;

set myClk CK;
set runname _syn;
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
	set_input_delay $myInDelay_ns -clock $myClk [all_inputs]
	set_driving_cell -lib_cell $myInputBuf [all_inputs]
} else {
	create_clock -period $myPeriod_ns -name $myClk
	set_input_delay $myInDelay_ns -clock $myClk [remove_from_collection [all_inputs] $myClk]
	set_driving_cell -lib_cell $myInputBuf [remove_from_collection [all_inputs] $myClk]
}
set_clock_latency $myClkLatency_ns $myClk
set_output_delay $myOutDelay_ns -clock $myClk [all_outputs]

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
write -format verilog -hierarchy -output [concat $filebase$fileext]
set fileext .vio
redirect [concat $filebase$fileext] { report_constraint -all_violators }
set fileext .maxtiming
redirect [concat $filebase$fileext] { report_timing -path full -delay max -nworst 5 }
set fileext .mintiming
redirect [concat $filebase$fileext] { report_timing -path full -delay min -nworst 5 }
set fileext .qor
redirect [concat $filebase$fileext] { report_qor -significant_digits 4 }













