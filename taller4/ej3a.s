main: 
li a0, 4
li a1, 87
li a2, -124
li a3, -14
jal ra, minimo
li a2, -124
bne a0, a2, noFunciona

# Caso de test: L = [4, 87, -124, -14]
# assert min(L) = -124

funciona: 
li a1, 1
j fin

noFunciona: li a1, 0
fin: j fin

# Calcular minimo de la lista
minimo: 
addi sp, sp, -12    # Prologo
sw a2, (0)sp
sw a3, (4)sp
sw ra, (8)sp
jal ra, minimo2
mv s1, a0        # Pisar un registro s no sigue convención de llamada estandar
lw a0, (0)sp
lw a1, (4)sp
jal ra, minimo2
mv a1, s1
jal ra, minimo2
lw ra, (8)sp
addi sp, sp, 12    # Epilogo
ret

# Calcular minimo entre parametros
# a0 y a1
minimo2:
addi sp, sp, -4    # Prologo
sw ra, (0)sp
bgt a1, a0, terminar
mv a0, a1
terminar:
# Error causado por no seguir la convención
# y no volver el stackpointer a su valor original
# antes de retornar de la funcion
lw ra, (0)sp
addi sp, sp, 4    # Epilogo
ret

# Seguimiento de stackpointer:
# 0x7ffffff0
# 0x7fffffe4
# 0x7fffffe0
# 0x7fffffe4
# 0x7fffffe0
# 0x7fffffe4
# 0x7fffffe0
# 0x7fffffe4
# 0x7ffffff0