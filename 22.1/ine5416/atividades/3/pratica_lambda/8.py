n = int(input())

fib = lambda i: 1 if i < 2 else fib(i-1) + fib(i-2)

print(fib(n))