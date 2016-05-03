//
// Created by dolsen on 4/21/16.
//

#include "simulation_values.hpp"

SIMULATION_VALUE fault_value_to_simulation_value(FAULT_VALUE value)
{
    switch(value) {
        case SA0:
            return ONE;
        case SA1:
            return ZERO;
        default:
            std::cerr << "ERROR: Invalid fault value" << std::endl;
            exit(1);
    }
}

SIMULATION_VALUE inverse_simulation_value(SIMULATION_VALUE value)
{
    switch(value) {
        case ZERO:
            return ONE;
        case ONE:
            return ZERO;
        case D:
            return D_BAR;
        case D_BAR:
            return D;
        default:
            std::cerr << "ERROR: Invalid simulation value" << std::endl;
            exit(1);
    }
}