# ECE 522 - PODEM - Daniel Olsen

## Problems/Shortcomings

### Timeout

I had to implement a timeout function in the program because some faults would take a large amount of time and still not be able to find a solution. The timeout exits the recursive PODEM if the timeout duration has based before finding a solution. I distinguished between the 2 modes and used a timeout of 10 minutes if the faults were from a file and 10 seconds if we were doing all faults. If the fault timeouts I saw the fault is not covered and it reduces my fault coverage. This was only done because in the case of covering all faults if each fault in for example b19 takes 1 minute to find a solution it would take about a year to find all solutions.

### Misc. Problems

I only output the final patterns for the faults in the given fault files. The pattern files for some of the benchmarks in all faults mode grew very large.

When the program is in all fault mode I do not consider faults on STEMS. This was done to speed up the execution of the tool.

For b19 I had to remove the SA1 fault for SEL1_REG from the fault file because it caused the program to stall as it was trying to find a solution, even with the timeout. I am guessing the tool is getting caught in an infinite loop somewhere. This is the only case this happens.

There are a few cases where the tool was getting stuck in an infinite loop in the backtrace function. I could not find the cause of this however I added a check for this and force the given iteration of PODEM to return false.

## Results

### Given Fault Files

| Benchmark | Fault Coverage | Execution Time |
| --------- | -------------- | -------------- |
| b19       | 95.4545 %      | 2827.32 s      |
| b18       | 100 %          | 340.843 s      |
| s38584    | 91.1765 %      | 14.9109 s      |
| s38417    | 97.561 %       | 25.3751 s      |
| s35932    | 100 %          | 5.43709 s      |
| c7552     | 100 %          | 2.94841 s      |
| c6288     | 100 %          | 0.439296 s     |
| c5315     | 100 %          | 0.368806 s     |
| c3540     | 100 %          | 3.85985 s      |
| c2670     | 100 %          | 0.182157 s     |
| c1908     | 100 %          | 0.204444 s     |
| c880      | 100 %          | 0.0221425 s    |
| c17       | 100 %          | 0.000422044 s  |

### All Faults

| Benchmark | Fault Coverage | Execution Time |
| --------- | -------------- | -------------- |
| b19*      |                |                |
| b18*      |                |                |
| s38584    | 95.8 %         | 12445.7 s      |
| s38417    | 99.2739 %      | 14061 s        |
| s35932    | 79.4897 %      | 13694.7 s      |
| s820      | 100 %          | 0.89588 s      |
| s27       | 100 %          | 0.00103831 s   |
| c7552     | 98.2926 %      | 748.26 s       |
| c6288     | 99.3668 %      | 540.107 s      |
| c5315     | 99.4366 %      | 134.677 s      |
| c3540     | 93.8627 %      | 733.519 s      |
| c2670     | 97.3001 %      | 526.885 s      |
| c1908     | 99.069 %       | 143.077 s      |
| c880      | 100 %          | 1.5263 s       |
| c17       | 100 %          | 0.000522218 s  |

*b18 was ran for 19 hours and only 11,000 faults had been evaulated. b19 for 12 hours and only 6,000 faults had been evaulated. Both runs were ended since final results  could not be obtained in any reasonable time.
