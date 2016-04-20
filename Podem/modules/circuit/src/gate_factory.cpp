//
// Created by dolsen on 3/10/16.
//

#include "gate_factory.hpp"

std::shared_ptr<gate_base> gate_factory::create_gate(const std::string &type, const std::string &name)
{
    switch (string_to_gate_type(type)) {
        case NOT:
            return std::make_shared<not_gate>(name);
        case BUFFER:
            return std::make_shared<buffer>(name);
        case AND:
            return std::make_shared<and_gate>(name);
        case NAND:
            return std::make_shared<nand_gate>(name);
        case OR:
            return std::make_shared<or_gate>(name);
        case NOR:
            return std::make_shared<nor_gate>(name);
        case DFF:
            return std::make_shared<dff>(name);
        case STEM:
            return std::make_shared<from>(name);
        case INPUT:
            return std::make_shared<input>(name);
        case OUTPUT:
        case UNKNOWN:
        default:
            std::cerr << "ERROR: Invalid gate type of " << type << std::endl;
            exit(-1);
    }
    //throw "invalid pizza type.";
}