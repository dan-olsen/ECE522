//
// Created by dolsen on 2/18/16.
//

#include "dff.hpp"

dff::dff(const std::string &name) : gate_base(name, DFF)
{

}

dff::~dff()
{

}

void dff::simulate()
{
    std::cout << "DFF" << std::endl;

}
