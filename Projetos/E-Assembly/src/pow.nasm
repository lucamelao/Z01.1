; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

leaw $1, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)
LOOP:
leaw $2, %A
movw (%A), %D
leaw $ELSE, %A
jne %D
nop
leaw $END, %A
jmp
nop
ELSE:
leaw $1, %A
movw (%A), %D
leaw $0, %A
addw %D, (%A), %D
movw %D, (%A)
leaw $2, %A
subw (%A), $1, %D
movw %D, (%A)
END:
jmp
nop