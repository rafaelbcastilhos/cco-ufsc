# map, para aplicar uma função a cada item em um iterável (como uma lista ou um dicionário) 
# e retornar um novo iterador para recuperar os resultados. 
# map() retorna um objeto map (um iterador), que podemos usar em outras partes do nosso programa. 
# Também podemos passar o objeto map à função list(), ou outro tipo de sequência, para criar um iterável.

numbers = [10, 15, 21, 33, 42, 55]
mapped_numbers = list(map(lambda x: x * 2 + 3, numbers))
print(mapped_numbers)
