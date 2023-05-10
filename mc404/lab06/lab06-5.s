.data
operacao:
    .word 43
    .word 44
    .word 45
    .word 52
.text
# Recebe dois numeros e retorna sua soma
soma:
    add a0, a0, a1
    ret

# Recebe dois numeros e retorna a subtracao do primeiro pelo segundo
subt:
    sub a0, a0, a1
    ret
# Le dois numeros e uma operacao do teclado e imprime o resultado
main:
    # Salva o valor dos registradores
    addi sp, sp, -16
    sw ra, sp, 0
    sw s0, sp, 4
    sw s1, sp, 8
    sw s2, sp, 12

    # Carrega a operacao em s0
    lui s0, %hi(operacao)
    addi s0, s0, %lo(operacao)

    # Le um inteiro e saklva em s1
    li t0, 4
    ecall
    mv s1, a0

    # Le um caracter e salva em s2
    li t0, 5
    ecall
    mv s2, a0

    # Le um inteiro e salva em a0
    li t0, 4
    ecall

    # Ajusta os parametros para a funcao
    mv a1, a0
    mv a0, s1

    # Verifica a operacao
    lw t0, s0, 0

    # Chama a funcao adequada
    beq s2, t0, chama_soma
    lw t1, s0, 12
    jalr ra, t1, 0
    j fim
chama_soma:
    lw t1, s0, 4
    jalr ra, t1, 0

# Imprime o resultado
fim:
    bge a0, zero, imprimir
    mv s1, a0
    li a0, 45
    li t0, 2
    ecall
    mv a0, s1 
    sub a0, zero, a0
imprimir:
    li t0, 1
    ecall

    # Retorna os valores salvos
    lw ra, sp, 0
    lw s0, sp, 4
    lw s1, sp, 8
    lw s2, sp, 12
    addi sp, sp, 16
    ret
