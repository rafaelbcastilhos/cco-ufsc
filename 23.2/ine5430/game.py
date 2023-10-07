from easyAI import TwoPlayerGame, Human_Player, AI_Player, Negamax
from easyAI import solve_with_iterative_deepening
from colorama import Fore


class DotsGame(TwoPlayerGame):
    def __init__(self, players=None, board_size=3):
        # Inicialização do jogo com parâmetros opcionais para jogadores e tamanho do tabuleiro.
        self.SIZE = board_size
        self.TOTAL = (self.SIZE * self.SIZE) - 1
        self.LAST_LINE = (self.TOTAL + 1) - self.SIZE
        self.LAST_COLUMN = self.SIZE - 1

        # Configuração dos jogadores, tabuleiro e jogador atual.
        self.players = players
        self.board = self.create_board()
        self.current_player = 1

        # Lista para armazenar as jogadas dos jogadores.
        self.player_1_moves = [[] for i in range(self.TOTAL + 1)]
        self.player_2_moves = [[] for i in range(self.TOTAL + 1)]

    def create_board(self):
        # Criação do tabuleiro com bordas e pontos.
        return [(i, i + 1) for i in range(self.TOTAL) if i % self.SIZE != self.LAST_COLUMN] + \
               [(i, i + self.SIZE) for i in range(self.LAST_LINE)]

    def possible_moves(self):
        # Retorna os movimentos possíveis.
        return self.board

    def make_move(self, move):
        # Realiza um movimento no jogo e atualiza o estado.
        self.board.remove(move)
        x, y = move
        if self.current_player == 1:
            self.player_1_moves[x].append(y)
        else:
            self.player_2_moves[x].append(y)

    def win(self):
        # Verifica se alguém venceu o jogo.
        return self.scoring() > 0

    def is_over(self):
        # Verifica se o jogo terminou.
        return not bool(self.board)

    def scoring(self):
        # Calcula a pontuação do jogo.
        score = 0
        for i in range(len(self.player_1_moves)):
            moves = self.player_1_moves[i]
            if ((i + 1) in moves) and ((i + self.SIZE) in moves):
                if (i + self.SIZE + 1) in self.player_1_moves[i + 1]:
                    if (i + self.SIZE + 1) in self.player_1_moves[i + self.SIZE]:
                        score += 1

        for i in range(len(self.player_2_moves)):
            moves = self.player_2_moves[i]
            if ((i + 1) in moves) and ((i + self.SIZE) in moves):
                if (i + self.SIZE + 1) in self.player_2_moves[i + 1]:
                    if (i + self.SIZE + 1) in self.player_2_moves[i + self.SIZE]:
                        score -= 1

        if score > 0:
            return 100
        else:
            return 0

    def lose(self):
        # Verifica se o jogador perdeu.
        return self.scoring() <= 0

    def show(self):
        # Exibe o estado atual do tabuleiro.
        for i in range(self.SIZE):
            for j in range(self.SIZE):
                print(Fore.RESET + '.', end='')
                number = (i * self.SIZE) + j
                if number + 1 in self.player_1_moves[number]:
                    print(Fore.BLUE + '-', end='')
                elif number + 1 in self.player_2_moves[number]:
                    print(Fore.RED + '-', end='')
                else:
                    print(' ', end='')

            print()
            for j in range(self.SIZE):
                number = (i * self.SIZE) + j
                if number + self.SIZE in self.player_1_moves[number]:
                    print(Fore.BLUE + '|', end='')
                elif number + self.SIZE in self.player_2_moves[number]:
                    print(Fore.RED + '|', end='')
                else:
                    print(' ', end='')
                print(' ', end='')
            print()


if __name__ == "__main__":
    print("|...| DOTS GAME |...|")

    execute = True
    while execute:
        print()
        print("Digite uma opção: ")
        print("1 - Jogar contra a IA")
        print("2 - Observar uma IA jogar contra a outra")
        print("3 - Solucionar com aprofundamento iterativo")
        print("Para sair, digite qualquer coisa")
        option = int(input())
        print()

        if option > 3 or option <= 0:
            execute = False
            break

        size = int(input("Digite o tamanho do tabuleiro. O padrão é 3: "))

        ai1 = Negamax(5)
        ai2 = Negamax(1)

        if option == 3:
            # Resolvendo o jogo com aprofundamento iterativo.
            r, d, m = solve_with_iterative_deepening(
                game=DotsGame(board_size=size),
                ai_depths=range(2, 20),
                win_score=100
            )

            print("r: ", end='')
            print(r)
            print("d: ", end='')
            print(d)
            print("m: ", end='')
            print(m)

        else:
            if option == 1:
                game = DotsGame([AI_Player(ai1), Human_Player()], board_size=3)
            elif option == 2:
                game = DotsGame([AI_Player(ai1), AI_Player(ai2)], board_size=3)

            # Iniciando o jogo.
            game.play()
            if game.lose():
                print("Jogador %d venceu" % game.current_player)
            else:
                print("Empate")
