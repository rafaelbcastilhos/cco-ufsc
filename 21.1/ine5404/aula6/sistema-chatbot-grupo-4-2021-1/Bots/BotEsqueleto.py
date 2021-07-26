  
from Bots.Bot import Bot

# bot adquirido do grupo 6
class BotEsqueleto(Bot):
    __com = {0: "Bom dia",
             1: "Qual é seu nome?",
             2: "Quero um conselho",
             3: "Adeus"}
    
    def __init__(self, nome):
        super().__init__(nome, self.__com)

    def apresentacao(self):
        return "KEKEKEKEKEKEKKEKEKEkE"
    
    def executa_comando(self, cmd):
        cmd = int(cmd)
        if cmd == 0: #Bom dia
            return "Oiii"
        elif cmd == 1: #Qual é seu nome?
            return f"{self.nome} mas pode me chamar só de Jerson"
        elif cmd == 2: #Quero um conselho
            return "Não morra, é frio e perdi meu salaminho"
        elif cmd == 3: #Adeus
            return "Vorta"

    def boas_vindas(self):
        return "Boa noite"

    def despedida(self):
        return "te vejo amanha"