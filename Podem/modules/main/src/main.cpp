
#include "circuit.hpp"

using namespace std;

int main() {
    circuit c("./data/c17.bench");

    c.print_header();

    c.print_circuit();

    return 0;
}