//
// Created by dolsen on 2/18/16.
//

#include "gate_base.hpp"

gate_base::gate_base()
{

}

std::string gate_base::name() const
{
    return _name;
}

gate_base::~gate_base()
{

}

GATE_TYPE gate_base::type() const
{
    return _type;
}


