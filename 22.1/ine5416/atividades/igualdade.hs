igual :: [Int] -> [Int] -> Bool
igual [] [] = True
igual [] _ = False
igual _ [] = False
igual (a:b) (c:d) | (a == c) = igual b d
                  | otherwise = False

main = do
    let a = 2:4:6:8:[]:10:12:14:[]
    let b = 2:4:6:8:[ ]
    putStrLn (show a)
