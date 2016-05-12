# Daniel Olsen
# FullAdder_tmax.tcl
set basename FullAdder;

read_netlist /synopsys/GPDK/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog/saed90nm.v -library

set fileext _scan.v
read_netlist [concat ../Results/$basename/$basename$fileext]

run_build_model $basename

set fileext _scan.spf
set_drc [concat ../Results/$basename/$basename$fileext]

run_drc

set_atpg -capture_cycles 9 -full_seq_atpg
remove_faults -all
add_faults -all

run_atpg full_sequential_only

set runname _tmax
set filebase [concat $basename$runname]

set fileext Tb.vhd
write_patterns [concat ../Results/$basename/$filebase$fileext] -replace -internal -format vhdl93
set fileext .faults
write_faults [concat ../Results/$basename/$filebase$fileext] -all -replace
set fileext .vio
redirect [concat ../Results/$basename/$filebase$fileext] { report_violations -all }
set fileext .coverage
redirect [concat ../Results/$basename/$filebase$fileext] { report_faults -summary }
