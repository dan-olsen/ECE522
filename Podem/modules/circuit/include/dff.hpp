//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_DFF_HPP
#define PODEM_DFF_HPP

#include "gate_base.hpp"
#include "gate_types.hpp"

class dff : public gate_base {
public:
    dff(const std::string &name);
    ~dff();

};

#endif //PODEM_DFF_HPP
