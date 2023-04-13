.data
vetor: 
    .word 10
    .word 20
    .word 30
.text
main:
    # Carrega o endereco de vetor
    lui s0, %hi(vetor)
    addi s0, s0, %lo(vetor)

    # Soma 1 em cada elemento e imprime o resultado
    lw a0, s0, 0
    addi a0, a0, 1
    
    li t0, 1
    ecall

    sw a0, s0, 0

    lw a0, s0, 4
    addi a0, a0, 1
    
    li t0, 1
    ecall
    
    sw a0, s0, 4

    lw a0, s0, 8
    addi a0, a0, 1
    
    li t0, 1
    ecall

    sw a0, s0, 8
    
    ret