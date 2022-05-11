type Nome = String
type Disciplina = String
type N1 = Float
type N2 = Float
type N3 = Float
type Aluno = (Nome, Disciplina, N1, N2, N3)

aluno :: Int -> Aluno

aluno 1 = ("Bob", "Paradigmas", 8.5, 4.5, 10.0)
aluno 2 = ("Tom", "Sistemas Operacionais", 6.5, 5.5, 8.0)

getNome :: Aluno -> Nome
getNome (n, _, _, _, _) = n

mediaAluno :: Aluno -> Float
mediaAluno (_, _, x, y, z) = (x + y + z) / 3.0

main = do 
     print(aluno 2)
     print(getNome(aluno 1))
     --Construindo uma aluno
     print(getNome ("Bin", "Segurança", 10.0, 9.0, 8.5))
     print(mediaAluno (aluno 1))
