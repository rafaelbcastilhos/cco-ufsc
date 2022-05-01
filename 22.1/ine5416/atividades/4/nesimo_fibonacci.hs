main = do
    xStr <- getLine
    let n = (read xStr :: Float)
    let res = fib n
    print res

fib n = if n == 0 then 0 else if n == 1 then 1 else fib (n - 1) + fib (n - 2)