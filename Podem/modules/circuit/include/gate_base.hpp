//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_GATE_HPP
#define PODEM_GATE_HPP

#include "gate_types.hpp"

#include <vector>
#include <iostream>

class gate_base {
public:
    gate_base(const std::string& name, GATE_TYPE type);
    virtual ~gate_base();

    std::string name() const;
    GATE_TYPE type() const;

    std::vector<std::string>& fan_in();
    std::vector<std::string>& fan_out();

    unsigned int fan_in_count();
    unsigned int fan_out_count();

    void add_fan_in(const std::string &id);
    void add_fan_out(const std::string &id);

    void replace_fan_in(const std::string &old_fan_in, const std::string &new_fan_in);
    void replace_fan_out(const std::string &old_fan_out, const std::string &new_fan_out);

    friend std::ostream &operator<<( std::ostream &output, const gate_base &g );

protected:
    std::string _name;
    GATE_TYPE _type;

    std::vector<std::string> _fan_in;
    std::vector<std::string> _fan_out;
};

#endif //PODEM_GATE_HPP
