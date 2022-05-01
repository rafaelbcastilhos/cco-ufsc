main = do
    xStr <- getLine
    yStr <- getLine
    let x = (read xStr :: Int)
    let y = (read yStr :: Int)
    let res = divv x y
    print res

divv x y = if x `mod` y == 0 then True else False