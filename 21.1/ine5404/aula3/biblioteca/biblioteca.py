from livro import Livro


class Biblioteca:
    def __init__(self):
        self.__livros = []

    def incluirLivro(self, livro: Livro):
        ja_existe = False
        for liv in self.__livros:
            if liv.codigo == livro.codigo:
                ja_existe = True
                print("Livro duplicado")
        if not ja_existe and type(livro) is Livro:
            self.__livros.append(livro)

    def excluirLivro(self, livro: Livro):
        if livro in self.__livros:
            self.__livros.remove(livro)

    @property
    def livros(self):
        return self.__livros
