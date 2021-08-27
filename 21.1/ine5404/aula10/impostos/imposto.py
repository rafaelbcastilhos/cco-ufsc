from abc import ...


class Imposto(ABC):
    def ...(...):
        ...
        
    '''
    Operacao abstrata que ira calcular a aliquota
    Cada classe que ira estender Imposto devera implementar o calculo de acordo 
    com a sua regra  
    '''
    @ ...
    def calcula_aliquota(self) -> float:
        ...

    ...