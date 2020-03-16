!to "sound.prg", cbm
!cpu 65c02
*=$0801
!byte $0C,$08,$0A,$00,$9E,' ','2','0','6','4',$00,$00,$00
*=$0810

YM_REG=$9FE0
YM_DATA=$9FE1
CHAN=$20
CHAN1=$21
CHAN2=$22
CHAN3=$23


!byte $FF
;Reset sound chip
        ldy #0

reset:  cpy #255
        beq sound
        sty YM_REG
        stz YM_DATA
        iny
        jmp reset

sound:
;Enable L/R
        ldx CHAN
        stx YM_REG
        ldx #$D7
        stx YM_DATA
;Set FREQUENCY
        ldx #$28
        stx YM_REG
        ldx #76
        stx YM_DATA
;Set VOLUME
        ldx #$60
        stx YM_REG
        ldx #$07
        stx YM_DATA
;Set ATTACK
        ldx #$80
        stx YM_REG
        ldx #$FF
        stx YM_DATA
;Set RELEASE
        ldx #$E0
        stx YM_REG
        ldx #$05
        stx YM_DATA
;Note on
        ldx #$08
        stx YM_REG
        stx YM_DATA

        rts
Channel !byte $20,$21,$22,$23
