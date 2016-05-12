#include "podem.hpp"

const std::string usage = "Usage: %s BENCHMARK_FILE [ FAULT_FILE ] [ RESULT_FILE ]\n\n";

podem parse_args(int argc, char* const argv[], circuit &c);

int main(int argc, char* const argv[])
{
    if (argc < 2 || argc > 4)
    {
        std::cout << usage << std::endl;

        exit(-1);
    }

    std::chrono::time_point<std::chrono::system_clock> start, end;

    start = std::chrono::system_clock::now();

    circuit c(argv[1]);

    c.print_header();
    //c.print_circuit();

    podem p = parse_args(argc, argv, c);

    p.generate_patterns();

    end = std::chrono::system_clock::now();

    std::chrono::duration<double> elapsed_seconds = end - start;

    std::cout << std::endl << "Elapsed Time: " << elapsed_seconds.count()  << " s" << std::endl;

    return 0;
}

podem parse_args(int argc, char* const argv[], circuit &c)
{
    if(argc == 4)
    {
        return podem(c, argv[2], argv[3]);
    }
    else
    {
        return podem(c);
    }
}