//
// Created by dolsen on 2/11/16.
//

#include <bits/stringfwd.h>
#include "gate_types.hpp"

GATE_TYPE string_to_gate_type(const std::string &s)
{
    std::string tmp = s;

    tmp.erase (std::remove(tmp.begin(), tmp.end(), 's'), tmp.end());

    if(tmp == "AND" || tmp == "and")
    {
        return AND;
    }
    else if(tmp == "NAND" || tmp == "nand")
    {
        return NAND;
    }
    else if(tmp == "OR" || tmp == "or")
    {
        return OR;
    }
    else if(tmp == "NOR" || tmp == "nor_gate")
    {
        return NOR;
    }
    else if(tmp == "INPUT" || tmp == "input")
    {
        return INPUT;
    }
    else if(tmp == "OUTPUT" || tmp == "output")
    {
        return OUTPUT;
    }
    else if(tmp == "NOT" || tmp == "not")
    {
        return NOT;
    }
    else if(tmp == "BUFFER" || tmp == "buffer" || tmp == "BUFF" || tmp == "buff")
    {
        return BUFFER;
    }
    else if(tmp == "DFF" || tmp == "dff")
    {
        return DFF;
    }
    else if (tmp == "FROM" || tmp == "from")
    {
        return FROM;
    }
    else
    {
        std::cerr << "ERROR: Unknown gate_base type" << std::endl;

        return UNKNOWN;
    }
}
