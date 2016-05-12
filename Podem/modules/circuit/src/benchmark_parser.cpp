//
// Created by dolsen on 3/2/16.
//

#include "benchmark_parser.hpp"

benchmark_parser::benchmark_parser(const std::string &benchmark_file)
{
    _benchmark_file = benchmark_file;

    _gate_counts.insert({INPUT, 0});
    _gate_counts.insert({OUTPUT, 0});
    _gate_counts.insert({NOT, 0});

    _total_gate_count = 0;
}

benchmark_parser::~benchmark_parser()
{
    if(_benchmark.is_open())
    {
        _benchmark.close();
    }
}

std::unordered_map<std::string, gate_base> &benchmark_parser::read_benchmark(circuit &c)
{
    try {
        _benchmark.open(_benchmark_file);

        if(_benchmark.good())
        {
            std::cout << "Reading benchmark file: " << _benchmark_file << std::endl;

            read_header(c);

            read_gates(c);

            _benchmark.close();
        }
        else
        {
            std::cerr << "ERROR: Cannot open " << _benchmark_file << std::endl;
        }

    } catch(std::exception e) {
        std::cerr << "ERROR: " << e.what() << std::endl;

    }

    return _circuit;
}

std::string benchmark_parser::my_replace(std::string &s, const std::string &toReplace, const std::string &replaceWith)
{
    return(s.replace(s.find(toReplace), toReplace.length(), replaceWith));
}

void benchmark_parser::read_header(circuit &c)
{
    std::string tmp;

    _benchmark >> tmp >> c._name;
    _benchmark >> tmp >> _gate_counts.at(INPUT) >> tmp;

    _benchmark >> tmp >> _gate_counts.at(OUTPUT) >> tmp;

    if (c._name.front() == 'b' || c._name.front() == 's')
    {
        _gate_counts.insert({DFF, 0});

        _benchmark >> tmp >> _gate_counts.at(DFF) >> tmp >> tmp;

    }

    _benchmark >> tmp >> _gate_counts.at(NOT) >> tmp;
    _benchmark >> tmp >> _total_gate_count >> tmp;

    getline(_benchmark, tmp);

    tmp.erase (std::remove(tmp.begin(), tmp.end(), '('), tmp.end());
    tmp.erase (std::remove(tmp.begin(), tmp.end(), ')'), tmp.end());
    tmp.erase (std::remove(tmp.begin(), tmp.end(), '+'), tmp.end());
    tmp.erase (std::remove(tmp.begin(), tmp.end(), ','), tmp.end());

    std::istringstream s(tmp);
    int x;

    while (!s.eof())
    {
        s >> x >> tmp;

        if (x != 0)
        {
            _gate_counts[string_to_gate_type(tmp)] = x;

        }
    }
}

void benchmark_parser::read_gates(circuit &c)
{
    std::string tmp;

    _benchmark.ignore();

    //Read inputs
    while(getline(_benchmark, tmp))
    {
        if (!tmp.empty())
        {
            my_replace(tmp, "(", " ");
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ')'), tmp.end());

            std::stringstream s(tmp);

            s >> tmp;

            if (string_to_gate_type(tmp) == INPUT)
            {
                s >> tmp;

                gate_base gate(tmp, INPUT, c._sorted_circuit, c._gate_lookup);

                _circuit.insert({tmp, gate});
                c._primary_inputs.push_back(tmp);
            }
        }
        else
        {
            break;
        }
    }

    //Read outputs
    while(getline(_benchmark, tmp))
    {
        if (!tmp.empty())
        {
            my_replace(tmp, "(", " ");
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ')'), tmp.end());

            std::stringstream s(tmp);

            s >> tmp;

            if (string_to_gate_type(tmp) == OUTPUT)
            {
                s >> tmp;

                c._primary_outputs.push_back(tmp);
            }
        }
        else
        {
            break;
        }
    }

    //Read Gates
    while(getline(_benchmark, tmp))
    {
        if (!tmp.empty())
        {
            my_replace(tmp, "(", " ");

            tmp.erase (std::remove(tmp.begin(), tmp.end(), '='), tmp.end());
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ')'), tmp.end());
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ','), tmp.end());

            std::stringstream s(tmp);

            std::string name, type, fin;

            s >> name;

            s >> type;

            gate_base gate (name, string_to_gate_type(type), c._sorted_circuit, c._gate_lookup);

            while(s >> fin) {
                auto iter = _dff_set.find(fin);

                if (iter != _dff_set.end())
                {
                    fin = fin;

                }

                gate.add_fan_in(fin);
            }

            if (gate.type() == DFF)
            {
                c._dffs.push_back(gate);
                _dff_set.insert(gate.name());

                c._primary_inputs.push_back(gate.name());
                c._primary_outputs.push_back(gate.name() + "_OUT");

                gate_base d (name + "_OUT", DFF, c._sorted_circuit, c._gate_lookup);
                d.add_fan_in(gate.fan_in()[0]);

                _circuit.insert({name + "_OUT", d});

                gate_base d2 (name, INPUT, c._sorted_circuit, c._gate_lookup);

                _circuit.insert({name, d2});

            }
            else
            {
                _circuit.insert({name, gate});
            }
        }
    }

    for(auto iter = _circuit.begin(); iter != _circuit.end(); ++iter)
    {
        std::vector<std::string> fin = iter->second.fan_in();

        for(auto iter2 = fin.begin(); iter2 != fin.end(); ++iter2)
        {
            auto iter3 = _dff_set.find(*iter2);

            if(iter3 != _dff_set.end())
            {
                iter->second.replace_fan_in(*iter2, *iter2);

            }
        }
    }

    for(auto iter = _circuit.begin(); iter != _circuit.end(); ++iter)
    {
        for(auto iter2 = iter->second.fan_in_begin(); iter2 != iter->second.fan_in_end(); ++iter2)
        {
            try{
                _circuit.at(*iter2).add_fan_out(iter->second.name());

            } catch (std::exception e) {
                std::cerr << "ERROR: " << e.what() << std::endl;
                std::cerr << *iter2 << " fan-in of " << iter->second.name() << " was not found in circuit" << std::endl;
            }

        }
    }

    std::unordered_map<std::string, gate_base> map2;

    for(auto iter = _circuit.begin(); iter != _circuit.end(); ++iter)
    {
        if(iter->second.fan_out_count() > 1 && iter->second.type() != STEM)
        {
            int i = 0;
            std::vector<std::string> old = iter->second.fan_out();

            for(auto iter2 = old.begin(); iter2 != old.end(); ++iter2, ++i)
            {
                std::stringstream s;
                s << iter->second.name() << "_" << i;

                gate_base f (s.str(), STEM, c._sorted_circuit, c._gate_lookup);

                f.add_fan_in(iter->second.name());
                f.add_fan_out(*iter2);

                iter->second.replace_fan_out(*iter2, f.name());
                _circuit.at(*iter2).replace_fan_in(iter->second.name(), f.name());

                map2.insert({s.str(), f});
            }
        }
    }

    _circuit.insert(map2.begin(), map2.end());
    //c._circuit = std::move(map2);

    //Calculate actual gate counts
    for(auto iter = _circuit.begin(); iter != _circuit.end(); ++iter)
    {
        GATE_TYPE type = _circuit.at(iter->first).type();
        std::map<GATE_TYPE, int>::iterator lb = c._gate_counts.lower_bound(type);

        if(lb != c._gate_counts.end() && !(c._gate_counts.key_comp()(type, lb->first)))
        {
            c._gate_counts.at(type)++;

        }
        else
        {
            c._gate_counts.insert(lb, std::map<GATE_TYPE, int>::value_type(type, 1));
        }

    }

    for(const auto& x : c._gate_counts)
    {
        c._size+=x.second;
    }
}
