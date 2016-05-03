#include "podem.hpp"

#include <chrono>

const std::string usage = "Usage: %s BENCHMARK_FILE [ FAULT_FILE ]\n\n";

int main(int argc, char* const argv[])
{
    if (argc < 2)
    {
        std::cout << usage << std::endl;

        exit(-1);
    }

    std::chrono::time_point<std::chrono::system_clock> start, end;

    start = std::chrono::system_clock::now();

    circuit c(argv[1]);

    c.print_header();
    c.print_circuit();

    podem p(c);

    if(argc == 3)
    {
        p.generate_patterns(argv[2]);

    }
    else
    {
        p.generate_patterns();

    }

    end = std::chrono::system_clock::now();

    std::chrono::duration<double> elapsed_seconds = end - start;

    std::cout << std::endl << "Elapsed Time: " << elapsed_seconds.count() << std::endl;

    return 0;
}