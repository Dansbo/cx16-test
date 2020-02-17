*=$0801
!byte $0C,$08,$0A,$00,$9E,' ','2','0','6','4',$00,$00,$00
*=$0810

SKRIV = $FFD2
TMP0 = $00
TMP1 = $01
STTID = $FFDB
LSTID = $FFDE

        lda #147
        jsr SKRIV                ;Ryd skærmen

        ldx #<Tekst              ;Lad X være start af Tekst
        ldy #>Tekst
        stx TMP0
        sty TMP1

        ldy #0

loop    lda (TMP0), Y
        cmp #0
        beq slut
        jsr SKRIV
        lda #0
        jsr STTID
pause   jsr LSTID
        cmp #20
        bne pause
        iny
        jmp loop

slut    rts


Tekst !pet "hej 5. s.b.",13,"hvor er det dejligt jeg kan vise jer mit spil",0
