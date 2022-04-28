encontra_menor::Int->Int->Int
encontra_menor a b
    | a > b = b
    | a < b = a
    | a == b = a

menor::[Int]->Int
menor [] = 0
menor [a] = a
menor (a:b) = encontra_menor a (menor b)

encontra_maior::Int->Int->Int
encontra_maior a b
    | a > b = a
    | b > a = b
    | a == b = a

maior::[Int]->Int
maior [] = 0
maior [a] = a
maior (a:b) = encontra_maior a (maior b) 

main = do
    let a = 1:2:4:6:[]
    print((maior a) - (menor a))
