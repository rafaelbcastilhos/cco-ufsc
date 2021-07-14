from abstractControladorPessoas import AbstractControladorPessoas
from cliente import Cliente
from tecnico import Tecnico


class ControladorPessoas(AbstractControladorPessoas):
    def __init__(self):
        self.__clientes = []
        self.__tecnicos = []

    @property
    def clientes(self):
        return self.__clientes

    @property
    def tecnicos(self):
        return self.__tecnicos

    def incluiCliente(self, codigo: int, nome: str) -> Cliente:
        cliente_existe = False
        for cliente in self.__clientes:
            if cliente.codigo == codigo:
                cliente_existe = True

        if not cliente_existe:
            novo_cliente = Cliente(nome, codigo)
            self.__clientes.append(novo_cliente)
            return novo_cliente
        else:
            print("Cliente já existe")

    def incluiTecnico(self, codigo: int, nome: str) -> Tecnico:
        tecnico_existe = False
        for tecnico in self.__tecnicos:
            if tecnico.codigo == codigo:
                tecnico_existe = True

        if not tecnico_existe:
            novo_tecnico = Tecnico(nome, codigo)
            self.__tecnicos.append(novo_tecnico)
            return novo_tecnico
        else:
            print("Tecnico já existe")
