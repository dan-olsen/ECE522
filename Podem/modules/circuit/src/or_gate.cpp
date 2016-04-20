//
// Created by dolsen on 2/18/16.
//

#include "or_gate.hpp"

or_gate::or_gate(const std::string &name) : gate_base(name, OR)
{

}

or_gate::~or_gate()
{

}

void or_gate::simulate()
{
    std::cout << "OR" << std::endl;

}
