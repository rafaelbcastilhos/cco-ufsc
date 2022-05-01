main = do
    xStr <- getLine
    yStr <- getLine
    zStr <- getLine
    let x = (read xStr :: Float)
    let y = (read yStr :: Float)
    let z = (read yStr :: Float)
    let res = grade x y z
    print res

grade x y z = if ((x + y + z) / 3.0) > 6 then True else False