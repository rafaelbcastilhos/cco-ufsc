from Bots.Bot import Bot
import random as r


class BotAgiota(Bot):
    def __init__(self, nome):
        comandos = {"1": "Dar um conselho",
                    "2": "Quanto eu tô devendo?",
                    "3": "Pagar",
                    "4": "Qual seu nome?"}
        super().__init__(nome, comandos)

    def apresentacao(self):
        return f"Olá, sou {self.nome} e estou aqui para cobrar sua divida com a BU."
    
    def executa_comando(self, cmd):
        try: 
            respostas = {"1": "Pagar a dívida, antes que algo pior aconteça...",
                         "2": f"Você deve exatamente R${r.randint(50000, 100000)}.",
                         "3": f"Muito bom, muito bom, mas aindam faltam os juros de R${r.randint(50000, 100000)}.",
                        "4": f"R${r.randint(50000, 100000)}, esse é meu nome pra você."}
            return respostas[cmd]
        except:
            return "Tá tentando me enrolar? Pague logo!"

    def boas_vindas(self):
        return "Vamos lá, se pagar à vista talvez eu te faça um desconto."

    def despedida(self):
        return f"Ei! Você ainda precisa pagar {r.randint(50000, 100000)}!"