//
// Created by dolsen on 4/7/16.
//

#include "podem.hpp"

podem::podem(circuit& c) : _c(c)
{
    _c.initialize_to_x();

}

podem::~podem()
{

}

void podem::generate_patterns()
{
    initialize_faults();

    for(const auto& f : _faults)
    {
        _current_fault = f;

        std::cout << "Current Fault: " << _current_fault.first << " " << fault_value_strings[_current_fault.second] << std::endl;

        //podem_recursive();

    }
}

void podem::generate_patterns(const std::string& fault_file)
{
    _fault_file_name = fault_file;

    generate_patterns();
}

bool podem::podem_recursive()
{
    if(is_fault_detected())
    {
        return true;
    }
    else
    {
        if(x_path_check("ONLY HERE TO BUILD"))
        {
            gate_value objective = get_objective();

            gate_value pi = backtrace(objective);

            imply(pi);

            if(podem_recursive())
            {
                return true;
            }

            //TODO: pi.val = -pi.val

            imply(pi);

            if(podem_recursive())
            {
                return true;
            }

            pi.second = X;

            imply(pi);

            return false;
        }
        else
        {
            return false;
        }
    }

}

bool podem::x_path_check(const std::string &gate_name)
{
    std::unordered_map<std::string, bool> visited;

    for(auto iter = _c.circuit_begin(); iter != _c.circuit_end(); ++iter)
    {
        visited.insert(std::make_pair(_c.at(*iter)->name(), false));
    }

    return x_path_check_recursive(gate_name, visited);
}

bool podem::x_path_check_recursive(const std::string &gate_name, std::unordered_map<std::string, bool> &visited)
{
    visited[gate_name] = true;

    std::cout << gate_name << " " << simulation_value_strings[_c.at(gate_name)->value()] << std::endl;

    if(_c.at(gate_name)->value() == X)
    {
        if (_c.at(gate_name)->fan_out_count() != 0)
        {
            for(auto iter = _c.at(gate_name)->fan_out_begin(); iter != _c.at(gate_name)->fan_out_end(); ++iter)
            {
                if(!visited[*iter])
                {
                    if(x_path_check_recursive(*iter, visited))
                    {
                        return true;
                    }
                }
            }
        }
        else
        {
            return true;

        }
    }

    return false;
}

gate_value podem::get_objective()
{
    if(_c.at(_current_fault.first)->value() == X)
    {
        //TODO: return std::make_pair(_current_fault.first, -_current_fault.second);
    }
    else
    {

    }
}

gate_value podem::backtrace(const gate_value& obj)
{
    SIMULATION_VALUE v = obj.second;
    std::string gate = obj.first;

    while(_c.at(gate)->type() != INPUT)
    {
        GATE_TYPE type = _c.at(gate)->type();

        if(type == NAND || type == NOR || type == NOT)
        {
            //TODO: v = -v
        }

        //TODO: if gate requires all inputs set


    }

    return std::make_pair(gate, v);
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

void podem::initialize_faults()
{
    if(_fault_file_name.empty())
    {
        //TODO: Add all faults
        for(auto iter = _c.circuit_begin(); iter != _c.circuit_end(); ++iter)
        {
            _faults.push_back(std::make_pair(*iter, SA0));
            _faults.push_back(std::make_pair(*iter, SA1));

        }
    }
    else
    {
        read_faults();
    }
}

void podem::read_faults()
{
    std::ifstream fault_file;

    try {
        fault_file.open(_fault_file_name);

        if(fault_file.good()) {
            std::cout << "Reading fault file: " << _fault_file_name << std::endl;

            std::string tmp;

            while (getline(fault_file, tmp))
            {
                std::string fault_site;
                int fault_value;

                my_replace(tmp, "/", " ");

                std::stringstream s(tmp);

                s >> fault_site >> fault_value;

                _faults.push_back(std::make_pair(fault_site, (FAULT_VALUE)fault_value));
            }

            fault_file.close();
        }
        else
        {
            std::cerr << "ERROR: Cannot open " << _fault_file_name << std::endl;
        }

    } catch(std::exception e) {
        std::cerr << "ERROR: " << e.what() << std::endl;

    }
}

std::string podem::my_replace(std::string &s, const std::string &toReplace, const std::string &replaceWith)
{
    return(s.replace(s.find(toReplace), toReplace.length(), replaceWith));
}
