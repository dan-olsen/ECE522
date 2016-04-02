//
// Created by dolsen on 2/11/16.
//

#include "circuit.hpp"

circuit::circuit(const std::string &benchmark_file)
{
    benchmark_parser parser(benchmark_file);

    parser.read_benchmark(*this);

    topological_sort();
}

circuit::~circuit()
{

}

void circuit::print_header()
{
    std::cout << "Benchmark: " << _name << std::endl;

    std::cout << "Inputs: " << _input_count << std::endl;
    std::cout << "Outputs: " << _output_count << std::endl;
    std::cout << "DFFs: " << _dff_count << std::endl;
    std::cout << "Inverters: " << _inverter_count << std::endl;
    std::cout << "Gates: " << _total_gate_count << std::endl;

    for(const auto& x : _gate_counts)
    {
        std::cout << gate_type_strings[x.first] << " Gates: " << x.second << std::endl;
    }

    std::cout <<std::endl;

    std::map<GATE_TYPE, int> gate_counts;

    for(unsigned int i = 0; i < _sorted_circuit.size(); ++i)
    {
        std::map<GATE_TYPE, int>::iterator lb = gate_counts.lower_bound(_circuit.at(_sorted_circuit[i]).type());

        if(lb != gate_counts.end() && !(gate_counts.key_comp()(_circuit.at(_sorted_circuit[i]).type(), lb->first)))
        {
            gate_counts.at(_circuit.at(_sorted_circuit[i]).type())++;

        }
        else
        {
            gate_counts.insert(lb, std::map<GATE_TYPE, int>::value_type(_circuit.at(_sorted_circuit[i]).type(), 1));
        }

    }

    int total = 0;

    for(const auto& x : gate_counts)
    {
        if(x.first == DFF)
        {
            std::cout << gate_type_strings[x.first] << " Gates: " << x.second/2 << std::endl;
            total+=x.second/2;
        }
        else
        {
            std::cout << gate_type_strings[x.first] << " Gates: " << x.second << std::endl;
            total+=x.second;

        }
    }
    std::cout << "Total Gates: " << total << std::endl;

}

void circuit::print_circuit()
{
    std::cout << std::endl << "NAME\tTYPE\t#IN\t#OUT\tVAL\tFANIN\tFANOUT" << std::endl;

    for(unsigned int i = 0; i < _sorted_circuit.size(); ++i)
    {
        std::cout << _circuit.at(_sorted_circuit[i]) << std::endl;

    }

    std::cout << std::endl << "DFF's" << std::endl;
    std::cout << "NAME\tTYPE\t#IN\t#OUT\tVAL\tFANIN\tFANOUT" << std::endl;

    for(unsigned int i = 0; i < _dffs.size(); ++i)
    {
        std::cout << _dffs[i] << std::endl;

    }

/*    for(auto iter = _circuit.begin(); iter != _circuit.end(); ++iter)
    {
        std::cout << iter->second << std::endl;

    }*/
}

void circuit::topological_sort()
{
    std::queue<std::string> q;
    std::map<std::string, int> in_degree;

    for(auto iter = _circuit.begin(); iter != _circuit.end(); ++iter)
    {
        in_degree.insert({iter->first, iter->second.fan_in_count()});
    }

    for(auto iter = _primary_inputs.begin(); iter != _primary_inputs.end(); ++iter)
    {
        q.push(*iter);
    }

    while(!q.empty())
    {
        std::string curr = q.front();
        q.pop();
        _sorted_circuit.push_back(curr);

        std::vector<std::string> curr_fan_out = _circuit.at(curr).fan_out();

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
