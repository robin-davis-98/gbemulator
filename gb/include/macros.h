#pragma once
#include <cstdlib>
#include <iostream>

#define NO_IMPL(op) do { \
    std::cerr << "Opcode not implemented: 0x" \
    << std::hex << int(op) \
    << " at " << __FILE__ << ":" << __LINE__ << std::endl; \
    std::abort(); \
}while(0)