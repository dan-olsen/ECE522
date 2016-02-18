//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_INPUT_HPP
#define PODEM_INPUT_HPP

#include "gate_base.hpp"
#include "gate_types.hpp"

class input : public gate_base {
public:
    input(const std::string &name);
    ~input();

};

#endif //PODEM_INPUT_HPP
