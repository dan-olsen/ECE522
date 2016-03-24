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
}

void circuit::print_circuit()
{
    std::cout << std::endl << "INDEX\tNAME\tTYPE\t#IN\t#OUT\tVAL\tFVAL\tFANIN\t\tFANOUT" << std::endl;

/*    for(unsigned int i = 0; i < _circuit.size(); ++i)
    {
        //std::cout << "Gate " << i << ": " << std::endl;
        //std::cout << _circuit[i] << std::endl;
        std::cout << i << "\t\t" << _sorted_circuit[i] << std::endl;
    }*/

    for(auto iter = _circuit.begin(); iter != _circuit.end(); ++iter)
    {
        std::cout << iter->second << std::endl;

    }
}

void circuit::topological_sort()
{
    std::stack<std::string> s;
    std::map<std::string, bool> visited;

    _sorted_circuit.reserve(_circuit.size());

    // Mark all the vertices as not visited
    for(auto iter = _circuit.begin(); iter != _circuit.end(); ++iter)
        visited.insert({iter->second.name(), false});

    // Call the recursive helper function to store Topological
    // Sort starting from all vertices one by one
    for (auto iter = _circuit.begin(); iter != _circuit.end(); ++iter)
        if (!visited.at(iter->second.name()))
            topological_sort_util(iter->second.name(), visited, s);

    // Print contents of stack
    while (!s.empty())
    {
        std::cout << s.top() << " ";
        s.pop();
    }
}

void circuit::topological_sort_util(const std::string &name, std::map<std::string, bool> &visited, std::stack<std::string> &s)
{
    // Mark the current node as visited.
    visited.at(name) = true;

    // Recur for all the vertices adjacent to this vertex
    std::list<int>::iterator i;
    //for (i = adj[v].begin(); i != adj[v].end(); ++i)
    for (auto iter = _circuit.at(name).fan_out().begin(); iter != _circuit.at(name).fan_out().end(); ++iter)
        if (!visited.at(*iter))
            topological_sort_util(*iter, visited, s);

    // Push current vertex to stack which stores result
    s.push(name);
}