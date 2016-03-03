//
// Created by dolsen on 3/2/16.
//

#ifndef PODEM_CIRCUIT_BASE_HPP
#define PODEM_CIRCUIT_BASE_HPP

#include "gate_types.hpp"
#include "gate_base.hpp"
#include "input.hpp"
#include "not_gate.hpp"
#include "buffer.hpp"
#include "and_gate.hpp"
#include "nand_gate.hpp"
#include "or_gate.hpp"
#include "nor_gate.hpp"
#include "dff.hpp"
#include "from.hpp"

#include <string>
#include <vector>
#include <map>
#include <iostream>

class circuit_base {
public:

protected:
    std::string _name;

    int _input_count;
    int _output_count;
    int _dff_count;
    int _inverter_count;
    int _total_gate_count;

    std::map<GATE_TYPE, int> _gate_counts;

    std::vector<gate_base> _circuit;
};

#endif //PODEM_CIRCUIT_BASE_HPP
