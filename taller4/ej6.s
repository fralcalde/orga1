.data
tablaCalificaciones:
    .half 5523
    .byte 3
    .half 8754
    .byte 1
    .half 4832
    .byte 10
    .half 8771
    .byte 3
    .half 0
    .half 5523
    .byte 3
    .half 8754
    .byte 1
    .half 4832
    .byte 10
    .half 8771
    .byte 3
    .half 0
    
.text
main:
    la a0 tablaCalificaciones
    jal ra sumarNotasImpares
    li t0 12
    bne a0 t0 noFunciona
    
fin:
    j fin
    
noFunciona:
    j noFunciona
    
sumarNotasImpares:
    addi sp sp -16
    sw ra 0(sp)
    
    li t1 0
loop:
    lh t0 0(a0)
    beq t0 zero finSumarNotasImpares
    
    # Ver si el ID es impar
    li t3 1
    and t3 t0 t3
    beq t3 zero noEsImpar
    
    lb t2 2(a0)
    add t1 t1 t2
noEsImpar:
    addi a0 a0 3
    j loop
    
finSumarNotasImpares:
    mv a0 t1
    lw ra 0(sp)
    addi sp sp 16
    ret