a, b, c = map(int, input().split())

media = lambda a, b, c: "aprovado" if (a + b + c)/3 >= 6 else "reprovado"

print(media(a, b, c))