; =============================================================================   
; TITLE    : KABOOM GAME
; AUTHOR   :
; CREATION :
; =============================================================================

            ORG     $1000

; --- CODE INCLUDES -----------------------------------------------------------

            INCLUDE "SYSCONST.X68"          ; SYSTEM CONSTANTS
            INCLUDE "SYSTEM.X68"            ; SYSTEM CODE
            INCLUDE "CONST.X68"             ; USER CONSTANTS
            INCLUDE "UTIL.X68"              ; UTILITY MACRO AND SUBROUTINES
            INCLUDE "PLAYER.X68"            ; PLAYER MANAGEMENT
            INCLUDE "BOMBMAN.X68"           ; BOMBMAN MANEGEMENT
            INCLUDE "AGENTLST.X68"          ; AGENT LIST MANAGEMENT
            INCLUDE "BOMB.X68"              ; BOMB AGENT MANAGEMENT
            INCLUDE "SPAWNER.X68"           ; SPAWNER (CREATES BOMBS)
            INCLUDE "BACKGROUND.X68"        ; BACKGROUND MANAGEMENT
            INCLUDE "STATES.X68"            ; GAME STATES MANAGEMENT
            

; --- INITIALIZE --------------------------------------------------------------
            

START       JSR     SYSINIT
            JSR     STAINIT                 ; INITIALIZE GAME STATE
            

; --- UPDATE ------------------------------------------------------------------

.LOOP       TRAP    #KBDTRAP                ; READ KEYBOARD
            MOVE.L  STATE,A2
            JSR     (A2)


; --- WAIT SYNCH --------------------------------------------------------------

.WINT       TST.B   (SCRINTCT)              ; WAIT FOR INTERRUPT
            BEQ     .WINT
            CLR.B   (SCRINTCT)
            
        
; --- PLOT --------------------------------------------------------------------

            JSR      STAPLOT
            TRAP    #SCRTRAP                ; SHOW GRAPHICS
            BRA     .LOOP
            SIMHALT

; --- VARIABLES ---------------------------------------------------------------

            INCLUDE "SYSVAR.X68"
            INCLUDE "VAR.X68"
            END    START




























*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
