//
// Created by dolsen on 2/11/16.
//

#include "circuit.hpp"

std::string myreplace(std::string &s,
                      const std::string &toReplace,
                      const std::string &replaceWith)
{
    return(s.replace(s.find(toReplace), toReplace.length(), replaceWith));
}

circuit::circuit(const std::string &benchmark_file)
{
    read_benchmark(benchmark_file);

}

circuit::~circuit()
{

}

void circuit::print_header()
{
    std::cout << "Benchmark: " << _name << std::endl;

    std::cout << "Inputs: " << _input_count << std::endl;
    std::cout << "Outputs: " << _output_count << std::endl;
    std::cout << "DFFs: " << _dff_count << std::endl;
    std::cout << "Inverters: " << _inverter_count << std::endl;
    std::cout << "Gates: " << _total_gate_count << std::endl;

    for(const auto& x : _gate_counts)
    {
        std::cout << gate_type_strings[x.first] << " Gates: " << x.second << std::endl;
    }
}

void circuit::print_circuit()
{
    std::cout << std::endl << "INDEX\tNAME\tTYPE\t#IN\t#OUT\tVAL\tFVAL\tFANIN\t\tFANOUT" << std::endl;

    for(unsigned int i = 0; i < _circuit.size(); ++i)
    {
        //std::cout << "Gate " << i << ": " << std::endl;
        //std::cout << _circuit[i] << std::endl;
        std::cout << i << "\t\t" << _circuit[i] << std::endl;
    }
}

void circuit::read_benchmark(const std::string &benchmark_file)
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

void circuit::read_header(std::ifstream &benchmark)
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

void circuit::read_circuit(std::ifstream &benchmark)
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

            std::cout << tmp << std::endl;
            std::stringstream s(tmp);
            std::cout << s.str() << std::endl;

            std::string name, type, fin;

            s >> name;
            std::cout << name << std::endl;

            s >> type;
            std::cout << type << std::endl;


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
    std::unordered_map<std::string, gate_base> map2 = map;

    for(auto iter = map2.begin(); iter != map2.end(); ++iter)
    {
        if(iter->second.fan_out_count() > 1 && iter->second.type() != FROM)
        {
            int i = 0;
            std::vector<std::string> old = iter->second.fan_out();

            iter->second.fan_out().clear();

            for(auto iter2 = old.begin(); iter2 != old.end(); ++iter2, ++i)
            {
                std::stringstream s;

                s << iter->second.name() << "f" << i;
                from f(s.str());

                f.add_fan_in(iter->second.name());

                f.add_fan_out(*iter2);

                iter->second.add_fan_out(f.name());

                map.insert({s.str(), f});
            }
        }
    }

    for(auto iter = map.begin(); iter != map.end(); ++iter)
    {
        std::cout << iter->second << std::endl;

    }
}
