from math import sqrt
from functools import reduce

x1, x2, x3 = map(int, input().split())

y1, y2, y3 = map(int, input().split())

p1 = [x1, x2, x3]
p2 = [y1, y2, y3]

distance = sqrt(reduce(lambda x, y: (x + y), (list(map(lambda a, b: (b - a)**2, p1, p2)))))
print(distance)