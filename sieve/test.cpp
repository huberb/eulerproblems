#include <iostream>
#include <vector>
#include "sieve.h"

int main() {
    std::vector<int> sieve(100);
    make_sieve(sieve);
    std::cout << sieve[13];
}
