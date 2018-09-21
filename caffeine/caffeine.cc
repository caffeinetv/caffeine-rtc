#include "caffeine.h"

#include <iostream>

extern "C" bool TestStub() {
    std::cerr << "Just a stub. You called it.\n";
    return true;
}
