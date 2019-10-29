#include <vector>

void make_sieve(std::vector<int> &sieve) {
    int tmp;
    sieve[1] = 1;
    sieve[2] = 1;
    for(int i = 3; i < sieve.size(); i++) {
        sieve[i] = 1;
    }
    for(int i = 2; i < sieve.size(); i++) {
        tmp = i;
        for(int j = i * 2; j < sieve.size(); j += tmp) {
            sieve[j] = 0;
        }
    }
}
