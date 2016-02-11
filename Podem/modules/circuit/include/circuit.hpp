//
// Created by dolsen on 2/11/16.
//

#ifndef PODEM_CIRCUIT_HPP
#define PODEM_CIRCUIT_HPP

#include <string>
#include <map>
#include <fstream>

enum GATE_TYPE {INPUT, OUTPUT, NOT, BUFFER, AND, NAND, OR, NOR, DFF};

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

    std::map<std::string, int> _gate_counts;

    void read_circuit(const std::string& benchmark_file);
};


#endif //PODEM_CIRCUIT_HPP
