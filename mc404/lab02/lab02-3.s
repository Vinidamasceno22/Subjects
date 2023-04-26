# Pede numeros do teclado e imprime seu valor +2, para apos ler o numero 0
main:
    # Le um numero do teclado e armazena em a0
    addi t0, zero, 4
    ecall

    # Se o valor lido for 0 pare a execucao
    beq a0, zero, fim

    # Soma 2 ao valor de a0
    addi a0, a0, 2

    # Imprima o valor de a0 na tela
    addi t0, zero, 1
    ecall

    # Va novamente para o main e recomece a execucao
    j main

fim:
    ret