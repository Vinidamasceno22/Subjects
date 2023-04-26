.rodata
vetor0: 
    .word 10
    .word 20
    .word 30
    .word 40
    .word 50

vetor1:
    .word 100
    .word 90
    .word 80
    .word 70
    .word 60

.data
vetor2:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
# Guarda a soma de elementos de mesmo indice do vetor0 e do vetor1 no vetor2 e imprime a soma dos elementos do vetor2
main:
    # Inicializa contante e registradores utilizados no 0
    li t0, 5
    li t1, 0
    li s3, 0

    # Carrega o endereco dos vetores
    lui s0, %hi(vetor0)
    addi s0, s0, %lo(vetor0)

    lui s1, %hi(vetor1)
    addi s1, s1, %lo(vetor1)
    
    lui s2, %hi(vetor2)
    addi s2, s2, %lo(vetor2)

# Soma os elementos no indice t4 do vetor0 e vetor1, guarda no mesmo indice no vetor2 e guarda a soma total em s3
for:
    # Carrega o elemento do vetor0
    add t4, s0, t1
    lw t2, t4, 0

    # Carrega o elemento do vetor1
    add t4, s1, t1
    lw t3, t4, 0

    # Soma os elementos e adiciona a soma total
    add t2, t2, t3
    add s3, s3, t2

    # Salva a soma dos elementos no vetor2
    add t4, s2, t1
    sw t2, t4, 0

    # Atualiza os contadores e verifica a condicao de parada
    addi t1, t1, 4
    addi t0, t0, -1
    blt zero, t0, for

imprimir:
    # Imprime a soma total dos elemento
    mv a0, s3
    li t0, 1
    ecall
    ret

