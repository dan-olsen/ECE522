//
// Created by dolsen on 2/11/16.
//

#include "circuit.hpp"

circuit::circuit(const std::string &benchmark_file)
{
    std::cout << "In circuit constructor" << std::endl;
    read_benchmark(benchmark_file);

}

circuit::~circuit()
{

}

void circuit::read_benchmark(const std::string &benchmark_file)
{
    try {
        std::ifstream benchmark(benchmark_file);
        std::string tmp;

        if(benchmark.good())
        {
            benchmark >> tmp >> _name;
            benchmark >> tmp >> _input_count >> tmp;
            benchmark >> tmp >> _output_count >> tmp;
            benchmark >> tmp >> _inverter_count >> tmp;
            benchmark >> tmp >> _total_gate_count >> tmp;
            benchmark >> tmp;

            std::getline(benchmark, tmp);

            std::istringstream s(tmp);
            int x;

            while ((s.peek() != ')') && (s.ignore(256, '+')) && (s >> x >> tmp))
            {
                _gate_counts[string_to_gate_type(tmp)] = x;

            }

            std::cout << _gate_counts[NAND] << std::endl;
            std::cout << _gate_counts[BUFFER] << std::endl;

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
