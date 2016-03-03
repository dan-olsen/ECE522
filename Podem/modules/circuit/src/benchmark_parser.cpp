//
// Created by dolsen on 3/2/16.
//

#include "benchmark_parser.hpp"

std::string myreplace(std::string &s,
                      const std::string &toReplace,
                      const std::string &replaceWith)
{
    return(s.replace(s.find(toReplace), toReplace.length(), replaceWith));
}

benchmark_parser::benchmark_parser(const std::string &benchmark_file)
{
    read_benchmark(benchmark_file);

}

benchmark_parser::~benchmark_parser()
{

}

void benchmark_parser::read_benchmark(const std::string &benchmark_file)
{
    try {
        std::ifstream benchmark(benchmark_file);

        if(benchmark.good())
        {
            std::cout << "Reading benchmark..." << std::endl;

            read_header(benchmark);

            read_circuit(benchmark);

            benchmark.close();
        }
        else
        {
            std::cerr << "ERROR: Cannot open " << benchmark_file << std::endl;
        }

    } catch(std::exception e) {
        std::cerr << "ERROR: " << e.what() << std::endl;

    }
}

void benchmark_parser::read_header(std::ifstream &benchmark)
{
    std::string tmp;

    benchmark >> tmp >> _name;
    benchmark >> tmp >> _input_count >> tmp;

    if (_name.front() == 'b')
    {
        benchmark.ignore();
        getline(benchmark, tmp);

    }

    benchmark >> tmp >> _output_count >> tmp;

    if (_name.front() == 'b' || _name.front() == 's')
    {
        benchmark >> tmp >> _dff_count >> tmp >> tmp;

    }
    else
    {
        _dff_count = 0;
    }

    benchmark >> tmp >> _inverter_count >> tmp;
    benchmark >> tmp >> _total_gate_count >> tmp;

    getline(benchmark, tmp);

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

void benchmark_parser::read_circuit(std::ifstream &benchmark)
{
    std::string tmp;

    std::unordered_map<std::string, gate_base> map;

    benchmark.ignore();

    //Read inputs
    while(getline(benchmark, tmp))
    {
        if (!tmp.empty())
        {
            myreplace(tmp, "(", " ");
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ')'), tmp.end());

            std::stringstream s(tmp);

            s >> tmp;

            if (string_to_gate_type(tmp) == INPUT)
            {
                s >> tmp;
                input in(tmp);

                map.insert({tmp, in});

                //_circuit.push_back(in);
            }
        }
        else
        {
            break;
        }
    }

    //Read outputs
    while(getline(benchmark, tmp))
    {
        if (!tmp.empty())
        {
/*            myreplace(tmp, "(", " ");
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ')'), tmp.end());

            std::stringstream s(tmp);

            s >> tmp;

            if (string_to_gate_type(tmp) == OUTPUT)
            {
                s >> tmp;
                output out(tmp);

                //map.insert({tmp.substr(6), out});

                _circuit.push_back(out);
            }*/
        }
        else
        {
            break;
        }
    }

    //Read Gates
    while(getline(benchmark, tmp))
    {
        if (!tmp.empty())
        {
            myreplace(tmp, "(", " ");

            tmp.erase (std::remove(tmp.begin(), tmp.end(), '='), tmp.end());
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ')'), tmp.end());
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ','), tmp.end());

            std::stringstream s(tmp);

            std::string name, type, fin;

            s >> name;

            s >> type;

            not_gate notg(name);
            buffer buff(name);
            and_gate andg(name);
            nand_gate nandg(name);
            or_gate org(name);
            nor_gate norg(name);
            dff dffg(name);

            switch(string_to_gate_type(type))
            {

                case NOT:
                    while(s >> fin)
                    {
                        notg.add_fan_in(fin);

                        map.at(fin).add_fan_out(name);
                    }

                    map.insert({name, notg});
                    break;
                case BUFFER:
                    while(s >> fin)
                    {
                        buff.add_fan_in(fin);

                        map.at(fin).add_fan_out(name);
                    }

                    map.insert({name, buff});
                    break;
                case AND:
                    while(s >> fin)
                    {
                        andg.add_fan_in(fin);

                        map.at(fin).add_fan_out(name);
                    }

                    map.insert({name, andg});
                    break;
                case NAND:
                    while(s >> fin)
                    {
                        nandg.add_fan_in(fin);

                        map.at(fin).add_fan_out(name);
                    }

                    map.insert({name, nandg});
                    break;
                case OR:
                    while(s >> fin)
                    {
                        org.add_fan_in(fin);

                        map.at(fin).add_fan_out(name);
                    }

                    map.insert({name, org});
                    break;
                case NOR:
                    while(s >> fin)
                    {
                        norg.add_fan_in(fin);

                        map.at(fin).add_fan_out(name);
                    }

                    map.insert({name, norg});
                    break;
                case DFF:
                    while(s >> fin)
                    {
                        dffg.add_fan_in(fin);

                        map.at(fin).add_fan_out(name);
                    }

                    map.insert({name, dffg});
                    break;
                case FROM:
                case INPUT:
                case OUTPUT:
                case UNKNOWN:
                default:
                    std::cerr << "ERROR: Invalid gate type" << std::endl;
                    exit(-1);
            }


            //_circuit.push_back(ng);
        }
    }
    std::unordered_map<std::string, gate_base> map2;// = map;

    for(auto iter = map.begin(); iter != map.end(); ++iter)
    {
        if(iter->second.fan_out_count() > 1 && iter->second.type() != FROM)
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
                map.at(*iter2).replace_fan_in(iter->second.name(), f.name());

                map2.insert({s.str(), f});
            }
        }
    }

    map.insert(map2.begin(), map2.end());

    for(auto iter = map.begin(); iter != map.end(); ++iter)
    {
        std::cout << iter->second << std::endl;

    }
}