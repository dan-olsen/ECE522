//
// Created by dolsen on 2/11/16.
//

#include "circuit.hpp"

circuit::circuit(const std::string &benchmark_file)
{
    benchmark_parser parser(benchmark_file);

    parser.read_benchmark(*this);
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


