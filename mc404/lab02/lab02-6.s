# le um numero, subtrai 10 dele e imprime o resultado
main:
    # le um numero do teclado
    addi t0, zero, 4
    ecall   

    # subtrai 10 do numero lido 
    addi a0, a0, -10 
    
    # verifica se o numero e positivo
    bge a0, zero, positivo
    
    # imprime o sinal negativo e ajusta o numero
    add s0, a0, zero

    addi a0, zero, 45
    addi t0, zero, 2
    ecall

    sub a0, zero, s0

positivo:
    # imprime o resultado
    addi t0, zero, 1
    ecall 
    ret