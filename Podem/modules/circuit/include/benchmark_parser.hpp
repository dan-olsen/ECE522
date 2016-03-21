//
// Created by dolsen on 3/2/16.
//

#ifndef PODEM_BENCHMARK_PARSER_HPP
#define PODEM_BENCHMARK_PARSER_HPP

#include "circuit.hpp"

#include <iostream>
#include <fstream>
#include <sstream>

class circuit;

class benchmark_parser {
    friend class circuit;
public:
    benchmark_parser(const std::string &benchmark_file);
    ~benchmark_parser();

    void read_benchmark(circuit &c);

private:
    std::string _benchmark_file;
    std::ifstream _benchmark;

    std::string my_replace(std::string &s, const std::string &toReplace, const std::string &replaceWith);

    void read_header(circuit &c);
    void read_inputs(circuit &c);
    void read_gates(circuit &c);

};

#endif //PODEM_BENCHMARK_PARSER_HPP