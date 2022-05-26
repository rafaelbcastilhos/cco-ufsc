main = do
    xStr <- getLine
    yStr <- getLine
    zStr <- getLine
    let x = (read xStr :: Float)
    let y = (read yStr :: Float)
    let z = (read zStr :: Float)

    let approved = (\x y z -> if ((x + y + z) / fromIntegral 3) >= 6.0 then True else False)
    print (approved x y z)