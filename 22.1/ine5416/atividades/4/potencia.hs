main = do
    xStr <- getLine
    yStr <- getLine
    let x = (read xStr :: Float)
    let y = (read yStr :: Float)
    let res = potencia x y
    print res

potencia x y = x ** y