import Data.Either

divideValues :: Float -> Float -> Either String Float
divideValues _ 0 = Left "Divisao por zero!"
divideValues a b = Right (a/b)

main = do
    print (divideValues 10 5)
    print (divideValues 10 0)