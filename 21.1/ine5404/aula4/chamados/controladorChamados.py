from abstractControladorChamados import AbstractControladorChamados
from tipoChamado import TipoChamado
from chamado import Chamado
from datetime import date as Date
from cliente import Cliente
from tecnico import Tecnico


class ControladorChamados(AbstractControladorChamados):
    def __init__(self):
        self.__tipoChamados = []
        self.__chamados = []

    @property
    def tipoChamados(self):
        return self.__tipoChamados

    def totalChamadosPorTipo(self, tipo: TipoChamado) -> int:
        total = 0
        for chamado in self.__chamados:
            if chamado.tipo.codigo == tipo.codigo:
                total += 1

        return total

    def incluiChamado(self, data: Date, cliente: Cliente,
                      tecnico: Tecnico, titulo: str, descricao: str,
                      prioridade: int, tipo: TipoChamado) -> Chamado:
        if isinstance(cliente, Cliente) and \
                isinstance(tecnico, Tecnico) and \
                isinstance(tipo, TipoChamado):
            chamado_existe = False
            for chamado in self.__chamados:
                if cliente.codigo == chamado.cliente.codigo and \
                        tecnico.codigo == chamado.tecnico.codigo and \
                        tipo.codigo == chamado.tipo.codigo:
                    chamado_existe = True

            if not chamado_existe:
                novo_chamado = Chamado(data, cliente, tecnico, titulo,
                                       descricao, prioridade, tipo)
                self.__chamados.append(novo_chamado)
                return novo_chamado

            else:
                print("Chamado já existe")
        else:
            print("Parâmetros invalidos")

    def incluiTipoChamado(self, codigo: int, nome: str,
                          descricao: str) -> TipoChamado:
        tipo_existe = False
        for tipo in self.__tipoChamados:
            if codigo == tipo.codigo:
                tipo_existe = True

        if not tipo_existe:
            novo_tipo = TipoChamado(codigo, descricao, nome)
            self.__tipoChamados.append(novo_tipo)
            return novo_tipo
        else:
            print("Tipo já existe")
