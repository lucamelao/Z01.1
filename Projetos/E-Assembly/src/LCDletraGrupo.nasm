; Arquivo: LCDletraGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD a letra do grupo de vocês
;  - Valide no hardawre
;  - Bata uma foto!
leaw $16384, %A
movw $-1, (%A)
movw %A, %D
leaw $2, %A
movw %D, (%A)
leaw $14, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $20, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)

LOOP:
leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)
leaw $32769, %A
movw %A, %D
leaw $2, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
subw %D, $1, %D
movw %D, (%A)

leaw $LOOP, %A
jg %D
nop

leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
movw %D, %A
movw $-1, (%A)

leaw $14, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $20, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)
leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)


LOOP2:
leaw $2, %A
movw (%A), %D
leaw $1, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)
leaw $32769, %A
movw %A, %D
leaw $2, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
subw %D, $1, %D
movw %D, (%A)

leaw $LOOP2, %A
jg %D
nop