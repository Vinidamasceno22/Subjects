# testa overflow com 2048
main:
    addi s0, zero, 1        # s0 = 0 + 1
    addi s1, zero, 2048        # s1 = 0 - 2048 causa overflow se não for tratado com unsigned
    add  s2, s1, s0         # s2 = s1 + s0 
    ret