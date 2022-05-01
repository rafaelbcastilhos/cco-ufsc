entre :: [Int] -> Int -> Int -> [Int]
entre lista p q = [b | b <- lista, maiorQue b, menorQue b]
    where
        maiorQue x = x > p
        menorQue x = x < q

main = do
    print(entre[1,2,3,4,5,6,7,8,9] 3 7)
