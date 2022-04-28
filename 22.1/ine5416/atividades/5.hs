busca::[Int] -> Int -> Bool
busca [] _ = False
busca (a:b) x
    | a == x = True
    | otherwise = busca b x

main = do
    let a = 2:4:6:8:[]
    print(busca a 2)
