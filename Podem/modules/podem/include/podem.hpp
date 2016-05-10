//
// Created by dolsen on 4/7/16.
//

#ifndef PODEM_PODEM_HPP
#define PODEM_PODEM_HPP

#include "circuit.hpp"

#include <iostream>

typedef std::pair<std::string, simulation_value::VALUE> gate_value;
typedef std::pair<std::string, fault_value::VALUE> fault;

class podem {
public:
    podem(circuit &c, const std::string &result_file_name);
    ~podem();

    void generate_patterns();
    void generate_patterns(const std::string& fault_file);

private:
    circuit &_c;
    std::string _result_file_name;
    std::string _fault_file_name;

    std::vector<fault> _faults;

    fault _current_fault;

    std::vector<std::string> _patterns;

    bool podem_recursive();

    bool x_path_check();
    bool x_path_check_recursive(const std::string &gate_name, std::unordered_map<std::string, bool> &visited);

    gate_value get_objective();
    gate_value get_d_frontier(const std::string& gate_name, simulation_value::VALUE v);

    gate_value backtrace(const gate_value& obj);

    void imply(const gate_value& pi);

    bool is_fault_detected();

    void initialize_faults();
    void read_faults();

    void store_pattern();
    void output_patterns();

    std::string my_replace(std::string &s, const std::string &toReplace, const std::string &replaceWith);
};


#endif //PODEM_PODEM_HPP
