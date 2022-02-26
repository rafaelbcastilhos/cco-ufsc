from time import sleep
from random import randint
from threading import Thread, Semaphore

def produtor():
  global buffer
  for i in range(10):
    semaforo_espacos.acquire()
    sleep(randint(0,2))           # fica um tempo produzindo...
    item = 'item ' + str(i)
    # verifica se há lugar no buffer
    buffer.append(item)
    print('Produzido %s (ha %i itens no buffer)' % (item,len(buffer)))
    semaforo_produtos.release()

def consumidor():
  global buffer
  for i in range(10):
    semaforo_produtos.acquire()
    # aguarda que haja um item para consumir 
    item = buffer.pop(0)
    print('Consumido %s (ha %i itens no buffer)' % (item,len(buffer)))
    sleep(randint(0,2))         # fica um tempo consumindo...
    semaforo_espacos.release()

buffer = []
tam_buffer = 3

# cria semáforos
semaforo_espacos = Semaphore(tam_buffer)
semaforo_produtos = Semaphore(0)

# cria thread produtora e consumidora
produtor = Thread(target=produtor) 
consumidor = Thread(target=consumidor) 

# inicia thread produtora e consumidora
produtor.start()
consumidor.start()

# aguarda thread produtora e consumidora finalizarem
produtor.join()
consumidor.join() 