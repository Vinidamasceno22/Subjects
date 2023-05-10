.text
# Le um numero do teclado e imprime seu fatorial
main:
    # Guarda os registradores na pilha
    addi sp, sp, -4
    sw ra, sp, 0

    # Le um numero do teclado e chama a funcao fatorial para ele
    li t0, 4
    ecall
    call fatorial

    # Imprime o um numero
    li t0, 1
    ecall

    # Retorna o valor dos registradores salvos na pilha
    lw ra, sp, 0
    addi sp, sp, 4
    
    ret
# Recebe um numero nao negativo e retorna seu fatorial recursivamente
fatorial:
    # Guarda os registradores na pilha
    addi sp, sp, -8
    sw ra, sp, 0
    sw s0, sp, 4

    # Define o fatorial de 0 como 1
    beq a0, zero, um

    # Salva o numero em s0
    mv s0, a0
    # calcula o fatorial para o numero anterior
    addi a0, a0, -1
    call fatorial

    # Multiplica o numero pelo fatorial do numero anterior
    mv a1, a0
    mv a0, s0
    call Multiplica

    # Retorna o valor dos registradores salvos na pilha
    lw ra, sp, 0
    lw s0, sp, 4
    addi sp, sp, 8

    # Retorna o fatorial do numero
    ret

# Recebe dois numeros e retorna o resultado do seu produto
Multiplica: 
    # Inicializa os contadores
    li t0, 32
    li t1, 0
    li t2, 0

    # Coloca o menor numero em a1
    bltu a1, a0, for2
    mv t3, a0
    mv a0, a1
    mv a1, t3

# Faz a multiplicacao para cada bit de a1
for2:
    # Soma a0 caso o bit menos significatico de a1 for 1 e continua caso contrario
    andi t1, a1, 1
    beq t1, zero, continue
    add t2, t2, a0
continue:
    # Move os bits de a0 para a esquerda e os de a1 para a direita
    slli a0, a0, 1
    srli a1, a1, 1
    addi t0, t0, -1
    # Condicoes de parada
    beq a1, zero, fim_Multiplica
    beq a0, zero, fim_Multiplica
    bne zero, t0, for2

# Retorna o produto
fim_Multiplica:
    mv a0, t2
    ret
