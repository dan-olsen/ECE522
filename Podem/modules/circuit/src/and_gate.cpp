//
// Created by dolsen on 2/18/16.
//

#include "and_gate.hpp"

and_gate::and_gate(const std::string &name) : gate_base(name, AND)
{

}

and_gate::~and_gate()
{

}

void and_gate::simulate()
{
    std::cout << "AND" << std::endl;

}