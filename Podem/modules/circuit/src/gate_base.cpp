//
// Created by dolsen on 2/18/16.
//

#include "gate_base.hpp"

gate_base::gate_base(const std::string& name, GATE_TYPE type)
{
    _name = name;
    _type = type;
}

gate_base::~gate_base()
{

}

std::string gate_base::name() const
{
    return _name;
}

GATE_TYPE gate_base::type() const
{
    return _type;
}


void gate_base::add_fan_in(const std::string &id)
{
    _fan_in.push_back(id);
}

void gate_base::add_fan_out(const std::string &id)
{
    _fan_out.push_back(id);
}

std::vector<std::string> &gate_base::fan_in()
{
    return _fan_in;
}

std::vector<std::string> &gate_base::fan_out()
{
    return _fan_out;
}

unsigned int gate_base::fan_in_count() {
    return _fan_in.size();
}

unsigned int gate_base::fan_out_count() {
    return _fan_out.size();
}

std::ostream &operator<<( std::ostream &output, const gate_base &g )
{
    output << g._name;// << std::endl;
    output << "\t\t" << gate_type_strings[g._type];// << std::endl;
    output << "\t" <<  g._fan_in.size();
    output << "\t" <<  g._fan_out.size();

    output << "\t\t0\t0\t";

    output << "\t{";
    for (auto iter = g._fan_in.begin(); iter != g._fan_in.end(); iter++)
    {
        if (iter != g._fan_in.begin())
        {
            output << ", ";
        }

        output << *iter;
    }
    output << "}";// << std::endl;

    output << "\t\t{";
    for (auto iter = g._fan_out.begin(); iter != g._fan_out.end(); iter++)
    {
        if (iter != g._fan_out.begin())
        {
            output << ", ";
        }

        output << *iter;
    }
    output << "}";// << std::endl;

    return output;
}
