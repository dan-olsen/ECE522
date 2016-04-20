//
// Created by dolsen on 4/7/16.
//

#include "podem.hpp"

podem::podem(circuit& c) : _c(c)
{

}

podem::~podem()
{

}

void podem::generate_patterns()
{
    for(auto iter = _c.circuit_begin(); iter != _c.circuit_end(); ++iter)
    {
        _c.at(*iter)->simulate();
    }
}

void podem::generate_patterns(const std::string& fault_file)
{

}

bool podem::podem_recursive()
{
    if(is_fault_detected())
    {
        return true;
    }
    else
    {
        if(x_path_check())
        {
            gate_value objective = get_objective();
            gate_value pi = backtrace();

            imply(pi);


        }
    }

}

bool podem::x_path_check()
{

}

gate_value podem::get_objective()
{

}

gate_value podem::backtrace()
{

}

void podem::imply(const gate_value& pi)
{
    //TODO: Set pi value

    for(auto iter = _c.circuit_begin(); iter != _c.circuit_end(); ++iter)
    {
        _c.at(*iter)->simulate();
    }
}

bool podem::is_fault_detected()
{
    for(auto iter = _c.outputs_begin(); iter != _c.outputs_end(); ++iter)
    {
        SIMULATION_VALUE v = _c.at(*iter)->value();

        if(v == D || v == D_BAR)
        {
            return true;
        }
    }

    return false;
}

void podem::read_faults()
{

}
