//
// Created by dolsen on 4/21/16.
//

#include "simulation_values.hpp"

SIMULATION_VALUE fault_value_to_simulation_value(FAULT_VALUE value)
{
    SIMULATION_VALUE s;

    switch(value) {
        case SA0:
            s = D;
            break;
        case SA1:
            s = D_BAR;
            break;
    }

    return s;
}