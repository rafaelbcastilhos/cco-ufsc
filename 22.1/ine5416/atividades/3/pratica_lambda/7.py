# filter pode ser usada para criar um novo iterador a partir de um iterável existente (como uma list a ou um dicionário) 
# que irá filtrar de forma eficiente os elementos usando uma função que fornecemos. Um iterável é um objeto do Python que pode “sofrer iteração”, 
# ou seja, ele retornará itens em uma sequência para que possamos usá-la em um loop for.

creature_names = ['Sammy', 'Ashley', 'Jo', 'Olly', 'Jackie', 'Charlie']
print(list(filter(lambda x: x[0].lower() in 'aeiou', creature_names)))
