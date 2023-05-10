# Recebe um endereço e um numero máximo de caractere, lê uma string do teclado e retorna o endereço da string 
fgets:
    # Guarda os registradores na pilha
    addi sp, sp, -12
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)

    # Salva o endereço e contadores
    mv s0, a0
    mv s1, a1
    mv s2, a0

    # Começa a ler do teclado
    li a0, 0x130
    ecall

# Lê a string enquanto não acabar ou não atingir o numero máximo de caracteres
while:
    li a0, 0x131
    ecall
    addi a0, a0, -1
    blt a0, zero, fim
    blt zero, a0, ler
    j while

# Guarda o caractere lido no endereço em s2
ler:
    beq s1, zero, fim
    sb a1, 0(s2)
    addi s2, s2, 1
    addi s1, s1, -1
    j while

# Adiciona o \0 e devolve o endereço inicial
fim:
    sb zero, 0(s2)
    mv a0, s0
    
    # Retorna o valor dos registradores salvos na pilha
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    addi sp, sp, 12

    ret


    