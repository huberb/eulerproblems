#include "../sieve/sieve.h"
#include <vector>
#include <iostream>

std::vector<int> sieve;

int main() {
    long n = 600851475143;
    std::cout << "resize" << "\n";
    sieve.resize(n / 10000);
    std::cout << "making sieve.." << "\n";
    make_sieve(sieve);
    std::cout << "done.. searching prime\n";

    for(int i = sieve.size(); i > 2; i--) {
        if(sieve[i] && n % i == 0) {
            std::cout << i << "\n";
        }
    }
}
