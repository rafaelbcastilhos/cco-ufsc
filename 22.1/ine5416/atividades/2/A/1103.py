while True:
    data = input().split()
    h1 = int(data[0])
    m1 = int(data[1])
    h2 = int(data[2])
    m2 = int(data[3])
    if h1 + h2 + m1 + m2 == 0:
        break
    minutos_atuais = (h1 * 60) + m1
    minutos_finais = (h2 * 60) + m2
    if minutos_atuais < minutos_finais:
        print(abs(minutos_atuais - minutos_finais))
    else:
        print(abs(minutos_atuais - minutos_finais - 1440))