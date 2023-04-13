main:
	# Le um numero do teclado
	li t0, 4
	ecall

	# salva em s0
	mv s0, a0

	li s1, 32
	li s2, 1
	slli s2, s2, 31

for:
	beq s1, zero, fim
	and a0, s2, s0
	srli s2, s2, 1
	addi s1, s1, -1
	bne a0, zero, um
	li a0, 48
	j imprimir

um:
	li a0, 49

imprimir:
	li t0, 2
	ecall
	j for

fim:
	ret


