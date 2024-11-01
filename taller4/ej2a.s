main:
li a0 0    # Test caso fibo(0) = 0
jal ra fibo
bne a0 zero noFunciona

li a0 1    # Test caso fibo(1) = 1
jal ra fibo
li t0 1
bne a0 t0 noFunciona

li a0 15    # Test caso fibo(15) = 610
jal ra fibo
li t0 610
bne a0 t0 noFunciona

fin:
j fin

noFunciona:
j noFunciona

fibo:
# Prologo

addi sp sp -4
sw ra 0(sp)

beq a0 zero finFibo
li t0 2    # Iterador i
li t1 0    # fib(n - 1) x
li t2 1    # fib(n) y

comienzoLoop:
blt a0 t0 finLoop
add t3 t2 t1
mv t1 t2
mv t2 t3
addi t0, t0, 1
j comienzoLoop

finLoop:
mv a0 t2
finFibo:
# Epilogo

lw ra 0(sp)
addi sp sp 4
ret