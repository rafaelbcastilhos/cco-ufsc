from Bots.Bot import Bot


class BotCansado(Bot):
    def __init__(self, nome):
        comandos = {"1": "Dar um conselho",
                    "2": "Por que está tão cansado?",
                    "3": "Qual seu nome?"}
        super().__init__(nome, comandos)

    def apresentacao(self):
        return f"....zzz.... ah, meu nome? meu nome é {self.nome}..."
    
    def executa_comando(self, cmd):
        try:
            respostas = {"1": "...dormir pelo menos 8 horas por dia é bom...",
                         "2": "...fiquei até às 4h da manhã fazendo VPL...",
                         "3": f"...ah, eu me chamo {self.nome[:-2]}... ...zzzzz..."}
            return respostas[cmd]
        except:
            return "...não sei do que você está falando..."

    def boas_vindas(self):
        return "...não demore por favor, quero ir dormir logo..."

    def despedida(self):
        return "...finalmente, agora posso dorm- ...zzzzzz..."