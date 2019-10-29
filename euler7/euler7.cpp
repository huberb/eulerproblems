#include <iostream>
#include "../sieve/sieve.h"

int main() {
    std::vector<int> sieve(1000000);
    make_sieve(sieve);
    int count = 0;

    for(int i = 2; i < sieve.size(); i++) {
        if(sieve[i]) count++;
        if(count == 10001) { 
            std::cout << i << "\n";
            return 0;
        }
    }
}
