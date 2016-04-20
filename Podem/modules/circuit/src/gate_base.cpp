//
// Created by dolsen on 2/18/16.
//

#include "gate_base.hpp"

gate_base::gate_base(const std::string& name, GATE_TYPE type)
{
    _name = name;
    _type = type;

    _value = X;
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

SIMULATION_VALUE gate_base::value() const
{
    return _value;
}

std::vector<std::string>::iterator gate_base::fan_in_begin()
{
    return _fan_in.begin();
}

std::vector<std::string>::iterator gate_base::fan_in_end()
{
    return _fan_in.end();
}

std::vector<std::string>::iterator gate_base::fan_out_begin()
{
    return _fan_out.begin();
}

std::vector<std::string>::iterator gate_base::fan_out_end()
{
    return _fan_out.end();
}

void gate_base::add_fan_in(const std::string &id)
{
    _fan_in.push_back(id);
}

void gate_base::add_fan_out(const std::string &id)
{
    _fan_out.push_back(id);
}

void gate_base::replace_fan_in(const std::string &old_fan_in, const std::string &new_fan_in)
{
    std::replace(_fan_in.begin(), _fan_in.end(), old_fan_in, new_fan_in);
}

void gate_base::replace_fan_out(const std::string &old_fan_out, const std::string &new_fan_out)
{
    std::replace(_fan_out.begin(), _fan_out.end(), old_fan_out, new_fan_out);
}

std::vector<std::string> &gate_base::fan_in()
{
    return _fan_in;
}

std::vector<std::string> &gate_base::fan_out()
{
    return _fan_out;
}

unsigned int gate_base::fan_in_count()
{
    return (unsigned int)_fan_in.size();
}

unsigned int gate_base::fan_out_count()
{
    return (unsigned int)_fan_out.size();
}

std::ostream &operator<<( std::ostream &output, const gate_base &g )
{
    output << std::setw(20) << std::left << g._name;// << std::endl;
    output << std::setw(10) << std::left << gate_type_strings[g._type];// << std::endl;
    output << std::setw(10) << std::left <<  g._fan_in.size();
    output << std::setw(10) << std::left <<  g._fan_out.size();

    output << std::setw(10) << std::left << simulation_value_strings[g._value];

    output << "{";
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
