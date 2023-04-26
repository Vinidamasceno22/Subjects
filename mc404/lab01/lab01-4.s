# Pede um numero da entrada e imprime seu valor +2
main:
    addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
    ecall              # efetua a operacao de leitura de inteiro

    add s0, a0, zero   # move a0 para s0

    addi s0, s0, 2     # adiciona 2 a s0

    add a0, s0, zero   # move s0 para a0
    
    addi t0, zero, 1   # escolhe a operacao de escrita de inteiro (1)
    ecall              # efetua a operacao de escrita de inteiro