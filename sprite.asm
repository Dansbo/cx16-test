*=$0801
!byte $0C,$08,$0A,$00,$9E,' ','2','0','6','4',$00,$00,$00
*=$0810

VERA_CTRL = $9F25
VERA_LOW = $9F20
VERA_MID = $9F21
VERA_HI = $9F22
VERA_DATA = $9F23

        lda #0
        sta VERA_CTRL   ;Choosing Data register 0
        jsr Load
        jsr Enable

        rts             ;End program

;************************************************************************
;Enable sprite
;************************************************************************
Enable: lda #0
        sta VERA_LOW
        lda #$40
        sta VERA_MID
        lda #$1F
        sta VERA_HI
        lda #1
        sta VERA_DATA

        lda #0
        sta VERA_LOW
        lda #$50
        sta VERA_MID
        lda #$1F
        sta VERA_HI
        lda #0
        sta VERA_DATA
        lda #$82
        sta VERA_DATA
        lda #0
        sta VERA_DATA
        sta VERA_DATA
        sta VERA_DATA
        sta VERA_DATA
        lda #$F
        sta VERA_DATA
        lda #$50
        sta VERA_DATA

        rts






;************************************************************************
;Load sprite into VRAM
;************************************************************************
Load:   sta VERA_LOW
        lda #$40
        sta VERA_MID
        lda #$10
        sta VERA_HI
        ldy #0

Loop:   lda SPRITE0,y
        sta VERA_DATA
        dey
        bne Loop:
        rts

;************************************************************************
;Sprite graphics
;************************************************************************
SPRITE0 !byte   16,16,16,16,16,16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        !byte   16,38,38,38,38,38,16, 0, 0, 0, 0, 0, 0, 0, 0, 0
        !byte   16,50,50,50,50,38,16, 0, 0, 0, 0, 0, 0, 0, 0, 0
        !byte   16,50,50,50,38,16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        !byte   16,50,50,50,50,38,16, 0, 0, 0, 0, 0, 0, 0, 0, 0
        !byte   16,50,16,16,50,50,38,16, 0, 0, 0, 0, 0, 0, 0, 0
        !byte   0, 16,16, 0,16,50,50,38,16, 0, 0, 0, 0, 0, 0, 0
        !byte   0, 0, 0, 0, 0, 16,50,50,38,16, 0, 0, 0, 0, 0, 0
        !byte   0, 0, 0, 0, 0, 0, 16,50,50,38,16, 0, 0, 0, 0, 0
        !byte   0, 0, 0, 0, 0, 0, 0, 16,50,16, 0, 0, 0, 0, 0, 0
        !byte   0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0
        !byte   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        !byte   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        !byte   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        !byte   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        !byte   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
