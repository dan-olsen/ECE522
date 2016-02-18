//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_GATE_HPP
#define PODEM_GATE_HPP

#include "gate_types.hpp"

#include <vector>

class gate_base {
public:
    gate_base();
    virtual ~gate_base();

    std::string name() const;
    GATE_TYPE type() const;

protected:
    std::string _name;
    GATE_TYPE _type;

    std::vector<int> _fan_in;
    std::vector<int> _fan_out;
};

#endif //PODEM_GATE_HPP
