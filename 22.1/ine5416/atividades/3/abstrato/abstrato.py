import abc

class Poligono(metaclass=abc.ABCMeta):
    @abc.abstractmethod
    def area(self):
        pass