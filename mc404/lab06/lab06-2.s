.data
vetor:
    .word 1
    .word 2
    .word 3
    .word 4
    .word 5
.text
# Chama a funcao MultiplicaVetor para multiplicar os elementos de vetor por um 10
main:
    # Guarda os registradores na pilha
    addi sp, sp, -4
    sw ra, sp, 0

    # Numero de elementos
    li a0, 5

    # Endereco do vetor
    lui a1, %hi(vetor)
    addi a1, a1, %lo(vetor)

    # Fator de multiplicacao
    li a2, 10
    call MultiplicaVetor

    # Retorna o valor dos registradores guardados na pilha
    lw ra, sp, 0
    addi sp, sp, 4

    ret

# Recebe o numero de elementos, o endereco de um vetor e um fator e multiplica cada elemento pelo fator recebido com o auxilio da funcao Multiplica
MultiplicaVetor:
    # Movimenta o apontador da pilha 4 posicoes para baixo (16 bytes) e guarda 4 registradores na pilha
    addi sp, sp, -16
    sw   s0, sp, 12
    sw   s1, sp, 8
    sw   s2, sp, 4
    sw   ra, sp, 0

    # Salva os parametros
    mv   s0, a0 # Numero de elementos
    mv   s1, a1 # Endereco do vetor
    mv   s2, a2 # Fator de multiplicacao

# Multiplica cada elemento do vetor em s1 pelo fator guardado em s2 com o auxilio a funcao Multiplica
for:
    # Condicao de parada
    beq  s0, zero, fim_MultiplicaVetor

    # Carrega os parametros, chama a funcao e salva o resultado
    lw   a0, s1, 0
    mv   a1, s2
    call Multiplica
    sw   a0, s1, 0

    # Passo do loop
    addi s1, s1, 4
    addi s0, s0, -1
    j    for

fim_MultiplicaVetor:
    # Movimenta o apontador da pilha 4 posicoes para cima (16 bytes) e recupera 4 registradores da pilha
    lw   ra, sp, 0
    lw   s2, sp, 4
    lw   s1, sp, 8
    lw   s0, sp, 12
    addi sp, sp, 16
    
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