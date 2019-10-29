#include <iostream>
#include <string>

int is_palindrome(int n) {
    std::string new_string;
    std::string old_string = std::to_string(n);

    for(int i = old_string.size() - 1; i >= 0; i--) {
        new_string += old_string[i];
    }
    return old_string == new_string;
}

int main() {
    int tmp;
    int max = 0;
    for(int i = 1; i < 1000; i++) {
        for(int j = 1; j < 1000; j++) {
            tmp = i * j;
            if(is_palindrome(tmp) && tmp > max) {
                max = tmp;
            }
        }
    }
    std::cout << max << "\n";
}
