.data
arr: .word 0x0 0x1 0x2 0x3
arrsize: .word 0x4

.text
main:
    li a0 1    # Test: 1 * 1 ^ 1 = 1
    li a1 1
    li a2 1
    jal ra evalMonomio
    li t0 1
    bne a0 t0 noFunciona
    
    li a0 0    # Test: 1 * 0 ^ 1 = 0
    li a1 1
    li a2 1
    jal ra evalMonomio
    li t0 0
    bne a0 t0 noFunciona
    
    li a0 1    # Test: 1 * 1 ^ 0 = 1
    li a1 1
    li a2 0
    jal ra evalMonomio
    li t0 1
    bne a0 t0 noFunciona
    
    li a0 4
    li a1 2
    li a2 3
    jal ra evalMonomio
    li t0 128
    bne a0 t0 noFunciona
    
fin:
    j fin
    
noFunciona:
    j noFunciona
    
# Funcion evaluarPolinomio(x, arrayCoef)
# a0 = x
# a1 = puntero a posicion en memoria de array de coeficientes
# La posicion en el array es la potencia del monomio.
# Ej: [3, 1, 2] = 
evalPolinomio:
    addi sp sp -16
    sw ra 0(sp)
    
    
    
    lw ra 0(sp)
    addi sp sp 16
    ret
    
# Funcion evaluarMonomio(x, c, p) = c * x ^ p
# a0 = x
# a1 = c
# a2 = p
evalMonomio:
    addi sp sp -16
    sw ra 0(sp)
    
    mv t0 a0
    beq a2 zero expZero
    addi a2 a2 -1
loop:    # t0 = x ^ p
    beqz a2 finLoop
    mul t0 t0 a0
    addi a2 a2 -1
    j loop
    
finLoop:
    mul a0 a1 t0    # a0 = c * t0
    
    lw ra 0(sp)
    addi sp sp 16
    ret
    
expZero:
    li t0 1
    j finLoop