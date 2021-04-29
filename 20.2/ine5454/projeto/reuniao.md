## Reunião 5454:

### Reunião 1

1. seed linkedin com acesso proibido:
    - DEBUG: Forbidden by robots.txt: <GET https://www.linkedin.com/jobs/engenheiro-de-software-vagas>
    - porém com ROBOTSTXT_OBEY = False é redirecionado (301)

2. seed do estagios ufsc com captcha 
- tentar fazer com vpn

3. definições de parada
    - ITEMCOUNT / PAGECOUNT
    - local apropriado para definir isso?
    - parametro, extensions, settings?
- verificar funcao close_spider

4. cabecalho de encoding na request

### Reunião 2

1. Seed da estágios UFSC funciona com VPN ativado

2. Seed da trovit com acesso proibido

### Reunião 3

1. regex para extração das informações, utilizando a abordagem da palavra chave

2. dificuldade em encontrar padrões em títulos e descrições

3. listagem de todas as spiders e execução de cada uma em específico

### Reunião 4

1. dificuldade em encontrar valores nos nodos vizinhos ao salário e hierarquia e modo

2. maiores informações sobre seeds que não foram definidas, encontra mas não obtem sucesso na extração

3. quantidade e qualidade das informações extraídas não possuem os requisitos mínimos de um objeto de vaga

### Reunião 5

1. adição do atributo url para verificar a pagina que foi extraída

2. materialização do json

3. erro DNS lookup failed: no results for hostname lookup em https://www.nextshipping.com.br/

4. inicio de criacao pagina web

### Reunião 6

1. conjunto de palavras que fazem sentido pro contexto de um titulo de vaga

2. extração do titulo verificando se a string possui alguma palavra do conjunto
   - tag title
   - tags h1, h2, ...
   - tag strong

3. adição de verificação se o item extráido possui determinados atributos diferente de nulo

### Reunião 7

1. atualização do arquivo no drive

2. juntamente a entrega final, deverá ser entregue a infraestrutura de virtualização e containers ou apenas o fonte?

3. possibilidade de não estar presente na próxima reunião


