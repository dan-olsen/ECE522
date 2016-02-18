//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_NAND_GATE_HPP
#define PODEM_NAND_GATE_HPP

#include "gate_base.hpp"
#include "gate_types.hpp"

class nand : public gate_base {
public:
    nand(const std::string &name);
    ~nand();

};

#endif //PODEM_NAND_GATE_HPP
