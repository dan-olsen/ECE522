//
// Created by dolsen on 2/11/16.
//

#include "circuit.hpp"

circuit::circuit(const std::string &benchmark_file)
{
    _size = 0;

    benchmark_parser parser(benchmark_file);

    parser.read_benchmark(*this);

    topological_sort();
}

circuit::~circuit()
{

}

std::shared_ptr<gate_base> circuit::at(const std::string &key)
{
    return _circuit.at(key);
}

std::vector<std::string>::iterator circuit::circuit_begin()
{
    return _sorted_circuit.begin();
}

std::vector<std::string>::iterator circuit::circuit_end()
{
    return _sorted_circuit.end();
}

std::vector<std::string>::iterator circuit::inputs_begin()
{
    return _primary_inputs.begin();
}

std::vector<std::string>::iterator circuit::inputs_end()
{
    return _primary_inputs.end();
}

std::vector<std::string>::iterator circuit::outputs_begin()
{
    return _primary_outputs.begin();
}

std::vector<std::string>::iterator circuit::outputs_end()
{
    return _primary_outputs.end();
}

void circuit::print_header()
{
    std::cout << "Benchmark Name: " << _name << std::endl;

    for(const auto& x : _gate_counts)
    {
        std::cout << gate_type_strings[x.first] << ": " << x.second << std::endl;
    }

    std::cout << "Total Gates: " << _size << std::endl;

}

void circuit::print_circuit()
{
    std::cout << std::endl;
    std::cout << std::setw(20) << std::left << "NAME";
    std::cout << std::setw(10) << std::left << "TYPE";
    std::cout << std::setw(10) << std::left << "#IN";
    std::cout << std::setw(10) << std::left << "#OUT";
    std::cout << std::setw(10) << std::left << "VAL";

    std::cout << "FANIN\tFANOUT" << std::endl;

    for(unsigned int i = 0; i < _sorted_circuit.size(); ++i)
    {
        std::cout << *(_circuit.at(_sorted_circuit[i])) << std::endl;

    }
}

void circuit::topological_sort()
{
    std::queue<std::string> q;
    std::map<std::string, int> in_degree;

    for(auto iter = _circuit.begin(); iter != _circuit.end(); ++iter)
    {
        in_degree.insert({iter->first, iter->second->fan_in_count()});
    }

    for(auto iter = _primary_inputs.begin(); iter != _primary_inputs.end(); ++iter)
    {
        q.push(*iter);
    }

    for(auto iter = _dffs.begin(); iter != _dffs.end(); ++iter)
    {
        q.push(iter->name() + "_IN");
    }

    while(!q.empty())
    {
        std::string curr = q.front();
        q.pop();
        _sorted_circuit.push_back(curr);

        std::vector<std::string> curr_fan_out = _circuit.at(curr)->fan_out();

        for (auto iter = curr_fan_out.begin(); iter != curr_fan_out.end(); ++iter)
        {
            in_degree.at(*iter) -= 1;

            if(in_degree.at(*iter) == 0)
            {
                q.push(*iter);
            }

        }
    }
}
