type Nome = String
type Idade = Int
type Linguagem = String
type Pessoa = (Nome, Idade, Linguagem)

pessoa :: Int -> Pessoa
pessoa 1 = ("Bob", 25, "Haskell")
pessoa 2 = ("Tom", 22, "LISP")

getNome :: Pessoa -> Nome
getNome (n, _, _) = n

main = do 
     print(pessoa 2)
     print(getNome(pessoa 1))
     --Construindo uma pessoa
     print(getNome ("Bin", 26, "Scheme"))
