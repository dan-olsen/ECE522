//
// Created by dolsen on 2/18/16.
//

#include "nand_gate.hpp"

nand_gate::nand_gate(const std::string &name) : gate_base(name, NAND)
{

}

nand_gate::~nand_gate()
{

}

void nand_gate::simulate()
{
    std::cout << "NAND" << std::endl;
}
