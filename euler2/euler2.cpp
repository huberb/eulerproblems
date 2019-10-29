#include <iostream>

int is_even(int n) {
    return n % 2 == 0;
}

int fib(int n) {
    if(n <= 2) {
        return n;
    } else {
        return fib(n-2) + fib(n - 1);
    }
}

int main() {
    int curr = 0;
    int i = 0;
    int sum = 0;
    while(curr < 4000000) {
        curr = fib(i);
        if(is_even(curr)) {
            sum += curr;
            std::cout << curr << "\n";
        }
        i++;
    }
    std::cout << sum << "\n";
}
