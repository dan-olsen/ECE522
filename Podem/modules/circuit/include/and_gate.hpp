//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_AND_GATE_HPP
#define PODEM_AND_GATE_HPP

#include "gate_base.hpp"
#include "gate_types.hpp"

class and_gate : public gate_base {
public:
    and_gate(const std::string &name);
    ~and_gate();

    void simulate();

};

#endif //PODEM_AND_GATE_HPP
