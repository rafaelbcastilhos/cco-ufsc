.data
# Arranjo inicializado com elementos N não nulos.
_array: .half 3:4		  # N elementos com o valor 3       [substitua N pelo valor definido no relatório]
_size: .word 4  		  # tamanho do arranjo              [substitua N pelo valor definido no relatório]

.text
.globl main

main:
    la $a0, _array        # $a0 = &array                    [completar com 1 pseudo-instrução]
    lw $a1, _size         # $a1 = size                      [completar com 1 instrução nativa]
    jal clear1
    li  $v0,10
    syscall

clear1:
   add $t0, $zero, $zero  # i=0                             [completar com 1 instrução nativa]
loop1:
   slt $t3, $t0, $a1      # $t3 = (i < size)                [completar com 1 instrução nativa]
   beq $t3, $zero, Exit   # se (i >= size) desvia para Exit [completar com 1 instrução nativa]
   sll $t1, $t0, 1        # i = i * 4                       [completar com 1 instrução nativa]
   add $t2,$a0,$t1        # $t2 = &array[i]                 
   sb $zero,0($t2)        # array[i] = 0                    
   addi $t0,$t0,1       # i++                             [completar operando faltante]                      
   j loop1
   
Exit:
   jr $ra