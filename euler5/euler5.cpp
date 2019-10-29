#include <iostream>

bool is_divisible(int n) {
    for(int i = 2; i < 20; i++) {
        if(n % i) return false;
    }
    return true;
}

int main() {
    int i = 2520;
    while(true) {
        if(is_divisible(i)) {
            std::cout << i << "\n";
            return 0;
        }
        i++;
    }
}
