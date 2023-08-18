import re

class Lexer:
    def __init__(self, source_code):
        self.source_code = source_code
        self.position = 0

    def get_next_token(self):
        if self.position >= len(self.source_code):
            return None
        
        current_char = self.source_code[self.position]

#Estado Inicial: Aguardando caractere '#'
#Se '#':
#    Comece a acumular caracteres até nova linha
#    Emita token COMENTARIO
#    Retorne ao estado inicial
        if current_char == '#':  # Verifica se atende o primeiro estado do diagrama COMENTARIO
            comment = current_char
            self.position += 1

            while self.position < len(self.source_code) and self.source_code[self.position] != '\n': # Enquanto não haver quebra de linha, tudo será considerado comentário. Afinal, o analisador léxico vai descartar os comentários
                comment += self.source_code[self.position]
                self.position += 1

            return 'COMENTARIO'

#Estado Inicial: Aguardando caractere que corresponda a [a-zA-Z]
#Se caractere alfanumérico que corresponda a [a-zA-Z0-9]:
#    Adicione o caractere ao identificador
#    Continue acumulando caracteres alfanuméricos
#Senão:
#    Emita token IDENTIFICADOR
#    Retorne ao estado inicial
        elif re.match(r'[a-zA-Z]', current_char): # Verifica se atende o primeiro estado do diagrama IDENTIFICADOR
            identifier = current_char
            self.position += 1

            while self.position < len(self.source_code) and re.match(r'[a-zA-Z0-9]', self.source_code[self.position]): # Verifica se atende o segundo estado do diagrama IDENT
                identifier += self.source_code[self.position]
                self.position += 1

            return 'IDENTIFICADOR'
        
#Estado Inicial: Aguardando dígito
#Se dígito ou .:
#    Continue acumulando dígitos ou .
#Se houver . na sequência de caracteres:
#    Emita token NÚMERO_PONTO_FLUTUANTE
#    Retorne ao estado inicial
#Senão:
#   Emita o token NUMERO_INTEIRO
#    Retorne ao estado inicial
        elif re.match(r'[0-9]', current_char): # Verifica se atende o primeiro estado do diagrama NUMERO_INTEIRO e NUMERO_PONTO_FLUTUANTE
            num = current_char
            self.position += 1

            while self.position < len(self.source_code) and (re.match(r'[0-9]', self.source_code[self.position]) or self.source_code[self.position] == '.'): # Verifica se continua atendendo o primeiro estado do diagrama NUMERO_INTEIRO e NUMERO_PONTO_FLUTUANTE
                num += self.source_code[self.position]
                self.position += 1

            if '.' in num: # Se houver . na sequência de caracteres, atende o segundo estado do diagrama NUMERO_PONTO_FLUTUANTE
                return 'NUMERO_PONTO_FLUTUANTE'
            else: # Atende o primeiro estado do diagrama NUMERO_INTEIRO
                return 'NUMERO_INTEIRO'

        else:  # Entra no caso OUTRO dos diagramas
            self.position += 1
            return 'OUTRO'

def tokenize(source_code):
    lexer = Lexer(source_code)
    tokens = []
    
    while True:
        token = lexer.get_next_token()
        if token is None:
            break
        tokens.append(token)

    return tokens

def main(source_code):
    print(f'Tokens do codigo: {source_code}')
    tokens = tokenize(source_code)
    print(f'{tokens}\n')

# Exemplos de teste
main("1.1")
main("void main(){ int a; a = 3 + 2; }")
main("# isso é um comentário")
main("a = 3 + 2; #somando\n b = 3.5 * 2.1; #multiplicando\n c = 3 / 2.9; #dividindo")
main("def f () { int a; a = 5 + 3.9; return; }")

