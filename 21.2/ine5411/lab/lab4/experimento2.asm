.data
# Arranjo inicializado com elementos N não nulos. 
_array: .half 3:4	   # N elementos com o valor 3               [substitua N pelo valor definido no relatório]
_size: .word 4  	   # tamanho do arranjo                      [substitua N pelo valor definido no relatório]

.text
.globl main

main:
    la $a0, _array        # $a0 = &array                    [completar com 1 pseudo-instrução]
    lw $a1, _size         # $a1 = size                      [completar com 1 instrução nativa]
    jal clear2
    li  $v0,10
    syscall
    
clear2:     
   add $t0, $a0, $zero # $t0 <- $a0                              [completar com 1 instrução nativa]
   sll $t1, $a1, 1     # $t1 <- size*4                           [completar com 1 instrução nativa]
   add $t2,$a0,$t1     # $t2 <- &array[size]                    
loop2:
   slt $t3, $t0, $t2   # $t3 = (p < &array[size])                [completar com 1 instrução nativa]
   beq $t3, $zero, Exit# se (p >= &array[size]) desvia para Exit [completar com 1 instrução nativa]
   sb $zero,0($t0)     # mem[p] = 0                              
   addi $t0,$t0,2    # p = p + ?                               [completar operando faltante]
   j loop2
   
Exit:
   jr $ra	