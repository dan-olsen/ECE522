//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_OUTPUT_HPP
#define PODEM_OUTPUT_HPP

#include "gate_base.hpp"
#include "gate_types.hpp"

class output : public gate_base {
public:
    output(const std::string &name);
    ~output();

};

#endif //PODEM_OUTPUT_HPP
