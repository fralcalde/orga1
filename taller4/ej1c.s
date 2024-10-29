main: li a0, 1
li a1, 2
jal ra, Mult4menosDiv2
li a3, 3
bne a0, a3, noFunciona # Test: Assert (4*1 - 2/2) != 3
li a0, 3    # Agrego esta linea porque no podemos asumir que el valor de a0
            # no haya sido modificado luego de una llamada a funcion
li a1, 2
jal ra, Mult4menosDiv2
li a3, 11
bne a0, a3, noFunciona # Test: Assert (4*3 - 2/2) != 11
li a1, 12    # Agrego esta linea porque no podemos asumir que el valor de a0
             # no haya sido modificado luego de una llamada funcion
li a0, 3
jal ra, Mult4menosDiv2
li a3, 6
bne a0, a3, noFunciona # Test: Assert (4*3 - 12/2) != 6
funciona: li a1, 1
j fin
noFunciona: li a1, 0
fin: j fin

# Funcion que calcula la resta entre el cuadruple de a0 y la mitad de a1.
Mult4menosDiv2:
addi sp, sp, -4   # Prologo
sw ra, (0)sp      # Prologo
slli a2, a0, 2    # a2 = a0 * 4
srai a1, a1, 1    # a1 = a1 / 2 
sub a0, a2, a1    # a0 = a2 - a1
lw ra, (0)sp      # Epilogo
addi sp, sp, 4    # Epilogo
ret

# La culpa es del programador B por asumir que sus valores en registros a0 y a1 
# no habian sido modificados luego de llamar a funciones. No seguir la convencion
# de llamada estandar