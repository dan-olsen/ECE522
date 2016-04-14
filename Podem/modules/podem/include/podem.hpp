//
// Created by dolsen on 4/7/16.
//

#ifndef PODEM_PODEM_HPP
#define PODEM_PODEM_HPP

#include "circuit.hpp"

#include <iostream>

typedef std::pair<std::string, SIMULATION_VALUE> decision;
typedef std::pair<std::string, FAULT_VALUE> fault;

class podem {
public:
    podem(circuit &c);
    ~podem();

    void run();

private:
    circuit _c;
    std::stack<decision> _decisions;
    fault _current_fault;

    bool podem_recursive();
    bool x_path_check();
    void get_objective();
    void backtrace();
    void imply();
    bool is_fault_detected();
};


#endif //PODEM_PODEM_HPP
