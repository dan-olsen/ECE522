//
// Created by dolsen on 2/11/16.
//

#ifndef PODEM_CIRCUIT_HPP
#define PODEM_CIRCUIT_HPP

#include "gate_types.hpp"

#include <string>
#include <map>
#include <fstream>
#include <iostream>
#include <sstream>

class circuit {
public:
    circuit(const std::string &benchmark_file);
    ~circuit();

private:
    std::string _name;

    int _input_count;
    int _output_count;
    int _inverter_count;
    int _total_gate_count;

    std::map<GATE_TYPE, int> _gate_counts;

    void read_benchmark(const std::string &benchmark_file);
};


#endif //PODEM_CIRCUIT_HPP
