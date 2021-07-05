from editora import Editora
from autor import Autor
from capitulo import Capitulo


class Livro:
    def __init__(self, codigo: int, titulo: str, ano: int, editora: Editora,
                 autor: Autor, numeroCapitulo: int, tituloCapitulo: str):
        self.__capitulos = []
        self.__autores = []
        self.__codigo = codigo
        self.__titulo = titulo
        self.__ano = ano
        self.__editora = editora
        if type(autor) is Autor:
            self.__autores.append(autor)
        self.__capitulos.append(Capitulo(numeroCapitulo, tituloCapitulo))

    @property
    def codigo(self):
        return self.__codigo

    @codigo.setter
    def codigo(self, codigo: int):
        self.__codigo = codigo

    @property
    def titulo(self):
        return self.__titulo

    @titulo.setter
    def titulo(self, titulo: str):
        self.__titulo = titulo

    @property
    def ano(self):
        return self.__ano

    @ano.setter
    def ano(self, ano: int):
        self.__ano = ano

    @property
    def editora(self):
        return self.__editora

    @editora.setter
    def editora(self, editora: Editora):
        self.__editora = editora

    @property
    def autores(self):
        return self.__autores

    @property
    def capitulos(self):
        return self.__capitulos

    def incluirAutor(self, autor: Autor):
        ja_existe = False
        for a in self.autores:
            if a.codigo == autor.codigo:
                ja_existe = True
                print("Autor duplicado")
        if not ja_existe and type(autor) is Autor:
            self.autores.append(autor)

    def excluirAutor(self, autor: Autor):
        if autor in self.autores:
            self.autores.remove(autor)

    def incluirCapitulo(self, numeroCapitulo: int, tituloCapitulo: str):
        capitulo = Capitulo(numeroCapitulo, tituloCapitulo)
        ja_existe = False
        for c in self.capitulos:
            if c.numero == capitulo.numero and c.titulo == capitulo.titulo:
                ja_existe = True
                print("Capitulo duplicado...")

        if not ja_existe:
            self.capitulos.append(capitulo)

    def excluirCapitulo(self, tituloCapitulo: str):
        for c in self.capitulos:
            if c.titulo == tituloCapitulo:
                self.capitulos.remove(c)

    def findCapituloByTitulo(self, tituloCapitulo: str):
        for c in self.capitulos:
            if c.titulo == tituloCapitulo:
                return c
