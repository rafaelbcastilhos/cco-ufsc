from abc import ABC, abstractmethod


class Bot(ABC):

    def __init__(self, nome, comandos):
        self.__nome = nome
        self.__comandos = comandos

    @property
    def nome(self):
        return self.__nome

    @nome.setter
    def nome(self, nome):
        self.__nome = nome

    def mostra_comandos(self):
        string_comandos = ""
        for comando in self.__comandos:
            string_comandos += f"{comando} - {self.__comandos[comando]}\n"
        return string_comandos

    @abstractmethod
    def executa_comando(self, cmd):
        pass

    @abstractmethod
    def apresentacao(self):
        pass

    @abstractmethod
    def boas_vindas():
        pass
    
    @abstractmethod
    def despedida():
        pass