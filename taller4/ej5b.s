main:
# Test: fibo3(0) = 0
    li a0 0
    jal ra fibo3
    li t0 0
    bne a0 t0 noFunciona

# Test: fibo3(1) = 1
    li a0 1
    jal ra fibo3
    li t0 1
    bne a0 t0 noFunciona

# Test: fibo3(2) = 2
    li a0 2
    jal ra fibo3
    li t0 2
    bne a0 t0 noFunciona
    
# Test: fibo3(3) = 2 + 1 + 0 = 3
    li a0 3
    jal ra fibo3
    li t0 3
    bne a0 t0 noFunciona

# Test: fibo3(4) = 3 + 2 + 1 = 6
    li a0 4
    jal ra fibo3
    li t0 6
    bne a0 t0 noFunciona
    
fin:
    j fin
    
noFunciona:
    j noFunciona
    
fibo3:
    addi sp sp -16
    sw ra 0(sp)
    
    li t0 2
    bgt a0 t0 paso_recursivo
    addi sp sp 16
    jr ra
    
paso_recursivo:
    addi t0 a0 -1
    sw t0 4(sp)
    addi t1 a0 -2
    sw t1 8(sp)
    addi t2 a0 -3
    sw t2 12(sp)
    
    lw a0 4(sp)
    jal ra fibo3
    sw a0 4(sp)
    
    lw a0 8(sp)
    jal ra fibo3
    sw a0 8(sp)
    
    lw a0 12(sp)
    jal ra fibo3
    sw a0 12(sp)
 
    lw t0 4(sp)
    lw t1 8(sp)
    lw t2 12(sp)
    
    add a0 t0 t1
    add a0 a0 t2
    
    lw ra 0(sp)
    addi sp sp 16
    jr ra