; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $0, %A
movw (%A), %D
subw %D, $1, %D
leaw $2, %A
movw %D, (%A)
leaw $3, %A
movw %D, (%A)
LOOP:
leaw $2, %A
movw (%A), %D
leaw $ELSE1, %A
jne %D
nop
leaw $3, %A
movw (%A), %D
leaw $ELSE0, %A
jne %D
nop
leaw $END0, %A
jmp
nop
ELSE0:
leaw $3, %A
subw (%A), $1, %D
movw %D, (%A)
leaw $2, %A
movw %D, (%A)
END0:
leaw $END1, %A
jmp
nop
ELSE1:
leaw $0, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
movw %D, (%A)
leaw $2, %A
subw (%A), $1, %D
movw %D, (%A)
END1:
jmp
nop