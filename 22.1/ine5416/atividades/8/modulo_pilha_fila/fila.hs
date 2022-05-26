module ModuloFila (Fila (Queue), enqueue, dequeue, first, emptyQueue) where

data Fila t = Queue [t] deriving (Eq,Show)

enqueue :: Fila t -> t -> Fila t
enqueue (Queue q) x = Queue (q ++ [x])

dequeue :: Fila t -> Fila t
dequeue (Queue []) = error "Empty"
dequeue (Queue q) = Queue (tail q)

first :: Fila t -> t
first (Queue []) = error "Empty"
first (Queue (x:s)) = x

emptyQueue :: Fila t
emptyQueue = Queue []