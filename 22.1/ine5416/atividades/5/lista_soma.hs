soma::[Int] -> Int
soma [] = 0
soma (a:b) = a + soma b

main = do
    let a = 2:4:6:8:[]
    print(soma a)
