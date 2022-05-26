import ModuloPilha (Pilha (Stack), emptyStack, push, pop, top)
import ModuloFila (Fila (Queue), emptyQueue, enqueue, dequeue, first)

main = do 
     print(push (push emptyStack 1) 2)
     print(top (Stack [1,2,3,4,5]))
     print(pop (Stack [1,2,3,4,5]))

     print (enqueue (enqueue emptyQueue 1) 2)
     print (first (Queue [1,2,3,4,5]))
     print (dequeue (Queue [1,2,3,4,5]))
