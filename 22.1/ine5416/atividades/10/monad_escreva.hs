escreva :: String -> Int -> IO ()
escreva (a:b) 1 = putChar a
escreva (a:b) n = putChar a >>=
                    (\c -> escreva b (n-1))

escrevaDo :: String -> Int -> IO ()
escrevaDo (a:b) 1 = putChar a
escrevaDo (a:b) n = do
    putChar a
    escrevaDo b (n-1)

main = do
    escreva "palavra" 5
    print()
    print()
    escrevaDo "palavra" 5