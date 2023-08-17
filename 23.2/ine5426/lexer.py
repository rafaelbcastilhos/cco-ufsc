import re

class Lexer:
    def __init__(self, source_code):
        self.source_code = source_code
        self.position = 0

    def get_next_token(self):
        if self.position >= len(self.source_code):
            return None
        
        current_char = self.source_code[self.position]

        if re.match(r'[a-zA-Z]', current_char):
            identifier = current_char
            self.position += 1

            while self.position < len(self.source_code) and re.match(r'[a-zA-Z0-9]', self.source_code[self.position]):
                identifier += self.source_code[self.position]
                self.position += 1

            return 'IDENTIFICADOR'
        
        elif re.match(r'[0-9]', current_char):
            integer = current_char
            self.position += 1

            while self.position < len(self.source_code) and re.match(r'[0-9]', self.source_code[self.position]):
                integer += self.source_code[self.position]
                self.position += 1

            return 'NUM_INT'

        else:  # Outro
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
    print(f'Tokens do codigo {source_code}:')
    tokens = tokenize(source_code)
    print(tokens)

main("1.1")
main("void main(){ int a; a = 3 + 2; }")

