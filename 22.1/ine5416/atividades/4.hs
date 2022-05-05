data Arvore = Null | No Int Arvore Arvore

minhaArvore :: Arvore
minhaArvore = No 52 (No 32 (No 12 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 32 Null Null))

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

buscaElemento :: Arvore -> Int -> Bool
buscaElemento Null _ = False
buscaElemento (No n esq dir) x 
    | (n == x) = True                           
    | otherwise = (buscaElemento esq x) || (buscaElemento dir x)

limiteSup :: Int
limiteSup = 1000 --Define um limite superior para o maior número

minimo :: Int -> Int -> Int
minimo x y | (x < y) = x
           | otherwise = y

minimoElemento :: Arvore -> Int
minimoElemento Null = limiteSup 
minimoElemento (No n esq dir) = 
    minimo n (minimo (minimoElemento esq) (minimoElemento dir))

ocorrencias :: Arvore -> Int -> Int
ocorrencias Null _ = 0
ocorrencias (No n esq dir) x 
     | n == x = 1 + (ocorrencias esq x) + (ocorrencias dir x)
     | otherwise = 0 + (ocorrencias esq x) + (ocorrencias dir x)                               

maioresQueElemento :: Arvore -> Int -> Int
maioresQueElemento Null _ = 0
maioresQueElemento (No n esq dir) x
     | n > x = 1 + (maioresQueElemento esq x) + (maioresQueElemento dir x)
     | otherwise = 0 + (maioresQueElemento esq x) + (maioresQueElemento dir x)

quantidade:: Arvore -> Int
quantidade Null = 0
quantidade(No n esq dir) = 1 + (quantidade esq) + (quantidade dir)

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

mediaElementos :: Int ->  Int-> Float
mediaElementos 0 _ = 0
mediaElementos a b = a / b


main = do 
     print(somaElementos minhaArvore)
     print(buscaElemento minhaArvore 30)
     print(buscaElemento minhaArvore 55)
     print(minimoElemento minhaArvore)
     print(ocorrencias minhaArvore 32)
     print(maioresQueElemento minhaArvore 12)
     print(quantidade minhaArvore)
     print(mediaElementos (somaElementos minhaArvore) quantidade minhaArvore)

