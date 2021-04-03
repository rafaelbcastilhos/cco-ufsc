#include <iostream>  // std::cout
#include <cmath>  // sqrt

double square_root(double x){
    auto old = 0.0;
    auto guess = 1.0;

    while (guess != old) {
        old = guess;
        guess = (guess + x / guess) / 2;
    }

    return guess;
}

int main(){
    std::cout << square_root(64) << "\n";
    std::cout << sqrt(64) << "\n";

    return 0;
}
