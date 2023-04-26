# Le um numero doteclado e imprime sua codificacao em binario
main:
	# Le um numero do teclado e salva em s0
	li t0, 4
	ecall
	mv s0, a0

    # Move o valor 1 31 bits para a esquerda e salva em s2 
	li s2, 1
	slli s2, s2, 31

for:
    # Verifica se nao existem mais bits para analisar
	beq s2, zero, fim

    # Guarda em a0 o bit de s0 na mesma posicao do bit 1 de s2
	and a0, s2, s0

    # Move o bit 1 de s2 uma osicao para a direita
	srli s2, s2, 1

    # Verifica o valor do bit
	bne a0, zero, um

    # Carrega o codigo ASCII do caractere 0 em a0
	li a0, 48
	j imprimir

um:
    # Carrega o codigo ASCII do caractere 1 em a0
	li a0, 49

imprimir:
    # Imprime o caractere em a0
	li t0, 2
	ecall

    # Retorna ao for
	j for

fim:
    # Quebra de linha
    li a0, 10
    li t0, 2
    ecall
	ret


