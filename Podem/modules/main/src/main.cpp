#include "circuit.hpp"

const std::string usage = "Usage: %s [ options ] CIRCUIT\n";

int main(int argc, char* const argv[])
{
    if (argc != 2)
    {
        std::cout << usage << std::endl;

        exit(-1);
    }

    circuit c(argv[1]);

    c.print_header();

    c.print_circuit();

    return 0;
}