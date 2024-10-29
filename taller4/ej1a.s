main: li s1, 2024
mv a0, s1
jal ra, inversoAditivo
add a0, s1, a0
bnez a0, noFunciona # Test: Sumar un numero con su inverso aditivo da 0

funciona: li a1, 1
j fin

noFunciona: li a1, 0
fin: j fin

# Calcular el inverso aditivo del numero pasado por a0.
inversoAditivo:
addi sp, sp, -4   # Prologo
sw ra, (0)sp      # Prologo 
not a1, a0        # Se cambio s1 -> a1 para seguir la convencion de llamada estandar
addi a0, a1, 1    # Se cambio s1 -> a1 para seguir la convencion de llamada estandar
lw ra, (0)sp      # Epilogo
addi sp, sp, 4    # Epilogo
ret

# La culpa es del programador A por escribir la función 
# sin seguir la convencion de llamada estandar