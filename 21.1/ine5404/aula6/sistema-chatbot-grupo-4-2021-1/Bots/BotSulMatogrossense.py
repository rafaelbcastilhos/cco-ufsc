from Bots.Bot import Bot

# bot adquirido do grupo 6
class BotSulMatogrossense(Bot):

    __com = {0: "Aôba!",
             1: "Qual é seu nome?",
             2: "Quero um téras",
             3: "Qual seu animal de estimação?",
             4: "Você mora na aldeia?",
             5: "Como é aí no Mato Grosso?"}

    def __init__(self, nome):
        super().__init__(nome, self.__com)  

    def apresentacao(self):
        return "TaRrde! Eu sou o(a) {} e vim do interioRr".format(self.nome)
    
    def executa_comando(self, cmd):
        cmd = int(cmd)
        if cmd == 0: 
            return "Aôooba! :)"
        elif cmd == 1: 
            return f"meu nome é {self.nome}, muito prazeRr!"
        elif cmd == 2: 
            return "Cê tá louco, tá frio!"
        elif cmd == 3: 
            return "Uma capivara."
        elif cmd == 4: 
            return "..."
        elif cmd == 5: 
            return "DO SUL."

    def boas_vindas(self):
        return "Seja bem vindo ao meu país MS"

    def despedida(self):
        return "Falô"