main = do
    aStr <- getLine
    bStr <- getLine
    cStr <- getLine
    let a = (read aStr :: Float)
    let b = (read bStr :: Float)
    let c = (read cStr :: Float)
    let res = bhask a b c
    print res

delta a b c = (b ^ 2) - 4 * a * c
bhask a b c = ((-b + sqrt(delta a b c))) / (2 * a)