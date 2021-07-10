from mamifero import Mamifero


class Gato(Mamifero):
    def __init__(self):
        super().__init__(2, 2)

    def miar(self):
        return self.produzirSom()

    def produzirSom(self):
        return f"MAMIFERO: PRODUZ SOM: {self.volume_som} SOM: MIAU"
