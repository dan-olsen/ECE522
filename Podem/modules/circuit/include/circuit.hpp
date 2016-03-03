//
// Created by dolsen on 2/11/16.
//

#ifndef PODEM_CIRCUIT_HPP
#define PODEM_CIRCUIT_HPP

#include "benchmark_parser.hpp"

class circuit : public benchmark_parser {
public:
    circuit(const std::string &benchmark_file);
    ~circuit();

    void print_header();
    void print_circuit();

private:

};

#endif //PODEM_CIRCUIT_HPP
