//
// Created by dolsen on 3/10/16.
//

#ifndef PODEM_GATE_FACTORY_HPP
#define PODEM_GATE_FACTORY_HPP

#include "gate_types.hpp"
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

#include <memory>
#include <stdexcept>

class gate_factory {
public:
    static std::shared_ptr<gate_base> create_gate(const std::string &type, const std::string &name);

};


#endif //PODEM_GATE_FACTORY_HPP
