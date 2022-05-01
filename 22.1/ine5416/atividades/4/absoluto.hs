main = do
    xStr <- getLine
    let x = (read xStr :: Float)
    let res = abso x
    print res

abso x = if x < 0.0 then -x else x