//
// Created by dolsen on 3/2/16.
//

#ifndef PODEM_BENCHMARK_PARSER_HPP
#define PODEM_BENCHMARK_PARSER_HPP

#include "circuit_base.hpp"

#include <fstream>
#include <sstream>
#include <unordered_map>

class benchmark_parser : public circuit_base {
public:
    benchmark_parser(const std::string &benchmark_file);
    ~benchmark_parser();

protected:
    void read_benchmark(const std::string &benchmark_file);

private:
    void read_header(std::ifstream &benchmark);
    void read_circuit(std::ifstream &benchmark);
};

#endif //PODEM_BENCHMARK_PARSER_HPP
