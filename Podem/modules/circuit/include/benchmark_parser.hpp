//
// Created by dolsen on 3/2/16.
//

#ifndef PODEM_BENCHMARK_PARSER_HPP
#define PODEM_BENCHMARK_PARSER_HPP

#include "circuit.hpp"

#include <iostream>
#include <fstream>
#include <map>
#include <sstream>
#include <unordered_set>
#include <unordered_map>
#include <memory>

class circuit;

class benchmark_parser {
public:
    benchmark_parser(const std::string &benchmark_file);
    ~benchmark_parser();

    std::unordered_map<std::string, gate_base> &read_benchmark(circuit &c);

private:
    std::string _benchmark_file;
    std::ifstream _benchmark;

    std::map<GATE_TYPE, int> _gate_counts;
    int _total_gate_count;

    std::unordered_map<std::string, gate_base> _circuit;

    std::unordered_set<std::string> _dff_set;

    std::string my_replace(std::string &s, const std::string &toReplace, const std::string &replaceWith);

    void read_header(circuit &c);
    void read_inputs(circuit &c);
    void read_gates(circuit &c);


};

#endif //PODEM_BENCHMARK_PARSER_HPP
