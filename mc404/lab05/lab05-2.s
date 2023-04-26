.data
vetor: 
    .word 10
    .word 20
    .word 30
.text
# Soma 1 em cada elemento do vetor e imprime o novo vetor
main:
    # Carrega o endereco de vetor
    lui s0, %hi(vetor)
    addi s0, s0, %lo(vetor)

    # Soma 1 no primeiro elemento e imprime
    lw a0, s0, 0
    addi a0, a0, 1
    
    li t0, 1
    ecall

    sw a0, s0, 0

    # Soma 1 no segundo elemento e imprime
    lw a0, s0, 4
    addi a0, a0, 1
    
    li t0, 1
    ecall
    
    sw a0, s0, 4

    # Soma 1 no terceiro elemento e imprime
    lw a0, s0, 8
    addi a0, a0, 1
    
    li t0, 1
    ecall

    sw a0, s0, 8
    
    ret