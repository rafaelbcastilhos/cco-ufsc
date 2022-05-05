data Forma = Circulo Float | Retangulo Float Float | Triangulo Float Float
data Ponto = D2 Float Float | D3 Float Float Float

area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b a) = b * a
area (Triangulo b h) = (b * h) / 2

distancia :: Ponto -> Ponto -> Float
distancia (D2 xa xb) (D2 ya yb) = sqrt((xb-xa)**2 + (yb-ya)**2)

minhaForma :: Forma
minhaForma = (Retangulo 4 6)

main = do
    print(area (Circulo 6.42))
    print(area (Retangulo 4 5))
    print(area (Triangulo 4.6 10))
    print(area minhaForma)

    print(distancia (D2 5 6) (D2 7 8))
