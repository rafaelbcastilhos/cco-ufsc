fibb :: Int -> Int
fibb = fix (\rec n -> if n == 0 then 0 else if n == 1 then 1 else rec (n-1) + rec (n-2))

fix :: (a -> a) -> a
fix f = let {x = f x} in x

main = do
    xStr <- getLine
    let x = (read xStr :: Int)
    print (fibb x)