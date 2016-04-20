//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_NOR_GATE_HPP
#define PODEM_NOR_GATE_HPP

#include "gate_base.hpp"
#include "gate_types.hpp"

class nor_gate : public gate_base {
public:
    nor_gate(const std::string &name);
    ~nor_gate();

    void simulate();

};

#endif //PODEM_NOR_GATE_HPP
