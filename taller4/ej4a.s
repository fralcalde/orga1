main:
la a1 q #Test caso arreglo: 0, -16, 220, 13
lw a2 qtamaño
jal valorVuelta
lw t0 -16(a1)
addi t1 zero 0
bne t0 t1 noFunciona
lw t0 -12(a1)
addi t1 zero 16
bne t0 t1 noFunciona
lw t0 -8(a1)
addi t1 zero -220
bne t0 t1 noFunciona
lw t0 -4(a1)
addi t1 zero -13
bne t0 t1 noFunciona

la a1 s #Test caso arreglo: -1, 16, 10
lw a2 stamaño
jal valorVuelta
lw t0 -12(a1)
addi t1 zero 1
bne t0 t1 noFunciona
lw t0 -8(a1)
addi t1 zero -16
bne t0 t1 noFunciona
lw t0 -4(a1)
addi t1 zero -10
bne t0 t1 noFunciona

li a0 15 #Test invertir caso x>0
jal ra invertirNumero
li t0 -15
bne a0 t0 noFunciona

li a0 -10 #Test invertir caso x<0
jal ra invertirNumero
li t0 10
bne a0 t0 noFunciona

li a0 0 #Test invertir caso x=0
jal ra invertirNumero
bne a0 zero noFunciona

fin:
j fin

noFunciona:
j noFunciona

vuelta:
addi ra s0 0
ret

valorVuelta:
addi s0 ra 0

invertirArreglo:
beq a2 zero vuelta
lw a0 0(a1)
jal invertirNumero
sw a0 0(a1)
addi a1 a1 4
addi a2 a2 -1
j invertirArreglo



invertirNumero:
addi t0 zero -1
xor a0 t0 a0
addi a0 a0 1
ret

stamaño: .word 0x3
s: .word 0xFFFFFFFF 0x10 0xA

q: .word 0x0 0xFFFFFFF0 0xDC 0xD
qtamaño: .word 0x4
