main:
# Test: factorial(0) = 1
    li a0 0
    jal ra factorial
    li t0 1
    bne a0 t0 noFunciona
    
# Test: factorial(5) = 120
    li a0 5
    jal ra factorial
    li t0 120
    bne a0 t0 noFunciona

# Test: factorial(10)
    li a0 10
    jal ra factorial
    li t0 3628800
    bne a0 t0 noFunciona
    
fin:
    j fin

noFunciona:
    j noFunciona
    
factorial:
    addi sp sp -16
    sw ra 0(sp)
    
    sw a0 4(sp)
    addi t0 zero 1
    bgt a0 t0 else
    addi a0 zero 1
    addi sp sp 16
    jr ra
else:
    addi a0 a0 -1
    jal ra factorial
    lw t1 4(sp)
    mul a0 t1 a0
    
    lw ra 0(sp)
    addi sp sp 16
    jr ra