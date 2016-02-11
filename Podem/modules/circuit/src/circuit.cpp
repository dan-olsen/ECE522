//
// Created by dolsen on 2/11/16.
//

#include "circuit.hpp"

circuit::circuit(const std::string &benchmark_file)
{
    read_circuit(benchmark_file);

}

circuit::~circuit()
{

}

void circuit::read_circuit(const std::string &benchmark_file)
{
    try {
        std::ifstream benchmark(benchmark_file);
        std::string tmp;

        benchmark >> tmp >> _name;
        benchmark >> tmp >> _input_count >> tmp;
        benchmark >> tmp >> _output_count >> tmp;
        benchmark >> tmp >> _inverter_count >> tmp;
        benchmark >> tmp >> _total_gate_count >> tmp;


    } catch(std::exception e) {


    }

}
