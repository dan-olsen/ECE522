//
// Created by dolsen on 4/2/16.
//

#ifndef PODEM_SIMULATION_VALUES_HPP
#define PODEM_SIMULATION_VALUES_HPP

#include <string>
#include <iostream>

class five_value {
public:
    enum VALUE {ZERO, ONE, X, D, D_BAR};
    static const std::string strings [5];

};

class simulation_value {
public:
    enum VALUE {ZERO, ONE, X};
    static const std::string strings [3];

    static VALUE inverse_simulation_value(VALUE value);

};

class fault_value {
public:
    enum VALUE {SA0, SA1};
    static const std::string strings [2];

    static simulation_value::VALUE fault_value_to_simulation_value(VALUE value);

};

#endif //PODEM_SIMULATION_VALUES_HPP
