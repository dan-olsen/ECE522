//
// Created by dolsen on 2/18/16.
//

#ifndef PODEM_GATE_HPP
#define PODEM_GATE_HPP

#include "gate_types.hpp"
#include "simulation_values.hpp"

#include <vector>
#include <iostream>
#include <iomanip>
#include <unordered_map>
#include <memory>

class gate_base {
public:
    gate_base(const std::string& name, GATE_TYPE type);
    ~gate_base();

    std::string name() const;
    GATE_TYPE type() const;

    simulation_value::VALUE value() const;
    void set_value(simulation_value::VALUE v);

    simulation_value::VALUE controlling_value() const;
    simulation_value::VALUE noncontrolling_value() const;

    std::vector<std::string>::iterator fan_in_begin();
    std::vector<std::string>::iterator fan_in_end();
    std::vector<std::string>::iterator fan_out_begin();
    std::vector<std::string>::iterator fan_out_end();

    std::vector<std::string>& fan_in();
    std::vector<std::string>& fan_out();

    unsigned int fan_in_count();
    unsigned int fan_out_count();

    void add_fan_in(const std::string &id);
    void add_fan_out(const std::string &id);

    void replace_fan_in(const std::string &old_fan_in, const std::string &new_fan_in);
    void replace_fan_out(const std::string &old_fan_out, const std::string &new_fan_out);

    void set_circuit(std::shared_ptr<std::vector<gate_base>> c);
    void set_gate_lookup(std::shared_ptr<std::unordered_map<std::string, unsigned int>> l);

    void simulate();

    //virtual SIMULATION_VALUE controlling_value() = 0;
    //virtual SIMULATION_VALUE noncontrolling_value() = 0;

    friend std::ostream &operator<<( std::ostream &output, const gate_base &g );

protected:
    std::string _name;
    GATE_TYPE _type;

    simulation_value::VALUE _value;

    std::vector<std::string> _fan_in;
    std::vector<std::string> _fan_out;

    std::shared_ptr<std::vector<gate_base>> _sorted_circuit;
    std::shared_ptr<std::unordered_map<std::string, unsigned int>> _gate_lookup;
};

#endif //PODEM_GATE_HPP
