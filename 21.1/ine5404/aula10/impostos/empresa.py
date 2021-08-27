from ... import ...


class Empresa():
    def __init__(self, cnpj: int, nome_de_fantasia: str):
        ...

    '''
    Retorna a lista de impostos da empresa
    @return Lista de impostos da empresa
    '''
    @property
    def impostos(self) -> list:
        ...

    '''
    Inclui um imposto na lista de impostos da empresa
    Verifica se o imposto ja esta cadastrado antes de inserir um novo
    @param imposto imposto a ser incluido
    '''
    def inclui_imposto(self, imposto: Imposto):
        ...

    '''
    Exclui um imposto cadastrado
    @param imposto imposto a ser excluido da lista de impostos da empresa
    '''
    def remove_imposto(self, imposto: Imposto):
        ...

    @property
    def faturamento_servicos(self):
        ...

    @property
    def faturamento_producao(self):
        ...

    @property
    def faturamento_vendas(self):
        ...

    '''
    Calcula o total dos faturamentos da empresa,
    somando: faturamento_producao,
        faturamento_servicos e faturamento_vendas
    @return Somatorio dos faturamentos
    '''
    def faturamento_total(self) -> float:
        ...
        
    '''
    Calcula o total de todos os impostos da empresa
    Percorre a lista de impostos da empresa,
    aplicando a aliquota de cada imposto.
    Leva em conta o tipo de cada imposto (IncidenciaImposto) para aplicar
    a aliquota ao faturamento de Producao, Vendas, Servicos ou sobre o Total
    @return
    '''
    def total_impostos(self) -> float:
        ...
        
    @property
    def cnpj(self):
        ...

    @property
    def nome_de_fantasia(self):
        ...

    @nome_de_fantasia.setter
    def nome_de_fantasia(self, nome_de_fantasia: str):
        ...

    def set_faturamentos(self,
                         fat_servicos: float,
                         fat_producao: float,
                         fat_vendas: float):
        ...
        