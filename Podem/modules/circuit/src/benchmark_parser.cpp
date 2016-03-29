//
// Created by dolsen on 3/2/16.
//

#include "benchmark_parser.hpp"

benchmark_parser::benchmark_parser(const std::string &benchmark_file)
{
    _benchmark_file = benchmark_file;
}

benchmark_parser::~benchmark_parser()
{
    if(_benchmark.is_open())
    {
        _benchmark.close();
    }
}

void benchmark_parser::read_benchmark(circuit &c)
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
}

std::string benchmark_parser::my_replace(std::string &s, const std::string &toReplace, const std::string &replaceWith)
{
    return(s.replace(s.find(toReplace), toReplace.length(), replaceWith));
}

void benchmark_parser::read_header(circuit &c)
{
    std::string tmp;

    _benchmark >> tmp >> c._name;
    _benchmark >> tmp >> c._input_count >> tmp;

    _benchmark >> tmp >> c._output_count >> tmp;

    if (c._name.front() == 'b' || c._name.front() == 's')
    {
        _benchmark >> tmp >> c._dff_count >> tmp >> tmp;

    }
    else
    {
        c._dff_count = 0;
    }

    _benchmark >> tmp >> c._inverter_count >> tmp;
    _benchmark >> tmp >> c._total_gate_count >> tmp;

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
            c._gate_counts[string_to_gate_type(tmp)] = x;

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
                input in(tmp);

                c._circuit.insert({tmp, in});
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
        if (tmp.empty())
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

            std::unique_ptr<gate_base> gate = gate_factory::create_gate(type, name);

            while(s >> fin)
            {
                for(auto iter = c._dff.begin(); iter != c._dff.end(); ++iter)
                {
                    if(iter->name() == fin)
                    {
                        fin = fin + "_IN";

                        iter->add_fan_out(gate->name());

                        break;
                    }
                }

                gate->add_fan_in(fin);
            }

            if (gate->type() == DFF)
            {
                c._dff.push_back(*gate);

                c._primary_inputs.push_back(gate->name() + "_IN");

                dff d(name + "_OUT");
                d.add_fan_in(gate->fan_in()[0]);

                c._circuit.insert({name + "_OUT", d});

                dff d2(name + "_IN");

                c._circuit.insert({name + "_IN", d2});

            }
            else
            {
                c._circuit.insert({name, *gate});
            }
        }
    }
    for(auto iter = c._circuit.begin(); iter != c._circuit.end(); ++iter)
    {
        std::vector<std::string> fin = iter->second.fan_in();

        for(auto iter2 = fin.begin(); iter2 != fin.end(); ++iter2)
        {
            for(auto iter3 = c._dff.begin(); iter3 != c._dff.end(); ++iter3)
            {
                if(*iter2 == iter3->name())
                {
                    iter->second.replace_fan_in(*iter2, *iter2 + "_IN");

                    break;
                }
            }
        }

    }

    for(auto iter = c._circuit.begin(); iter != c._circuit.end(); ++iter)
    {
        for(auto iter2 = iter->second.fan_in().begin(); iter2 != iter->second.fan_in().end(); ++iter2)
        {
            try{
                c._circuit.at(*iter2).add_fan_out(iter->second.name());

            } catch (std::exception e) {
                std::cerr << "ERROR: " << e.what() << std::endl;
                std::cerr << *iter2 << " fan-in of " << iter->second.name() << " was not found in circuit" << std::endl;
            }

        }
    }

    std::unordered_map<std::string, gate_base> map2;

    for(auto iter = c._circuit.begin(); iter != c._circuit.end(); ++iter)
    {
        if(iter->second.fan_out_count() > 1 && iter->second.type() != STEM)
        {
            int i = 0;
            std::vector<std::string> old = iter->second.fan_out();

            for(auto iter2 = old.begin(); iter2 != old.end(); ++iter2, ++i)
            {
                std::stringstream s;
                s << iter->second.name() << "f" << i;

                from f(s.str());

                f.add_fan_in(iter->second.name());
                f.add_fan_out(*iter2);

                iter->second.replace_fan_out(*iter2, f.name());
                c._circuit.at(*iter2).replace_fan_in(iter->second.name(), f.name());

                map2.insert({s.str(), f});
            }
        }
    }

    c._circuit.insert(map2.begin(), map2.end());

}