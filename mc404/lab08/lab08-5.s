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

# Recebe dois endereços de duas strings e retorna 0 se elas forem iguais, um valor negativo se a primeira for menor e um valor positivo se a primeira for maior
strcmp:
    lbu t0, 0(a0)
    lbu t1, 0(a1)
    bne t0, t1, diferente
    beq t0, zero, igual
    addi a0, a0, 1
    addi a1, a1, 1
    j strcmp
# Retorna a comparação
igual:
    li a0, 0
    j fim_strcmp
diferentes:
    sub a0, t0, t1
fim_strcmp:
    ret

# Recebe o endereço de duas strings concatena a segunda na primeira e retorna o endereço
strcat:
    mv t0, a0
# Move para o fim da primeira string em t0
while_str1:
    lbu t1, 0(t0)
    beq t1, zero, while_str2
    addi t0, t0, 1
    j while_str1

# Adiciona os elementos da segunda string a partir de t0
while_str2:
    lbu t1, 0(a1)
    sb t1, 0(t0)
    addi t0, t0, 1
    addi a1, a1, 1
    bne t1, zero, while_str2

# Retorna o endereço da primeira string
fim_strcat:
    ret