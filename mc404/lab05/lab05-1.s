.data
vetor: 
    .word 10
    .word 20
    .word 30
.text
# Imprime a soma dos 3 elementos do vetor
main:
    # Carrega a posicao de vetor pra s0
    lui s0, %hi(vetor)
    addi s0, s0, %lo(vetor)
    
    # Carrega os elementos do vetor e guarda a soma em t0
    lw t0, s0, 0
    lw t1, s0, 4
    add t0, t0, t1
    lw t1, s0, 8
    add t0, t0, t1

    # Imprime a soma dos elementos em t0
    mv a0, t0
    li t0, 1
    ecall
    ret
