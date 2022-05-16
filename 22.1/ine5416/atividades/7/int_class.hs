class (Integral x) => MeuInt x where

    bigger :: x -> x -> x
    smaller :: x -> x -> x
    par :: x -> Bool
    impar :: x -> Bool
    primo :: x -> Bool
    mdc :: x -> x -> x
    (===) :: x -> x -> Bool
    potencia :: x -> x -> x
    (+++) :: x -> x -> x

    bigger a b | a > b = a
            | otherwise = b

    smaller a b | a == (bigger a b) = b
                | otherwise = a

    par a | a `mod` 2 == 0 = True
              | otherwise = False

    impar a | (par a) == True = False
             | otherwise = True

    primo a = if a > 1 then null [ x | x <- [2 .. a - 1], a `mod` x == 0] else False

    mdc a b | mod a b == 0 = b
            | mod b a == 0 = a
            | a > b = mdc b (mod a b)
            | a < b = mdc a (mod b a)

    a === b | abs (a - b) <= 1 = True
            | otherwise = False

    potencia a b = a^b

    a +++ b = a + b + (2* a * b)

instance MeuInt Integer
instance MeuInt Int

main = do
    print (bigger (4::Integer) (12::Integer))
    print (smaller (4::Integer) (12::Integer))
    print (par (120::Integer))
    print (impar (120:: Integer))
    print (mdc (2:: Integer) (10:: Integer))
    print (primo (10:: Integer))
    print (primo (7:: Integer))
    print ((3:: Integer) === (4:: Integer))
    print (potencia (2:: Integer) (3:: Integer))
    print ((2:: Integer) +++ (3:: Integer))
