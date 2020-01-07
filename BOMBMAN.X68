; =============================================================================
; BOMBMAN MANAGEMENT
; =============================================================================

; -----------------------------------------------------------------------------
BMNINIT
; INITIALIZES THE BOMBMAN
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVE.W  #SCRWIDTH/2,(BMNPOSX)
            MOVE.W  #(BMNHEIGH)-35,(BMNPOSY)
            MOVE.W  #129,(BMNDIR)
            CLR     (BMNSPEEDB)
            MOVE.W  #9,BMNSPEED            ;INICIALIZE TEH BOMB SPEED     
            RTS

; -----------------------------------------------------------------------------
BMNUPD
; UPDATES THE BOMBMAN MOTION
; INPUT    - NONE 
; OUTPUT   - NONE (MODIFIES BOMBMAN DATA)
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVE.W  (PLRSCORE),D1           ;CHECK IF THE PLAYER HAS 50 POINTS TO INCREASE THE BOMBMAN SPEED    
            CMP.W   #50,D1
            BNE     .SKIP
            TST.W   (BMNSPEEDB)
            BNE     .SKIP
            MOVE.B  #1,(BMNSPEEDB)
            ADDQ.W  #5,BMNSPEED 
                                
.SKIP       MOVE.B  (SCRCYCCT),D1
            AND     #$20,D1                 
            BNE     .ENDCICLE               ; NEW DIRECTION
            JSR     UTLRAND
            MOVE.W  (BMNPOSX),D1            ;BMNDIR=(BMNPOSX*128)/((SCRWIDTH)/2)
            MULU.W  #128,D1
            DIVU.W  #320,D1
            MOVE.W  D1,D2
            SWAP    D2
            MULU.W  #320,D2
            ADD.W   D2,D1
            MOVE.W  D1,(BMNDIR)             
.ENDCICLE                                    
            CMP.W   (BMNDIR),D0
            BGE     .CHKRT
            MOVE.W BMNSPEED,D3
            SUB.W   D3,(BMNPOSX)
            TST.W   (BMNPOSX)
            BGE     .END
            CLR.W   (BMNPOSX)
            JMP     .END
.CHKRT      MOVE.W BMNSPEED,D3
            ADD.W   D3,BMNPOSX
            CMP     #SCRWIDTH-BMNWIDTH,(BMNPOSX)
            BLE     .END
            MOVE.W  #SCRWIDTH-BMNWIDTH,(BMNPOSX)
.END        
            RTS

; -----------------------------------------------------------------------------
BMNPLOT
; PLOTS THE BOMBMAN 
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0-D4,-(A7)      
            
                                            ; PLOT THE BOMBMAN
            UTLSPEN #BMNSKINCL
            UTLSFIL #BMNSKINCL
                                             
            MOVE.W  (BMNPOSX),D1            ; PLOT LEFT HAND
            ADD.W   #5,D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #75,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNHANDW,D3
            ADD.W   #BMNHANDH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVE.W  (BMNPOSX),D1            ; PLOT RIGTH HAND
            ADD.W   #35,D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #75,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNHANDW,D3
            ADD.W   #BMNHANDH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVE.W  (BMNPOSX),D1            ; PLOT NECK
            ADD.W   #20,D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #21,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNNECKW,D3
            ADD.W   #BMNNECKH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVE.W  (BMNPOSX),D1            ; PLOT HEAD
            ADD.W   #15,D1
            MOVE.W  (BMNPOSY),D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNHEADW,D3
            ADD.W   #BMNHEADH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            UTLSPEN #BMNNRMCL
            UTLSFIL #BMNNRMCL
            
            MOVE.W  (BMNPOSX),D1            ; PLOT BODY
            MOVE.W  (BMNPOSY),D2
            ADD.W   #25,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNBODYW,D3
            ADD.W   #BMNBODYH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVE.W  (BMNPOSX),D1            ; PLOT BODY NECK
            ADD.W   #10,D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #23,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNBDYNCKW,D3
            ADD.W   #BMNBDYNCKH,D4
            MOVE.B  #87,D0
            TRAP    #15
            

            UTLSPEN #BMNLINECL
            UTLSFIL #BMNLINECL
            
            MOVE.W  (BMNPOSX),D1            ; PLOT LINES
            MOVE.W  (BMNPOSY),D2
            ADD.W   #25,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNLINEW,D3
            ADD.W   #BMNLINEH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVE.W  (BMNPOSX),D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #40,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNLINEW,D3
            ADD.W   #BMNLINEH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVE.W  (BMNPOSX),D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #55,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNLINEW,D3
            ADD.W   #BMNLINEH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVE.W  (BMNPOSX),D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #70,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNLINEW,D3
            ADD.W   #BMNLINEH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVE.W  (BMNPOSX),D1            ; PLOT ARMS
            ADD.W   #9,D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #35,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNARMW,D3
            ADD.W   #BMNARMH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVE.W  (BMNPOSX),D1
            ADD.W   #40,D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #35,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNARMW,D3
            ADD.W   #BMNARMH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVE.W  (BMNPOSX),D1            ; PLOT MASK
            ADD.W   #13,D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #5,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNMASKW,D3
            ADD.W   #BMNMASKH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            UTLSPEN #BMNNRMCL
            UTLSFIL #BMNNRMCL
                                            ; PLOT EYES
            MOVE.W  (BMNPOSX),D1            ; LEFT EYE
            ADD.W   #18,D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #5,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNEYEW,D3
            ADD.W   #BMNEYEH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVE.W  (BMNPOSX),D1            ; RIGTH EYE
            ADD.W   #27,D1
            MOVE.W  (BMNPOSY),D2
            ADD.W   #5,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BMNEYEW,D3
            ADD.W   #BMNEYEH,D4
            MOVE.B  #87,D0
            TRAP    #15

            MOVEM.L (A7)+,D0-D4
            RTS












*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
