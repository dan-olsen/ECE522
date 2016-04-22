//
// Created by dolsen on 4/2/16.
//

#ifndef PODEM_SIMULATION_VALUES_HPP
#define PODEM_SIMULATION_VALUES_HPP

#include <string>
#include <iostream>

enum SIMULATION_VALUE {ZERO, ONE, X, D, D_BAR};
static const std::string simulation_value_strings [] = {"ZERO", "ONE", "X", "D", "D_BAR"};

enum FAULT_VALUE {SA0, SA1};
static const std::string fault_value_strings [] = {"SA0", "SA1"};

FAULT_VALUE simulation_value_to_fault_value(SIMULATION_VALUE value);
SIMULATION_VALUE fault_value_to_simulation_value(FAULT_VALUE value);

#endif //PODEM_SIMULATION_VALUES_HPP
