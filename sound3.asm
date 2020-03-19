!to "sound3.prg", cbm
!cpu 65c02
*=$0801
!byte $0C,$08,$0A,$00,$9E,' ','2','0','6','4',$00,$00,$00
*=$0810

;Constants
YM_REG          = $9FE0
YM_DATA         = $9FE1
SETTIM		= $FFDB
RDTIM		= $FFDE

        lda #$27 ;Channel 7
        sta YM_REG
        lda #%11000111 ;L/R enable, No feedback, Algorithm 7
        sta YM_DATA

        lda #$0F ;Noise Enable/Noise Freq
        lda #%10010000 ;Enable / 3580KHz/(32*1)
        sta YM_DATA

        lda #$9F ;Attack
        sta YM_REG
        lda #$19 ;Attack rate = 25
        sta YM_DATA

        lda #$FF ;Sustain/Release rate
        sta YM_REG
        lda #$13 ;Sustain = 1 / RR = 3
        sta YM_DATA

        
        lda #$08
        sta YM_REG
        sta YM_DATA

        lda #0
        jsr SETTIM
delay:  jsr RDTIM
        cmp #30
        bne delay:

        stz YM_DATA

        rts
