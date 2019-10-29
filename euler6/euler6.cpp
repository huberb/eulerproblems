#include <iostream>

int main() {
    int max = 100;
    int sum = 0;
    int sum2 = 0;
    for(int i = 1; i <= max; i++) {
        sum += i * i;
    }
    for(int i = 1; i <= max; i++) {
        sum2 += i;
    }
    sum2 *= sum2;
    std::cout << sum2 - sum << "\n";
}
