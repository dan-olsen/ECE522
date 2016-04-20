//
// Created by dolsen on 2/18/16.
//

#include "not_gate.hpp"

not_gate::not_gate(const std::string &name) : gate_base(name, NOT)
{

}

not_gate::~not_gate()
{

}

void not_gate::simulate()
{
    std::cout << "NOT" << std::endl;

}
