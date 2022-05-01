isPrime:: Int -> Bool
isPrime x =
    null [k | k <- [2 .. floor(sqrt(fromIntegral x))], x `mod` k == 0]

main = do
    xStr <- getLine
    let x = read xStr :: Int
    print(isPrime x)