; =============================================================================
; BOMB MANAGEMENT. IT IS AN AGENT.
; LOCAL MEMORY IS:
; +0 WORD X COORDINATE
; +2 WORD Y COORDINATE
; +4 WORD X SPEED
; +6 WORD Y SPEED
; =============================================================================

; -----------------------------------------------------------------------------
BOMBINIT
; INITALIZES A BOMB 
; INPUT    - A0 POINTER TO THE LOCAL MEMORY
; OUTPUT   - NONE
; MODIFIES - NONE
; NOTE     - ASSUMES SCRHEIGH IS GREATER THAN 255
; -----------------------------------------------------------------------------
            MOVEM.W  D0,-(A7)
            MOVE.W  (BMNPOSX),(A0)         ; X POSITION 
            MOVE.W  (BMNPOSY),D0   
            ADD.W    #BOMBSIZE,D0                 
            MOVE.W   D0,2(A0)              ; Y POSITION           
            MOVE.W   #0,4(A0)              ; X SPEED 
            MOVE.W   #7,6(A0)              ; Y SPEED 
            MOVEM.W  (A7)+,D0
*            UTLSND .CATCH
            RTS
*.CATCH      DC.L 'SOUND/BOMBEXPLODES.WAV',0
; -----------------------------------------------------------------------------
BOMBUPD
; UPDATES A BOMB 
; INPUT    - A0 POINTER TO THE LOCAL MEMORY
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.W  D0-D1,-(A7)
            MOVE.W  4(A0),D0                ; UPDATE COORDINATES
            SUB.W   D0,(A0)
            MOVE.W  6(A0),D0
            ADD.W   D0,2(A0)
.COLPLAY    MOVE.W  (A0),D0                 ;CHECK IF THE BOMOB HIT THE PLAYER
            MOVE.W  2(A0),D1
            MOVE.W  #BOMBSIZE,D4
            MOVE.W  D4,D6
            MOVE.W  (PLRPOSX),D2
            MOVE.W  (PLRPOSY),D3
            MOVE.W  #PLRWIDTH,D5
            MOVE.W  #PLRHEIGH,D7
            JSR     UTLCHCOL
            TST.B   D0
            BEQ     .DMG                    
            JSR     AGLKILL                 ;THE PLAYER CATCH THE BOMB
            UTLSND .CATCH   
            ADD.W   #BOMBSCORE,(PLRSCORE)  
.END        MOVEM.W  (A7)+,D0-D1
            RTS
.DMG        MOVE.W  2(A0),D0                ;THE PLAYER DONT CATCH THE BOMB AND EXPLOTE
            MOVE.W  PLRPOSY,D1
            ADD.W  #PLRHEIGH,D1
            CMP     D1,D0
            BMI     .END
            SUB.W   #BOMBDMG,PLRLIFE
            UTLSND .EXPLODE    
            JSR     AGLKILL        
            BRA   .END  
.EXPLODE    DC.L 'SOUND/BOMBEXPLODES.WAV',0            
.CATCH      DC.L 'SOUND/PING.WAV',0
; -----------------------------------------------------------------------------
BOMBPLOT
; PLOTS A BOMB 
; INPUT    - A0 POINTER TO THE LOCAL MEMORY
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            UTLSPEN #BOMBPENCL
            UTLSFIL #BOMBFILCL
            MOVEM.W D1-D6,-(A7)             ;DRAW ELIPSE
            MOVE.W  (A0),D1
            MOVE.W  2(A0),D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BOMBSIZE,D3
            ADD.W   #BOMBSIZE,D4
            MOVE.B  #88,D0
            TRAP    #15
            MOVE.W  (A0),D1                 ;DRAW RECTANGLE
            ADD.W   #10,D1
            
            MOVE.W  2(A0),D5
            SUB.W   #2,D5
            MOVE.W  D5,D2
            
            MOVE.W  (A0),D6
            ADD.W   #20,D6
            MOVE.W  D6,D3
            
            ADD.W   #6,D5
            MOVE.W  D5,D4
            
            MOVE.B  #87,D0
            TRAP    #15
            
            UTLSPEN #WICKPENCL
            UTLSFIL #WICKFILCL

            MOVE.W  (A0),D1                 ;DRAW WICK
            ADD.W   #13,D1
            
            MOVE.W  2(A0),D5
            SUB.W   #6,D5
            MOVE.W  D5,D2
            
            MOVE.W  (A0),D6
            ADD.W   #17,D6
            MOVE.W  D6,D3
            
            ADD.W   #3,D5
            MOVE.W  D5,D4
            
            MOVE.B  #87,D0
            TRAP    #15
            
            UTLSPEN #FIREPENCL
            UTLSFIL #FIREFILCL
    
            MOVE.W  (A0),D1                 ;DRAW FIRE WICK
            ADD.W   #17,D1
            
            MOVE.W  2(A0),D5
            SUB.W   #10,D5
            MOVE.W  D5,D2
            
            MOVE.W  (A0),D6
            ADD.W   #21,D6
            MOVE.W  D6,D3
            
            ADD.W   #3,D5
            MOVE.W  D5,D4
            
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVEM.W (A7)+,D1-D6
            RTS






















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
