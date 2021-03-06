//
// Created by dolsen on 2/18/16.
//

#include "gate_base.hpp"

gate_base::gate_base(const std::string& name, GATE_TYPE type, std::vector<gate_base> &c, std::unordered_map<std::string, unsigned int> &l) :
    _sorted_circuit(c), _gate_lookup(l)
{
    _name = name;
    _type = type;

    _value = simulation_value::X;
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

simulation_value::VALUE gate_base::value() const
{
    return _value;
}

void gate_base::set_value(simulation_value::VALUE v)
{
    _value = v;
}

simulation_value::VALUE gate_base::controlling_value() const
{
    //INPUT, OUTPUT, NOT, BUFFER, AND, NAND, OR, NOR, DFF, STEM, UNKNOWN
    switch (_type)
    {
        case OR:
        case NOR:
            return simulation_value::ONE;
        case AND:
        case NAND:
            return simulation_value::ZERO;
        default:
            std::cerr << "Controlling value of invalid gate type" << std::endl;
            std::cerr.flush();
            exit(1);
    }
}

simulation_value::VALUE gate_base::noncontrolling_value() const
{
    //INPUT, OUTPUT, NOT, BUFFER, AND, NAND, OR, NOR, DFF, STEM, UNKNOWN
    switch (_type)
    {
        case OR:
        case NOR:
            return simulation_value::ZERO;
        case AND:
        case NAND:
            return simulation_value::ONE;
        default:
            std::cerr << "Noncontrolling value of invalid gate type" << std::endl;
            std::cerr.flush();
            exit(1);
    }
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

void gate_base::imply()
{
    bool dont_care = false;
    bool prop = false;

    switch(_type)
    {
        case INPUT:
            break;
        case BUFFER:
        case STEM:
        case OUTPUT:
        case DFF:
            if(!_fan_in.empty())
                _value = _sorted_circuit[_gate_lookup[_fan_in[0]]].value();

            break;
        case NOT:
            _value = simulation_value::inverse_simulation_value(_sorted_circuit[_gate_lookup[_fan_in[0]]].value());

            break;

        case AND:
        case NAND:
        case OR:
        case NOR:
            for(auto iter = _fan_in.begin(); iter != _fan_in.end(); ++iter)
            {
                if(_sorted_circuit[_gate_lookup[*iter]].value() == controlling_value())
                {
                    _value = controlling_value();
                    break;
                }
                else if (_sorted_circuit[_gate_lookup[*iter]].value() == simulation_value::X)
                {
                    _value = simulation_value::X;
                    dont_care = true;
                }
                else if(!dont_care)
                {
                    prop = propagate();

                    if(!prop)
                    {
                        _value = noncontrolling_value();
                    }
                }
            }

            break;
        case UNKNOWN:
        default:
            std::cerr << "Simulate with invalid gate type" << std::endl;
            exit(1);
    }

    if(_type == NAND || _type == NOR)
    {
        _value = simulation_value::inverse_simulation_value(_value);
    }
}

bool gate_base::propagate()
{
    for(auto iter = _fan_in.begin(); iter != _fan_in.end(); ++iter)
    {
        if(_sorted_circuit[_gate_lookup[*iter]].value() == simulation_value::D)
        {
            _value = simulation_value::D;
            return true;
        }
        else if (_sorted_circuit[_gate_lookup[*iter]].value() == simulation_value::D_BAR)
        {
            _value = simulation_value::D_BAR;
            return true;

        }
    }
    return false;
}

std::ostream &operator<<( std::ostream &output, const gate_base &g )
{
    output << std::setw(32) << std::left << g._name;// << std::endl;
    output << std::setw(10) << std::left << gate_type_strings[g._type];// << std::endl;
    output << std::setw(10) << std::left <<  g._fan_in.size();
    output << std::setw(10) << std::left <<  g._fan_out.size();

    output << std::setw(10) << std::left << simulation_value::strings[g._value];

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
