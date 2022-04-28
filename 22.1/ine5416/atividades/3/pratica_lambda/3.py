a, b, c = map(int, input().split())

x1 = lambda a, b, c: (- b + ((b * b) - (4 * a * c ))** 1/2) / (2 * a)
x2 = lambda a, b, c: (- b - ((b * b) - (4 * a * c ))** 1/2) / (2 * a)

print(x1(a,b,c), x2(a,b,c))