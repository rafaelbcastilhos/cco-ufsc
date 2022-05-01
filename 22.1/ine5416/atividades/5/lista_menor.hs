encontra_menor::Int->Int->Int
encontra_menor a b
    | a > b = b
    | a < b = a
    | a == b = a

menor::[Int]->Int
menor [] = 0
menor [a] = a
menor (a:b) = encontra_menor a (menor b)

main = do
    let a = -1:2:4:6:[]
    print(menor a)
