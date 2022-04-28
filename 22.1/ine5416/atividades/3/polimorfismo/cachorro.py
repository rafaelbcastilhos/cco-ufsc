from animal import Animal

class Cachorro(Animal):
    def __init__(self, peso, altura, raca):
        super.__init__(peso, altura)
        self.raca = raca

    def latir(self):
        print('Cachorro está latindo')

    def correr(self):
        print('Cachorro está correndo')