//
// Created by dolsen on 2/18/16.
//

#include "nor_gate.hpp"

nor_gate::nor_gate(const std::string &name) : gate_base(name, NOR)
{

}

nor_gate::~nor_gate()
{

}

void nor_gate::simulate()
{
    std::cout << "NOR" << std::endl;

}
