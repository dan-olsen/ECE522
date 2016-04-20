//
// Created by dolsen on 4/7/16.
//

#ifndef PODEM_PODEM_HPP
#define PODEM_PODEM_HPP

#include "circuit.hpp"

#include <iostream>

typedef std::pair<std::string, SIMULATION_VALUE> gate_value;
typedef std::pair<std::string, FAULT_VALUE> fault;

class podem {
public:
    podem(circuit &c);
    ~podem();

    void generate_patterns();
    void generate_patterns(const std::string& fault_file);

private:
    circuit &_c;

    std::vector<fault> _faults;

    fault _current_fault;

    bool podem_recursive();
    bool x_path_check();
    gate_value get_objective();
    gate_value backtrace();
    void imply(const gate_value& pi);
    bool is_fault_detected();

    void read_faults();
};


#endif //PODEM_PODEM_HPP
