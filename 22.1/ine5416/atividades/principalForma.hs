import ModuloForma (Forma( Circulo ), Forma( Retangulo ), Forma( Triangulo ), Forma( Trapezio ), area, minhaForma)

main = do
    print(area (Circulo 6.42))
    print(area (Retangulo 4 5))
    print(area (Triangulo 4.6 10))
    print(area (Trapezio 4.6 5.8 5))
    print(area minhaForma)
