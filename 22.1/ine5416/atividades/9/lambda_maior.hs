bigger :: Int -> Int -> Int -> Int
bigger = (\x y z -> if x > y && x > z then x else if y > x && y > z then y else z)

main = do
    xStr <- getLine
    yStr <- getLine
    zStr <- getLine

    let x = (read xStr :: Int)
    let y = (read yStr :: Int)
    let z = (read zStr :: Int)

    print (bigger x y z)