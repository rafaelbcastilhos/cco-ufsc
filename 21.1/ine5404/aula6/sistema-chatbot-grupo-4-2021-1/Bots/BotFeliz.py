from Bots.Bot import Bot


class BotFeliz(Bot):
    def __init__(self, nome):
        self.__nome = nome

    # nao esquecer o decorator
    @property
    def nome(self):
        return self.__nome

    # nao esquecer o decorator
    @nome.setter
    def nome(self, novo_nome):
        self.__nome = novo_nome

    def apresentacao(self):
        return f'Oiiii. Meu nome é {self.__nome}. :)'

    def mostra_comandos(self):
        return "1 - Bom dia \n2 - Qual seu nome? \n3 - Quero um conselho \n4 - Adeus"

    def executa_comando(self, cmd):
        if cmd == '1':
            return 'Bom dia, Bom dia, o sol já nasceu lá na fazendinha.'
        elif cmd == '2':
            return 'Oiii, meu nome é Qiyana e estou aqui para lhe ajudar.'
        elif cmd == '3':
            return 'SEJA FELIZ. Não ligue para os outros'
        else:
            return self.despedida()

    def boas_vindas(self):
        return "Seja bem vindesss :)"

    def despedida(self):
        return "Adeusinho. Vou sentir sua falta :)"
