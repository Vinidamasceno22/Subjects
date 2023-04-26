# testa as operacoes entre registradores (apenas sub nao pode ser realizada com imediato)
main:
    addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
    ecall              # efetua a operacao de leitura de inteiro

    add s0, a0, zero   # move a0 para s0

    addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
    ecall              # efetua a operacao de leitura de inteiro

    add s1, a0, zero   # move a0 para s1

    add a0, s0, s1     # soma s0 e s1 e salva em a0
    
    addi t0, zero, 1   # escolhe a operacao de escrita de inteiro (1)
    ecall              # efetua a operacao de escrita de inteiro

    sub a0, s0, s1     # subtrai s1 de s0 e guarda em a0

    addi t0, zero, 1   # escolhe a operacao de escrita de inteiro (1)
    ecall              # efetua a operacao de escrita de inteiro

    and a0, s0, s1     # guarda a operacao and bit a bit de s0 e s1 em a0

    addi t0, zero, 1   # escolhe a operacao de escrita de inteiro (1)
    ecall              # efetua a operacao de escrita de inteiro

    or a0, s0, s1      # guarda a operacao or bit a bit de s0 e s1 em a0

    addi t0, zero, 1   # escolhe a operacao de escrita de inteiro (1)
    ecall              # efetua a operacao de escrita de inteiro

    xor a0, s0, s1     # guarda a operacao xor bit a bit de s0 e s1 em a0

    addi t0, zero, 1   # escolhe a operacao de escrita de inteiro (1)
    ecall              # efetua a operacao de escrita de inteiro

    sll a0, s0, s1     # movimenta os bits de s0, s1 casas para a esquerda (multiplica por 2^s1) e guarda em a0

    addi t0, zero, 1   # escolhe a operacao de escrita de inteiro (1)
    ecall              # efetua a operacao de escrita de inteiro

    srl a0, s0, s1     # movimenta os bits de s0, s1 casas para a direita (divide por 2^s1) e guarda em a0

    addi t0, zero, 1   # escolhe a operacao de escrita de inteiro (1)
    ecall              # efetua a operacao de escrita de inteiro