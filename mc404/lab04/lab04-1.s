# Le e imprime o numero lido do teclado (funciona para negativos, pois nao foi feito nenhuma operacao)
main:
    # Le um numero do teclado
    li t0, 4
    ecall

    # Imprime o numero lido
    li t0, 1
    ecall
    ret