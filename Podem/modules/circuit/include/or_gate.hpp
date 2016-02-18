//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_OR_GATE_HPP
#define PODEM_OR_GATE_HPP

#include "gate_base.hpp"
#include "gate_types.hpp"

class or_gate : public gate_base {
public:
    or_gate(const std::string &name);
    ~or_gate();

};

#endif //PODEM_OR_GATE_HPP
