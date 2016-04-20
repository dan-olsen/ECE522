//
// Created by dolsen on 2/27/16.
//

#ifndef PODEM_FROM_H
#define PODEM_FROM_H

#include "gate_base.hpp"
#include "gate_types.hpp"

class from : public gate_base {
public:
    from(const std::string &name);
    ~from();

    void simulate();

};


#endif //PODEM_FROM_H
