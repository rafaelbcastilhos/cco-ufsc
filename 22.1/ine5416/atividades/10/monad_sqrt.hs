data Expr = Val Float | Div Expr Expr | Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Sqrt Expr

mydiv :: Float -> Float -> Maybe Float
mydiv n m | m == 0 = Nothing
                    | otherwise = Just (n / m)

mymult :: Float -> Float -> Maybe Float
mymult n m = Just (n * m)

mysub :: Float -> Float -> Maybe Float
mysub n m = Just (n - m)

myadd :: Float -> Float -> Maybe Float
myadd n m = Just (n + m)

mysqrt :: Float -> Maybe Float
mysqrt a    | a < 0 = Nothing
            | otherwise = Just (sqrt a)

eval :: Expr -> Maybe Float
eval (Val n) = Just n
eval (Sqrt x) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> (mysqrt n)
eval (Div x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                        Nothing -> Nothing
                        Just m -> (mydiv n m)
eval (Mul x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                        Nothing -> Nothing
                        Just m -> (mymult n m)
eval (Add x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                        Nothing -> Nothing
                        Just m -> (myadd n m)
eval (Sub x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                        Nothing -> Nothing
                        Just m -> (mysub n m)

evalmonad :: Expr -> Maybe Float
evalmonad (Val n) = return n
evalmonad (Sqrt x) = evalmonad x >>=
                    (\a -> (mysqrt a))
evalmonad (Div x y) = evalmonad x >>=
                    (\n -> evalmonad y >>=
                        \m -> (mydiv n m))
evalmonad (Add x y) = evalmonad x >>=
                    (\n -> evalmonad y >>=
                        \m -> (myadd n m))
evalmonad (Sub x y) = evalmonad x >>=
                    (\n -> evalmonad y >>=
                        \m -> (mysub n m))
evalmonad (Mul x y) = evalmonad x >>=
                    (\n -> evalmonad y >>=
                        \m -> (mymult n m))

evalfinal :: Expr -> Maybe Float
evalfinal (Val n) = return n
evalfinal (Sqrt x) = do
                    n <- evalfinal x
                    mysqrt n
evalfinal (Div x y) = do
                    n <- evalfinal x
                    m <- evalfinal y
                    mydiv n m

evalfinal (Add x y) = do
                    n <- evalfinal x
                    m <- evalfinal y
                    myadd n m

evalfinal (Sub x y) = do
                    n <- evalfinal x
                    m <- evalfinal y
                    mysub n m

evalfinal (Mul x y) = do
                    n <- evalfinal x
                    m <- evalfinal y
                    mymult n m

main = do
    -- sqrt(3-4) = sqrt(-1) = erro -> Nothing
    print (mysqrt (-1))
    print (eval (Sqrt(Sub (Val 3) (Val 4))))
    print (evalmonad (Sqrt(Sub (Val 3) (Val 4))))
    print (evalfinal (Sqrt(Sub (Val 3) (Val 4))))

    --sqrt((3*8)+1) = sqrt(25) = 5
    print (mysqrt 25)
    print (eval (Sqrt (Add (Mul (Val 3) (Val 8)) (Val 1))))
    print (evalmonad (Sqrt (Add (Mul (Val 3) (Val 8)) (Val 1))))
    print (evalfinal (Sqrt (Add (Mul (Val 3) (Val 8)) (Val 1))))

    -- sqrt(0) = 0
    print (mysqrt 0)
    print (eval (Sqrt (Val 0)))
    print (evalmonad (Sqrt (Val 0)))
    print (evalfinal (Sqrt (Val 0)))