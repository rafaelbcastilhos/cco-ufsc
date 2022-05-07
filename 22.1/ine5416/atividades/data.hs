data Forma = Circulo Float | Retangulo Float Float
area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b a) = b * a

minhaForma :: Forma
minhaForma = (Retangulo 4 6)

main = do 
    print(area (Circulo 6.42))
    print(area (Retangulo 4 5))
    print(area minhaForma)
