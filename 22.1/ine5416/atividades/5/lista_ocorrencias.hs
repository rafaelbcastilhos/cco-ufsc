ocorrencias::[Int] -> Int -> Int
ocorrencias [] a = 0
ocorrencias [a] x | a == x = 1
                | otherwise = 0
ocorrencias (a:b) x | a == x = 1 + ocorrencias b x
                        | otherwise = 0 + ocorrencias b x

main = do
    let a = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5]
    print(ocorrencias a 1)
    print(ocorrencias a 2)
    print(ocorrencias a 3)
    print(ocorrencias a 4)
    print(ocorrencias a 5)