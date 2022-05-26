main = do
    let xor = (\x y -> (x && not y) || (not x && y))
    print (xor True False)