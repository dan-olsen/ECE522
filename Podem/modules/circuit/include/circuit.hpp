//
// Created by dolsen on 2/11/16.
//

#ifndef PODEM_CIRCUIT_HPP
#define PODEM_CIRCUIT_HPP

#include "gate_types.hpp"
#include "gate_base.hpp"
#include "benchmark_parser.hpp"

#include <vector>
#include <map>
#include <unordered_map>
#include <memory>
#include <stack>
#include <list>
#include <queue>

class circuit {
    friend class benchmark_parser;
public:
    circuit(const std::string &benchmark_file);
    ~circuit();

    void print_header();
    void print_circuit();

    void initialize_to_x();

    gate_base& at(const std::string &key);
    unsigned int position_of(const std::string &key);

    bool does_gate_exist(const std::string &key);

    std::vector<gate_base>::iterator circuit_begin();
    std::vector<gate_base>::iterator circuit_end();

    std::vector<std::string>::iterator inputs_begin();
    std::vector<std::string>::iterator inputs_end();

    std::vector<std::string>::iterator outputs_begin();
    std::vector<std::string>::iterator outputs_end();

private:
    std::string _name;

    int _size;

    std::map<GATE_TYPE, int> _gate_counts;

    std::vector<std::string> _primary_inputs;
    std::vector<std::string> _primary_outputs;

    std::vector<gate_base> _sorted_circuit;
    std::unordered_map<std::string, unsigned int> _gate_lookup;

    std::vector<gate_base> _dffs;

    void topological_sort(std::unordered_map<std::string, gate_base> &c);
};

#endif //PODEM_CIRCUIT_HPP
