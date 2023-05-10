.text
# Le uma string do teclado e retorna seu edereço
gets:
    # Guarda os registradores na pilha
    addi sp, sp, -8
    sw s0, 0(sp)
    sw s1, 4(sp)

    # Salva o endereço em s0 e s1
    mv s0, a0 
    mv s1, a0

    # Começa a ler do teclado
    li a0, 0x130
    ecall

# Lê o teclado enquanto não acabar
while:
    li a0, 0x131
    ecall
    addi a0, a0, -1
    blt a0, zero, fim
    blt zero, a0, ler
    j while

# Guarda o caractere lido no endereço
ler:
    sb a1, 0(s1)
    addi s1, s1, 1
    j while

# Adiciona o \0 e retorna o endereço
fim:
    sb zero, 0(s1)
    mv a0, s0
    
    lw s0, 0(sp)
    lw s1, 4(sp)
    addi sp, sp, 8

    ret


    