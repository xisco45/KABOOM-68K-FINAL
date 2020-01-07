; =============================================================================
; BACKGROUND MANAGEMENT
; =============================================================================

; -----------------------------------------------------------------------------
BCKPLOT
; PLOTS THE BACKGROUND
; INPUT     - NONE
; OUTPUT    - NONE
; MODIFIES  - NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0-D4,-(A7)
            UTLSPEN #BCKSKYCL
            UTLSFIL #BCKSKYCL
            
            ; PLOT SKY
            MOVE.W  #0,D1
            MOVE.W  #0,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BCKSKYW,D3
            ADD.W   #BCKSKYH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            UTLSPEN #BCKGRCL
            UTLSFIL #BCKGRCL
            ; PLOT GROUND
            MOVE.W  #0,D1
            MOVE.W  #0,D2
            ADD.W   #BCKSKYH,D2
            MOVE.W  D1,D3
            MOVE.W  D2,D4
            ADD.W   #BCKGRW,D3
            ADD.W   #BCKGRH,D4
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4
            RTS
*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
