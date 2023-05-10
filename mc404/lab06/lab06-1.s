.data
vetor:
    .word 26
    .word 27
    .word 28
    .word 29
    .word 30
.text
# Chama a funcao MultiplicaVetor para multiplicar os elementos de vetor por 10
main:
    # Guarda registradores na pilha
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
    beq  s0, zero, fim

    # Carrega os parametros e salva o resultado
    lw   a0, s1, 0
    mv   a1, s2
    call Multiplica
    sw   a0, s1, 0

    # Passo do loop
    addi s1, s1, 4
    addi s0, s0, -1
    j    for

fim:
    # Movimenta o apontador da pilha 4 posicoes para cima (16 bytes) e recupera 4 registradores da pilha
    lw   ra, sp, 0
    lw   s2, sp, 4
    lw   s1, sp, 8
    lw   s0, sp, 12
    addi sp, sp, 16

    ret