main: 
li a0, 3
li a1, 10
li a2, -5
li a3, 2
li a4, 5
li a5, -1
jal ra, perteneceR2
li a2, 1
bne a0, a2, noFunciona
# Test:
# P = (5, -1)
# R = [3, 10] X [-5, 2]
# Assert P E R (P pertenece a R)
funciona:
li a1, 1
j fin
noFunciona:
li a1, 0
fin:
j fin

# Funcion para checkear si un punto pertenece a una región.
# R (region) = [a0; a1] x [a2; a3]
# P (punto) = (a4; a5)
perteneceR2:
addi sp, sp, -12    # Prologo
sw a2, (0)sp
sw s0, (4)sp
sw ra, (8)sp
li s0, 1
mv a2, a4
jal ra, pertenece
bne a0, s0, return
lw a0, (0)sp
mv a1, a3
mv a2, a5
jal ra, pertenece
bne a0, s0, return
lw s0, (4)sp
return:
lw ra, (8)sp
addi sp, sp, 12    # Epilogo (Corregido.)
ret
# El error era que la etiqueta return estaba despues del epilogo.
# Por lo tanto si la función se hubiera ejecutado para un P que 
# no pertenezca a la región R, se hubiera retornado de la función
# sin volver a incrementar el stackpointer.

# Pertenece a2 a intervalo [a0; a1]
pertenece:
addi sp, sp, -4    # Prologo
sw ra, (0)sp
sub a3, a2, a0
blt a3, zero, afuera
sub a5, a2, a1
bgt a5, zero, afuera
adentro:
li a0, 1
j terminar
afuera:
li a0, 0
terminar:
lw ra, (0)sp
addi sp, sp, 4    # Epilogo
ret

# Seguimiento de stackpointer
# 0x7ffffff0
# 0x7fffffe4
# 0x7fffffe0
# 0x7fffffe4
# 0x7fffffe0
# 0x7fffffe4
# 0x7ffffff0