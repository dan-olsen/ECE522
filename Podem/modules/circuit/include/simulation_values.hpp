//
// Created by dolsen on 4/2/16.
//

#ifndef PODEM_SIMULATION_VALUES_HPP
#define PODEM_SIMULATION_VALUES_HPP

#include <string>

enum SIMULATION_VALUE {ZERO, ONE, X, D, D_BAR};
static const std::string simulation_value_strings [] = {"ZERO", "ONE", "X", "D", "D_BAR"};

enum FAULT_VALUE {SA0, SA1};
static const std::string fault_value_strings [] = {"SA0", "SA1"};

#endif //PODEM_SIMULATION_VALUES_HPP
