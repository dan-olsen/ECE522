//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_NAND_GATE_HPP
#define PODEM_NAND_GATE_HPP

#include "gate_base.hpp"
#include "gate_types.hpp"

class nand_gate : public gate_base {
public:
    nand_gate(const std::string &name);
    ~nand_gate();

};

#endif //PODEM_NAND_GATE_HPP
