//
// Created by dolsen on 3/10/16.
//

#include "gate_factory.hpp"

std::unique_ptr<gate_base> gate_factory::create_gate(const std::string &type, const std::string &name)
{
    switch (string_to_gate_type(type)) {
        case NOT:
            return std::unique_ptr<not_gate>(new not_gate(name));
        case BUFFER:
            return std::unique_ptr<buffer>(new buffer(name));
        case AND:
            return std::unique_ptr<and_gate>(new and_gate(name));
        case NAND:
            return std::unique_ptr<nand_gate>(new nand_gate(name));
        case OR:
            return std::unique_ptr<or_gate>(new or_gate(name));
        case NOR:
            return std::unique_ptr<nor_gate>(new nor_gate(name));
        case DFF:
            return std::unique_ptr<dff>(new dff(name));
        case FROM:
        case INPUT:
        case OUTPUT:
        case UNKNOWN:
        default:
            std::cerr << "ERROR: Invalid gate type" << std::endl;
            exit(-1);
    }
    //throw "invalid pizza type.";
}