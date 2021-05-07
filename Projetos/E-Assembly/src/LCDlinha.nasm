; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe uma linha no LCD

leaw $20, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $16383, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)
LOOP:
leaw $1, %A
movw (%A), %D
addw %D, $1, %D
movw %D, (%A)
movw %D, %A
movw $-1, (%A)
leaw $0, %A
movw (%A), %D
subw %D, $1, %D
movw %D, (%A)
leaw $LOOP, %A
jg %D
nop

