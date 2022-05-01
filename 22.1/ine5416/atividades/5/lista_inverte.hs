inverte:: [t] -> [t] 
inverte [] = []
inverte[a] = [a]
inverte (a:b) = (inverte b) ++ [a]

main = do
    let a = [1,2,3,4,5]
    print(inverte a)