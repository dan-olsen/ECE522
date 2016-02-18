//
// Created by dolsen on 2/11/16.
//

#include "circuit.hpp"

circuit::circuit(const std::string &benchmark_file)
{
    read_benchmark(benchmark_file);

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

    for(auto const& x : _gate_counts)
    {
        std::cout << gate_type_strings[x.first] << " Gates: " << x.second << std::endl;
    }
}

void circuit::read_benchmark(const std::string &benchmark_file)
{
    try {
        std::ifstream benchmark(benchmark_file);

        if(benchmark.good())
        {
            std::cout << "Reading benchmark header ..." << std::endl;
            read_header(benchmark);

            benchmark.close();
        }
        else
        {
            std::cerr << "ERROR: Cannot open " << benchmark_file << std::endl;
        }

    } catch(std::exception e) {
        std::cerr << "ERROR: " << e.what() << std::endl;

    }

}

void circuit::read_header(std::ifstream &benchmark)
{
    std::string tmp;

    benchmark >> tmp >> _name;
    benchmark >> tmp >> _input_count >> tmp;

    if (_name.front() == 'b')
    {
        benchmark.ignore();
        getline(benchmark, tmp);

    }

    benchmark >> tmp >> _output_count >> tmp;

    if (_name.front() == 'b' || _name.front() == 's')
    {
        benchmark >> tmp >> _dff_count >> tmp >> tmp;

    }
    else
    {
        _dff_count = 0;
    }

    benchmark >> tmp >> _inverter_count >> tmp;
    benchmark >> tmp >> _total_gate_count >> tmp;

    getline(benchmark, tmp);

    tmp.erase (std::remove(tmp.begin(), tmp.end(), '('), tmp.end());
    tmp.erase (std::remove(tmp.begin(), tmp.end(), ')'), tmp.end());
    tmp.erase (std::remove(tmp.begin(), tmp.end(), '+'), tmp.end());
    tmp.erase (std::remove(tmp.begin(), tmp.end(), ','), tmp.end());

    std::istringstream s(tmp);
    int x;

    while (!s.eof())
    {
        s >> x >> tmp;

        if (x != 0)
        {
            _gate_counts[string_to_gate_type(tmp)] = x;

        }
    }
}
