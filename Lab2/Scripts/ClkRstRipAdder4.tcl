# Daniel Olsen
# ClkRstRipAdder4.tcl

set myFiles [list ./../HalfAdder.v ./../FullAdder.v ./../RipAdder4.v ./../ClkRstRipAdder4.v];
set basename ClkRstRipAdder4;
set virtual 0;

set myPeriod_ns 2.7;
set myClkLatency_ns 0.38;
set myInDelay_ns 0.1;
set myOutDelay_ns 0.1;
set myOutputLoad 3.2;
set mySetup 0.3;
set myHold 0.2;

set myClk CK;
set runname _syn8;
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

set filebase [concat $basename]
set fileext .v
write -format verilog -hierarchy -output [concat ../Results/$basename/$filebase$fileext]
set fileext .vio
redirect [concat ../Results/$basename/$filebase$fileext] { report_constraint -all_violators }
set fileext .maxtiming
redirect [concat ../Results/$basename/$filebase$fileext] { report_timing -path full -delay max -nworst 100 }
set fileext .mintiming
redirect [concat ../Results/$basename/$filebase$fileext] { report_timing -path full -delay min -nworst 100 }
set fileext .qor
redirect [concat ../Results/$basename/$filebase$fileext] { report_qor -significant_digits 4 }

set test_default_delay 0;
set test_default_bidir_delay 0;
set test_default_strobe 40;
set test_default_period 100;

set test_default_scan_style multiplexed_flip_flop;
set_scan_configuration -create_dedicated_scan_out_ports true

create_test_protocol -infer_async -infer_clock
dft_drc -verbose

compile -scan

insert_dft

set_drive 0.5 test_si
set_drive 0.5 test_se

set_scan_configuration -replace false

insert_dft

set runname _scan
set filebase [concat $basename$runname]
set fileext .v
write -format verilog -hierarchy -output [concat ../Results/$basename/$filebase$fileext]
set fileext .vio
redirect [concat ../Results/$basename/$filebase$fileext] { report_constraint -all_violators }
set fileext .sdc
write_sdc [concat ../Results/$basename/$filebase$fileext]
set fileext .spf
write_test_protocol -output [concat ../Results/$basename/$filebase$fileext]
set fileext .dftdrc
redirect [concat ../Results/$basename/$filebase$fileext] {dft_drc -verbose -coverage_estimate}
set fileext .scanpath
redirect [concat ../Results/$basename/$filebase$fileext] {report_scan_path -view existing -chain all}

