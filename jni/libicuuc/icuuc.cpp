#include <iostream>
#include <cstdlib>
#include <string>

#include "ops.h"
#include "options.h"

int main(int argc, char **argv)
{
    std::string buffer;
    Ops ops;
    Options options(argc, argv);
    Ops::Action action = options.getAction();

    while (std::getline(std::cin, buffer)) {
        std::cout << (ops.*action)(buffer) << std::endl;
    }

    return EXIT_SUCCESS;
}
