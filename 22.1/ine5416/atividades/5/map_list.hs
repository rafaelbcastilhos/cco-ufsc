mapear::(t -> y) -> [t] -> [y]
mapear f a = [f x | x <- a]

dobro::Int -> Int
dobro x = x * 2

main = do
    let list = 2:4:6:8:[]
    print(mapear dobro list)