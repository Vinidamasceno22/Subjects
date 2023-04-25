main:
    # Le um num do teclado
    li t0, 4
    ecall

    # Salva o num em s0
    mv s0, a0

    # Imprime o num em s0
    mv a0, s0
    li t0, 1
    ecall
    
    ret