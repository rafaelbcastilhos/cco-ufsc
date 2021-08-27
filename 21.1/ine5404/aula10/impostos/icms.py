from ... import ...


'''
O calculo da Aliquota do ICMS (percentual do imposto)
leva em conta a "diferenca_estado".
O valor de "diferenca_estado" deve ser somado a aliquota informada.
Por exemplo, se a aliquota informada no construtor for 10.0
e a "diferenca_estado" for 2, entao a aliquota calculada sera de 12.0
'''


class ICMS(Imposto):
    def __init__(...):
        ...
        super(). ...

    @property
    def ...

    @diferenca_estado.setter
    def ...

    def calcula_aliquota(self):
        ...