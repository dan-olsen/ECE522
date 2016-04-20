//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_BUFFER_HPP
#define PODEM_BUFFER_HPP

#include "gate_base.hpp"
#include "gate_types.hpp"

class buffer : public gate_base {
public:
    buffer(const std::string &name);
    ~buffer();

    void simulate();

};

#endif //PODEM_BUFFER_HPP
