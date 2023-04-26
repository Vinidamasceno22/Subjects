# soma dois inteiros
main:
    addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
    ecall              # efetua a operacao de leitura de inteiro

    add s0, a0, zero   # move a0 para s0

    addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
    ecall              # efetua a operacao de leitura de inteiro

    add a0, a0, s0     # soma a0 e s0
    
    addi t0, zero, 1   # escolhe a operacao de escrita de inteiro (1)
    ecall              # efetua a operacao de escrita de inteiro