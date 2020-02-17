*=$0801
!byte $0C,$08,$0A,$00,$9E,' ','2','0','6','4',$00,$00,$00
*=$0810

CHAROUT = $FFD2
TMP0 = $00
TMP1 = $01


        ldx #<Text
        ldy #>Text
        stx TMP0
        sty TMP1

        ldy #0

loop    !byte $FF
        lda (TMP0), Y
        cmp #0
        beq slut
        jsr CHAROUT
        iny
        jmp loop

slut    rts


Text !pet "hej 5. s.b.",0
