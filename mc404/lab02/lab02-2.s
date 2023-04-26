# Pede numeros do teclado e imprime seu valor +2, para apos ler o numero 0 imprimir seu resultado
main:
    # Le um numero do teclado e armazena em a0
    addi t0, zero, 4
    ecall
    
    # Guarda o valor de a0 em s0
    add s0, a0, zero
    
    # Soma 2 ao valor de a0
    addi a0, a0, 2

    # Imprima o valor de a0 na tela
    addi t0, zero, 1
    ecall

    # Se o valor lido for diferente de zero, va para o inicio
    bne s0, zero, main
    ret