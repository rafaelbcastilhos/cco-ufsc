class (Integral x) => MeuInt x where
     bigger :: x -> x -> x
     smaller :: x -> x -> x

     bigger a b | a > b = a
                | otherwise = b

     smaller a b | a == (bigger a b) = b
                 | otherwise = a

     par :: x -> Bool
     par 0 = True
     par a = a `mod` 2 == 0

     impar :: x -> Bool
     impar 0 = False
     impar a = a `mod` 1 == 0

     primo :: x -> Bool
     primo 0 = False
     primo a = null [k | k <- [2 .. floor(sqrt(fromIntegral a))], a `mod` k == 0]

     mdc :: x -> x -> x
     mdc 0 _ = 0
     mdc a b = 
instance MeuInt Integer
instance MeuInt Int

main = do
     print (bigger (4::Integer) (12::Integer))
     print (smaller (4::Integer) (12::Integer))
     print (par (2::Integer))
     print (impar(3::Integer))
     print(primo (3::Integer))
     print(primo(40::Integer))
     print(primo(127::Integer))
