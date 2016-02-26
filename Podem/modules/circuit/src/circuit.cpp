//
// Created by dolsen on 2/11/16.
//

#include "circuit.hpp"

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
    std::cout << std::endl << "ID\tNAME\tTYPE\tIN#\t\tOUT#\tVAL\t\tFVAL\tFANIN\t\tFANOUT" << std::endl;

    for(unsigned int i = 0; i < _circuit.size(); ++i)
    {
        std::cout << i << "\t" << _circuit[i].name() << "\t" <<gate_type_strings[_circuit[i].type()] << std::endl;
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
            tmp.erase (std::remove(tmp.begin(), tmp.end(), '('), tmp.end());
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ')'), tmp.end());

            input in(tmp.substr(5));

            map.insert({tmp.substr(5), in});

            //_circuit.push_back(in);
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
            tmp.erase (std::remove(tmp.begin(), tmp.end(), '('), tmp.end());
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ')'), tmp.end());

            std::cout << tmp << std::endl;

            std::cout << tmp.substr(6) << std::endl;

            output out(tmp.substr(6));

            map.insert({tmp.substr(6), out});

            //_circuit.push_back(out);
        }
        else
        {
            break;
        }
    }

    while(getline(benchmark, tmp))
    {
        if (!tmp.empty())
        {
            tmp.erase (std::remove(tmp.begin(), tmp.end(), '='), tmp.end());
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ')'), tmp.end());
            tmp.erase (std::remove(tmp.begin(), tmp.end(), ','), tmp.end());

            std::cout << tmp << std::endl;

            std::cout << tmp.substr(6) << std::endl;

            output out(tmp.substr(6));

            //map.insert({tmp.substr(6), out});

            //_circuit.push_back(out);
        }
        else
        {
            break;
        }
    }
}
std::string myreplace(std::string &s,
                      const std::string &toReplace,
                      const std::string &replaceWith)
{
    return(s.replace(s.find(toReplace), toReplace.length(), replaceWith));
}