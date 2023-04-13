main:
    # le um numero do teclado
  addi t0, zero, 4
  ecall    
    # subtrai 10 do numero lido 
  addi a0, a0, -10
    # guarda a0 em s0
    add s0,zero, a0
    # verifica se s0 e maior ou igual a 0
  bge s0, zero, print
    # transforma o negativo em positivo
  sub s0, zero, s0
    # imprime o -
  addi a0, zero, 45
  addi t0, zero, 2
  ecall
print:
    # imprime o resultado
  add a0, zero, s0
  addi t0, zero, 1
  ecall 
  ret