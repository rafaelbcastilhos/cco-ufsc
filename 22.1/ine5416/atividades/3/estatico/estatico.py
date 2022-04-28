from ItemTodo import ItemTodo
from typing import List

class ListaTodo:
    def __init__(items: List[ItemTodo]):
        self.items = items

    @staticmethod
    def dumb_method():
        print('Doh')