//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_NOT_GATE_HPP
#define PODEM_NOT_GATE_HPP

#include "gate_base.hpp"
#include "gate_types.hpp"

class not_gate : public gate_base {
public:
    not_gate(const std::string &name);
    ~not_gate();

};

#endif //PODEM_NOT_GATE_HPP
