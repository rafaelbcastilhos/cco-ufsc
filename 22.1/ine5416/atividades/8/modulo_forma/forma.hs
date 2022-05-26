module ModuloForma (Forma(Circulo), Forma(Retangulo), Forma(Triangulo), Forma(Trapezio), area, minhaForma) where

data Forma = Circulo Float | Retangulo Float Float | Triangulo Float Float | Trapezio Float Float  Float

area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b a) = b * a
area (Triangulo b h) = (b * h) / 2
area (Trapezio b1 b2 h) = ((b1+b2) * h) / 2

minhaForma :: Forma
minhaForma = (Retangulo 4 6)

