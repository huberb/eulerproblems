#include <iostream>

int is_multiple(int n) {
    return n % 5 == 0 || n % 3 == 0;
}

int main() {
    int sum = 0;
    for(int i = 0; i < 1000; i++) {
        if(is_multiple(i)) {
            sum += i;
        }
    }
    std::cout << sum << "\n";
}
