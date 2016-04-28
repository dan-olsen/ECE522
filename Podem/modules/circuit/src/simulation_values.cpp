//
// Created by dolsen on 4/21/16.
//

#include "simulation_values.hpp"

SIMULATION_VALUE fault_value_to_simulation_value(FAULT_VALUE value)
{
    switch(value) {
        case SA0:
            return D;
        case SA1:
            return D_BAR;
        default:
            std::cerr << "ERROR: Invalid Fault Value" << std::endl;
            exit(1);
    }
}