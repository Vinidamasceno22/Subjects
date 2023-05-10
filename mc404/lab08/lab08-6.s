.data
    str: .space 21
.text
# Lê uma string do teclado e a imprime invertida
main:
    # Guarda os registradores na pilha
    addi sp, sp, -4
    sw ra, 0(sp)

    # Lê uma string do teclado com no máximo 20 caracteres
    la a0, str
    li a1, 20
    call fgets

    # Inverte a string
    call strrev

    # Imprime uma string
    mv a1, a0
    li a0, 4
    ecall

    # Imprime uma quebra de linha
    li a0, 11
    li a1, 13
    ecall

    # Retorna o valor dos registradores salvos na pilha
    lw ra, 0(sp)
    addi sp, sp, 4
    
    # Encerra o programa
    li a0, 10
    ecall
# Recebe o endereço de uma string e inverte a posição de seus elementos
strrev:
    # Guarda os registradores na pilha
    addi sp, sp, -8
    sw ra, 0(sp)
    sw s0, 4(sp)

    # Guarda o tamanho da string
    mv s0, a0
    call strlen

    mv t0, s0
    add t1, s0, a0
    addi t1, t1, -1

# Inverte os elementos de posições opostas da string
while_strrev:
    bge t0, t1, fim_strrev
    
    lbu t2, 0(t0)
    lbu t3, 0(t1)
    sb t2, 0(t1)
    sb t3, 0(t0)

    addi t0, t0, 1
    addi t1, t1, -1
    j while_strrev

fim_strrev:
    # Retorna o endereço da string
    mv a0, s0

    # Retorna o valor dos registradores salvos na pilha
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8
    ret

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

# Recebe um endereço de uma string e retorna o numero de caracteres
strlen:
    li t0, 0
# Avança na string até encontrar um caractere '\0'
while:
    lbu t1, 0(a0)
    beq t1, zero, fim_strlen
    addi t0, t0, 1
    addi a0, a0, 1
    j while

# Retorna o numero de caracteres
fim_strlen:
    mv a0, t0
    
    ret