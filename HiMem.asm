*=$0801
!byte $0C,$08,$0A,$00,$9E,' ','2','0','6','4',$00,$00,$00
*=$0810

BANK = $9F61
MEM = $A000

!byte $FF
  lda #"a"
  sta MEM
  inc BANK
  lda #"b"
  sta MEM
  dec BANK
  lda MEM
  inc BANK
  lda MEM
  rts
