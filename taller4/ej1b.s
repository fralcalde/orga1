main: li a0, 4
li a1, 6
jal ra, Suma
li a2, 10
bne a0, a2, noFunciona    # Test: La suma entre 4 y 6 es 10
funciona: li a1, 1
j fin
noFunciona: li a1, 0
fin: j fin

# Funcion Suma entre a0 y a1.
Suma:
addi sp, sp, -4   # Prologo
sw ra, (0)sp      # Prologo
add a0, a0, a1    # Se cambia a3 -> a0 para respetar convencion de llamada estandar
lw ra, (0)sp      # Epilogo
addi sp, sp, 4    # Epilogo
ret

# La culpa es del programador A por escribir la funcion sin seguir la convencion
# de llamada estandar. Especificamente no escribir el valor de retorno de la
# funcion en el registro a0.