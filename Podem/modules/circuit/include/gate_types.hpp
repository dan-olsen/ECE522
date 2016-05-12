//
// Created by dolsen on 2/11/16.
//

#ifndef PODEM_GATE_TYPES_HPP
#define PODEM_GATE_TYPES_HPP

#include <string>
#include <algorithm>
#include <iostream>

enum GATE_TYPE {INPUT, OUTPUT, NOT, BUFFER, AND, NAND, OR, NOR, DFF, STEM, UNKNOWN};
static const std::string gate_type_strings [] = {"INPUT", "OUTPUT", "NOT", "BUFFER", "AND", "NAND", "OR", "NOR", "DFF", "STEM", "UNKNOWN"};

GATE_TYPE string_to_gate_type(const std::string &s);

#endif //PODEM_GATE_TYPES_HPP
