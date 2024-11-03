.data
arrsize: .word 0x5
arr: .word 0x0 0x1 0x2 0x3 0x4
exp: .word 0 -1 -2 -3 -4


.text
main:
    # Tes1t: invertirArray([0, 1, 2, 3, 4]) = [0, -1, -2, -3, -4]
    la s0 arr        # s0 = posicion mem arr
    lw s1 arrsize
    la s2 exp        # s2 = posicion mem exp
    
    mv a0 s0    # Llamar funcion invertirArray
    mv a1 s1
    lw a1 arrsize
    jal ra invertirArray
    
    # Comparar array con resultado esperado
    li t1 0    # Iterador
testLoop:
    bge t1 s1 fin
    lw t0 0(s0)
    lw t2 0(s2)
    bne t0 t2 noFunciona
    addi t0 t0 4
    addi t2 t2 4
    addi t1 t1 1
    j testLoop

fin:
    j fin
    
noFunciona:
    j noFunciona
    
invertir:
    addi sp sp -16
    sw ra 0(sp)
    
    neg a0 a0
    #addi a0 a0 1
    
    lw ra 0(sp)
    addi sp sp 16
    ret
    
# Funcion para convertir cada valor de un arreglo en su complemento a 2 in-place
# ¿Como sería por copia?
# a0 = Posicion en memoria del comienzo del array
# a1 = Cantidad de elementos en el array
invertirArray:
    addi sp sp -16
    sw ra 0(sp)
    
    mv t0 a0    # Me guardo la posicion en memoria del comienzo del array
    li t1 0     # Iterador sobre el array
loop:
    bge t1 a1 finLoop
    lw a0 0(t0)        
    jal ra invertir
    sw a0 0(t0)
    addi t0 t0 4
    addi t1 t1 1
    j loop
    
finLoop:
    lw ra 0(sp)
    addi sp sp 16
    ret
    
