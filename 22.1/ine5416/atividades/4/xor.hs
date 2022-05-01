main = do
    xStr <- getLine
    yStr <- getLine
    let x = (read xStr :: Bool)
    let y = (read yStr :: Bool)

    let res = xor x y
    print res

xor :: Bool -> Bool -> Bool
xor x y = (x && not y) || (not x && y)