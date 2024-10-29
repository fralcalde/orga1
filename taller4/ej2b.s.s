main:
li a0 0    # p1.x
li a1 0    # p1.y
li a2 1    # p2.x
li a3 1    # p2.y
jal ra mayorR2    # Test caso p1 < p2
li t0 -1
bne a0 t0 noFunciona

li a0 1    # p1.x
li a1 1    # p1.y
li a2 0    # p2.x
li a3 0    # p2.y
jal ra mayorR2    # Test caso p1 > p2
li t0 1
bne a0 t0 noFunciona

li a0 1    # p1.x
li a1 0    # p1.y
li a2 0    # p2.x
li a3 1    # p2.y
jal ra mayorR2    # Test caso p1 ~ p2
li t0 0
bne a0 t0 noFunciona

fin:
j fin

noFunciona:
j noFunciona

mayorR2:
# Prologo

addi sp sp -4
sw ra 0(sp)

li t4 0

slt t0 a2 a0
slt t1 a3 a1
and t0 t0 t1
bne t0 zero caso1

slt t0 a0 a2
slt t1 a1 a3
and t0 t0 t1
bne t0 zero caso2

j finMayorR2

caso1:
addi t4 zero 1
j finMayorR2

caso2:
addi t4 zero -1
j finMayorR2

finMayorR2:
mv a0 t4
# Epilogo

lw ra 0(sp)
addi sp sp 4
ret