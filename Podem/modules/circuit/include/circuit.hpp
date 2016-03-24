//
// Created by dolsen on 2/11/16.
//

#ifndef PODEM_CIRCUIT_HPP
#define PODEM_CIRCUIT_HPP

#include "gate_types.hpp"
#include "benchmark_parser.hpp"
#include "gate_base.hpp"
#include "and_gate.hpp"
#include "nand_gate.hpp"
#include "or_gate.hpp"
#include "nor_gate.hpp"
#include "not_gate.hpp"
#include "buffer.hpp"
#include "input.hpp"
#include "dff.hpp"
#include "from.hpp"

#include <vector>
#include <map>
#include <unordered_map>
#include <memory>
#include <stack>
#include <list>

class circuit {
    friend class benchmark_parser;
public:
    circuit(const std::string &benchmark_file);
    ~circuit();

    void print_header();
    void print_circuit();

private:
    std::string _name;

    int _input_count;
    int _output_count;
    int _dff_count;
    int _inverter_count;
    int _total_gate_count;

    std::map<GATE_TYPE, int> _gate_counts;

    std::unordered_map<std::string, gate_base> _circuit;
    std::vector<std::string> _sorted_circuit;

    void topological_sort();
    void topological_sort_util(const std::string &name, std::map<std::string, bool> &visited, std::stack<std::string> &s);
};

#endif //PODEM_CIRCUIT_HPP
