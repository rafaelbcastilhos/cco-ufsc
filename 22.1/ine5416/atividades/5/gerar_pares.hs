gerarPares::[t]->[u] -> [(t,u)]
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2]

main = do
    print(gerarPares [1,2,3] [4,5,6])
