main = do
    baseStr <- getLine
    heightStr <- getLine
    let x = (read baseStr :: Float)
    let y = (read heightStr :: Float)
    let res = trbase x y
    print res

trbase x y = x * y / 2.0