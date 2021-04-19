#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include "vector.h"


void print_vector(const math::Vector2D &v){
    std::cout << '{' << v.x() << ", " << v.y() << "}\n";
}


int main(){
    using math::Vector2D;

    auto v = Vector2D{3, 5};

    print_vector(v);

    v.sum({7, 8});

    print_vector(v);

    auto iv = inverted(v);

    print_vector(v);
    print_vector(iv);

    v.invert();

    print_vector(v);

    v.multiply(0.5);

    print_vector(v);

    auto w = sum(v, {7, 8});

    print_vector(v);
    print_vector(w);

    auto u = multiply(v, 0.5);

    print_vector(v);
    print_vector(u);


    const auto &v2 = v;
}