//
// Created by dolsen on 4/21/16.
//

#include "simulation_values.hpp"

const std::string simulation_value::strings [] = {"ZERO", "ONE", "X", "D", "D_BAR"};

const std::string fault_value::strings [] = {"SA0", "SA1"};

simulation_value::VALUE fault_value::fault_value_to_objective_value(fault_value::VALUE value)
{
    switch(value) {
        case SA0:
            return simulation_value::ONE;
        case SA1:
            return simulation_value::ZERO;
        default:
            std::cerr << "ERROR: Invalid fault value" << std::endl;
            std::cerr.flush();
            exit(1);
    }
}

simulation_value::VALUE fault_value::fault_value_to_simulation_value(fault_value::VALUE value)
{
    switch(value) {
        case SA0:
            return simulation_value::D;
        case SA1:
            return simulation_value::D_BAR;
        default:
            std::cerr << "ERROR: Invalid fault value" << std::endl;
            std::cerr.flush();
            exit(1);
    }
}

simulation_value::VALUE simulation_value::inverse_simulation_value(simulation_value::VALUE value)
{
    switch(value) {
        case ZERO:
            return ONE;
        case ONE:
            return ZERO;
        case X:
            return X;
        case D:
            return D_BAR;
        case D_BAR:
            return D;
        default:
            std::cerr << "ERROR: Invalid simulation value" << std::endl;
            std::cerr.flush();
            exit(1);
    }
}