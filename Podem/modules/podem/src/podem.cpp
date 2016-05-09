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

    std::cout << std::endl << "Starting ATPG using PODEM ..." << std::endl;

    for(auto& f : _faults)
    {
        _c.initialize_to_x();

        _current_fault = f;

        std::cout << "Current Fault: " << _current_fault.first << " " << simulation_value::strings[_current_fault.second] << std::endl;

        if(podem_recursive())
        {
            std::cout << "Fault is tested" << std::endl;
        } else {
            std::cout << "Fault is not tested" << std::endl;
        }

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
        if(x_path_check())
        {
            gate_value objective = get_objective();

            std::cout << "Objective: " << objective.first << " " << simulation_value::strings[objective.second] << std::endl;

            gate_value pi = backtrace(objective);

            std::cout << "PI: " << pi.first << " " << simulation_value::strings[pi.second] << std::endl;

            imply(pi);

            if(podem_recursive())
            {
                return true;
            }

            pi.second = simulation_value::inverse_simulation_value(pi.second);

            imply(pi);

            if(podem_recursive())
            {
                return true;
            }

            pi.second = simulation_value::X;

            imply(pi);

            return false;
        }
        else
        {
            std::cout << "X path check is false" << std::endl;
            return false;
        }
    }

}

bool podem::x_path_check()
{
    std::unordered_map<std::string, bool> visited;

    for(auto iter = _c.circuit_begin(); iter != _c.circuit_end(); ++iter)
    {
        visited.insert(std::make_pair(iter->name(), false));
    }

    gate_value d = get_d_frontier(_current_fault.first, _c.at(_current_fault.first).value());
    std::cout << "D frontier is " << d.first << std::endl;

    return x_path_check_recursive(d.first, visited);
}

bool podem::x_path_check_recursive(const std::string &gate_name, std::unordered_map<std::string, bool> &visited)
{
    visited[gate_name] = true;

    if(_c.at(gate_name).value() == simulation_value::X)
    {
        if (_c.at(gate_name).fan_out_count() != 0)
        {
            for(auto iter = _c.at(gate_name).fan_out_begin(); iter != _c.at(gate_name).fan_out_end(); ++iter)
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
    std::cout << simulation_value::strings[_c.at(_current_fault.first).value()] << " " << simulation_value::strings[fault_value::fault_value_to_simulation_value(_current_fault.second)] << std::endl;
    if(_c.at(_current_fault.first).value() != fault_value::fault_value_to_simulation_value(_current_fault.second))
    {
        return std::make_pair(_current_fault.first, fault_value::fault_value_to_objective_value(_current_fault.second));
    }
    else
    {
        gate_value d = get_d_frontier(_current_fault.first, _c.at(_current_fault.first).value());

        std::cout << "D frontier is " << d.first << std::endl;

        for(auto iter = _c.at(d.first).fan_in_begin(); iter != _c.at(d.first).fan_in_end(); ++iter)
        {
            //GATE_TYPE type= _c.at(d)->type();

            if(_c.at(*iter).value() == simulation_value::X)
            {
                //TODO: Check if STEM/DFF/INPUT
                return std::make_pair(*iter, _c.at(d.first).noncontrolling_value());

            }
        }

        std::cerr << "D frontier is invalid type" << std::endl;
        std::cerr.flush();
        exit(1);

        //TODO: Finish
        //l = unassigned input of d

        //if(d has controlling values)
            //c = controlling input value of d
        //else if (0 value easier to get an input of XOR/EQUIVALENCE gate)
            //c = ONE;
        //else
            //c = ZERO;

        //return std::make_pair(l, inverse_simulation_value(c));
    }
}

gate_value podem::get_d_frontier(const std::string& gate_name, simulation_value::VALUE v)
{
    for(auto iter = _c.at(gate_name).fan_out_begin(); iter != _c.at(gate_name).fan_out_end(); ++iter)
    {
        if(_c.at(*iter).value() == simulation_value::D || _c.at(*iter).value() == simulation_value::D_BAR)
        {
            gate_value gv = get_d_frontier(*iter, _c.at(*iter).value());

            if(!gv.first.empty())
            {
                return gv;
            }
        }
        else if(_c.at(*iter).value() == simulation_value::X)
        {
            return std::make_pair(*iter, simulation_value::X);
        }
    }

    return std::make_pair("", simulation_value::X);
}

gate_value podem::backtrace(const gate_value& obj)
{
    simulation_value::VALUE v = obj.second;
    std::string gate = obj.first;

    if(gate == "23")
    {
    }

    while(_c.at(gate).type() != INPUT)
    {
        //std::cout << "Backtrace: " << gate << std::endl;
        GATE_TYPE type = _c.at(gate).type();

        if(type == NAND || type == NOR || type == NOT)
        {
            v = simulation_value::inverse_simulation_value(v);
        }

        for(auto iter = _c.at(gate).fan_in_begin(); iter != _c.at(gate).fan_in_end(); ++iter)
        {
            if(_c.at(*iter).value() == simulation_value::X)
            {
                gate = *iter;

                break;
            }
        }

        //TODO: Add controllability
        //if (gate requires all inputs set)
            //select unassigned input a of gate with hardest controllability to value v
        //else
            //select unassigned input a of gate with hardest controllability to value v

        //gate = a;

    }

    return std::make_pair(gate, v);
}

void podem::imply(const gate_value& pi)
{
    _c.at(pi.first).set_value(pi.second);

    for(auto iter = _c.circuit_begin(); iter != _c.circuit_begin() + _c.position_of(_current_fault.first); ++iter)
    {
        iter->imply();
    }
    std::cout << simulation_value::strings[_c.at(_current_fault.first).value()] << std::endl;


    _c.at(_current_fault.first).imply();
    std::cout << simulation_value::strings[_c.at(_current_fault.first).value()] << std::endl;

    if(fault_value::fault_value_to_objective_value(_current_fault.second) == _c.at(_current_fault.first).value())
    {

        _c.at(_current_fault.first).set_value(fault_value::fault_value_to_simulation_value(_current_fault.second));


    }
    std::cout << simulation_value::strings[_c.at(_current_fault.first).value()] << std::endl;

    for(auto iter = _c.circuit_begin() + _c.position_of(_current_fault.first) + 1; iter != _c.circuit_end(); ++iter)
    {
        iter->imply();
    }

    _c.print_circuit();
}

bool podem::is_fault_detected()
{
    for(auto iter = _c.outputs_begin(); iter != _c.outputs_end(); ++iter)
    {
        simulation_value::VALUE v = _c.at(*iter).value();

        if(v == simulation_value::D || v == simulation_value::D_BAR)
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
        for(auto iter = _c.circuit_begin(); iter != _c.circuit_end(); ++iter)
        {
            _faults.push_back(std::make_pair(iter->name(), fault_value::SA0));
            _faults.push_back(std::make_pair(iter->name(), fault_value::SA1));

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

                if(_c.does_gate_exist(fault_site))
                {
                    _faults.push_back(std::make_pair(fault_site, (fault_value::VALUE)fault_value));

                }
                else
                {
                    std::cerr << "Invalid fault site: " << fault_site << std::endl;
                }
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
