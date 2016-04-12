# ECE 522 - Lab 1 - Daniel Olsen

## Part 1

### Design Constraints for Full Adder, Half Adder, s27, s298, s9234
* Clock Latency = 0.55
* Min. Input and Output Delay = 0.0
* Driving Cell = INVX1
* Max Fanout = 1
* Fanout Load = 8
* Wire Load Model = 8000 in "saed90nm_max"

### Design Constraints for Ripple Carry Adder, Clocked Reset Ripple Carry Adder
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

### Results
| Design       | Clock Period | Input Delay | Output Delay | Output Load |
|:------------:|:------------:|:-----------:|:------------:|:-----------:|
| HalfAdder    | 1.3          | 0.1         | 0.1          | 0.35        |
| FullAdder    | 2            | 0.07        | 0.07         | 4           |
| RipAdder4    | 3.6          | 0.1         | 0.1          | 1           |
| ClkRstAdder4 | 2.7          | 0.1         | 0.1          | 3.2         |
| s27          | 3            | 0.1         | 0.1          | 0.2         |
| s298         | 4.7          | 2.2         | 2.2          | 14          |
| s9234        | 7.2          | 1.2         | 1.2          | 20          |

## Part 2- Test Setup
The designs from Part 1 need to have the testing procedure setup, test structures inserted, and in the case of the clocked circuits, the scan chains inserted. This is done by inserting the following commands at the end of the scripts.

### Test Setup Script
```tcl
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
```

### Test Setup Variables
* ``test_default_delay``: A positive real number in nanoseconds that defines default time in a test cycle that values are applied to the inputs.
* ``test_default_bidir_delay``: A positive real number in nanoseconds that defines default switching time of bidirectional ports in a test cycle.
* ``test_default_strobe``: A positive real number in nanoseconds that defines the default strobe time in a test cycle for output ports and bidirectional ports in output mode.
* ``test_default_period``: A positive nonzero real number in nanoseconds that defines the length of a test vector cycle.
* ``test_default_scan_style``: Defines the scan style to be used by the ``set_scan_configuration`` command

### Test Setup Commands
* ``set_scan_configuration -create_dedicated_scan_out_ports true``: Used to specify the scan chain design used by ``insert_dft``. The ``-create_dedicated_scan_out_ports true`` is used to specify that dedicated scan-out ports are inserted.
* ``create_test_protocol -infer_async -infer_clock``: Used to create a test protocol. ``-infer_async`` is used to infer asynchronous set/reset signals. ``-infer_clock`` is used to infer the test clocks.
* ``dft_drc -verbose``: Used to check the current design against the test design rules previously specified.
* ``compile -scan``: Used to perform synthesis and optimization on the current design. The ``-scan`` option is used to consider the impact of scan on mission-mode constraints.
* ``insert_dft``: Used to insert DFT logic into the current design.
* ``set_drive``: Used to set the resistance to a specified value on a specified input/output. Used in script to set the resistance of the insert test ports so they are not assumed to be infinite.
* ``set_scan_configuration -replace false``: Used to disable replacement of sequential elements, the scan cells are already inserted.
* ``insert_dft``: Used to set the drive strength of the test ports.
* ``write -format verilog -hierarchy -output [concat ../Results/$basename/$filebase$fileext]``: Used to ouput final verilog design with scan.
* ``redirect [concat ../Results/$basename/$filebase$fileext] { report_constraint -all_violators }``: Used to output any viloations.
* ``write_sdc [concat ../Results/$basename/$filebase$fileext]``: Used to output a Synopsys Design Constraints (SDC) script.
* ``write_test_protocol -output [concat ../Results/$basename/$filebase$fileext]``: Used to output the STIL test protocol file.
* ``redirect [concat ../Results/$basename/$filebase$fileext] {dft_drc -verbose -coverage_estimate}``: Used to output the estimate of test coverage.
* ``redirect [concat ../Results/$basename/$filebase$fileext] {report_scan_path -view existing -chain all}``: Used to output the scan chains in the current design.

## Part 2- ATPG
The final verilog design with scan and the STIL test protocol file are imported into TetraMax. They are used to generate test patterns for the given circuits. 

### Results
| Design       | Detected Faults | Undetectable Faults | Total Faults | Fault Coverage |
|:------------:|:---------------:|:-------------------:|:------------:|:--------------:|
| FullAdder    | 56              | 0                   | 56           | 100.00%        |
| RipAdder4    | 228             | 0                   | 228          | 100.00%        |
| ClkRstAdder4 | 304             | 0                   | 304          | 100.00%        |
| s27          | 155             | 1                   | 156          | 100.00%        |
| s298         | 786             | 0                   | 786          | 100.00%        |
| s9234        | 10252           | 14                  | 10266        | 100.00%        |
