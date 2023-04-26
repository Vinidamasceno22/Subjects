# Le dois numeros e imprime o maior, para a execucao quando um deles for 0
main:
    # Le um numero do teclado e armazena em s0
    addi t0, zero, 4
    ecall
    add s0, a0, zero

    # Le um numero do teclado e armazena em a0
    addi t0, zero, 4
    ecall

    beq s0, zero, fim
    beq a0, zero, fim
    bge a0, s0, imprimir

    # Guarda s0 em a0
    add a0, s0, zero

imprimir:
    # Imprima o valor de a0 na tela
    addi t0, zero, 1
    ecall

    # Va novamente para o main e recomece a execucao
    j main

fim:
    ret