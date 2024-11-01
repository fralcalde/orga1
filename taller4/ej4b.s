main:
li a0 2    # Test esPotencia2(2) = 1
jal ra esPotencia2
li t0 1
bne a0 t0 noFunciona

li a0 0b100000    # Test numero grande es potencia de dos
jal ra esPotencia2
li t0 1
bne a0 t0 noFunciona

li a0 55    # Test esPotencia2(55) = 0
jal ra esPotencia2
li t0 0
bne a0 t0 noFunciona

fin:
j fin

noFunciona:
j noFunciona

esPotencia2:
addi sp sp -4    # Prologo
sw ra 0(sp)    # Prologo

mv t1 a0    # Guardo el numero en t1
li a0 0    # Empieza asumiendo que no es potencia de 2
li t0 1
loop:
slli t0 t0 1
beq t0 zero noEs
bgt t0 t1 noEs
bne t1 t0 loop
li a0 1

noEs:
lw ra 0(sp)    # Epilogo
addi sp sp 4    # Epilogo
ret

l0_len: .word 0x4
l0: .word 0x0 0xF0000000 0x1 0x8