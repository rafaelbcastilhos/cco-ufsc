from functools import reduce

a, b, c = map(int, input().split())
values = [a, b, c]

max = reduce(lambda x, y: x if (x > y) else y, values)

print(max)