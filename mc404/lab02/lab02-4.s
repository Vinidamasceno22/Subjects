# Pede numeros do teclado e imprime seu valor +2, para apos a 10 execucao
main:
    # Utiliza s0 como contador
    addi s0, zero, 10

loop:
    # Le um numero do teclado e armazena em a0
    addi t0, zero, 4
    ecall

    # Soma 2 ao valor de a0
    addi a0, a0, 2

    # Imprima o valor de a0 na tela
    addi t0, zero, 1
    ecall

    # Retira um iteracao do contador e retorna ao loop caso ainda nao tenha acabado
    addi s0, s0, -1
    bne s0, zero, loop

    ret