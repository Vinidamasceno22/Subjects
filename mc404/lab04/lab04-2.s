main:
    # Le um caractere
    li t0, 5
    ecall

    # Transforma em minusculo
    mv s0, a0
    addi s0, s0, 32

    # Imprime 
    mv a0, s0
    li t0, 2
    ecall
    ret