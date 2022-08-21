.ORIG x3000

;reads a 2 digit decimal number using the function “readS” then checks if the number is 
;prime or not using the function “isPrime” and then shows on the display a message that 
;says if the number was prime or not by using the function “resultS”.
AND R5,R5,#0            ;Zero register R5
JUMP JSR readS          ;Runs readS subroutine
JSR sPrime              ;Runs sPrime subroutine
JSR resultS             ;Runs resultS subroutine
LD R0, ENDLINE          ;Load value for ENDLINE
PUTc                    ;Prints char in R0
ADD R5,R5,#0            ;Adds #0 to R5
BRz JUMP                ;Branch to LOOP


;readS
readS ST R1, SaveR1     ;Save R1
ST R2, SaveR2           ;Save R2
ST R3, SaveR3           ;Save R3
ST R4, SaveR4           ;Save R4
ST R5, SaveR5           ;Save R5
LEA R0, MESSAGE         ;Loads the adress of the string MESSAGE
TRAP x22                ;Prints the MESSAGE string to the console
;Clears registers
AND R1,R1,#0            ;Clears register R1
AND R2,R2,#0            ;Clears register R2
ADD R2,R2,#2            ;Sets register R2 to 2
AND R3,R3,#0            ;Clears register R3
AND R4,R4,#0            ;Clears register R4
AND R5,R5,#0            ;Clears register R5
;Reads and echos diget value from console and converts it to numeric
DIGETLOOP TRAP x23      ;Reads a character from console with echo into R0
LD R6, MINUS            ;Loads MINUS into R6
ADD R0,R0,R6            ;Adds R6 to R0 and stores it in R0
ADD R1,R2,#-2           ;Adds -2 to R2 and stores it in R1
BRnp NOTFIRST           ;If result it positive or negative branch to NOTFIRST
;Multiplies first diget value by 9 using a loop
MULTIPLY ADD R3,R3,R0   ;Adds R0 to R3 and stores it in R3
ADD R4,R4,#1            ;Adds 1 to R4 and stores it in R4
ADD R5,R4,#-9           ;Adds -9 to R4 and stores it in R5
BRnp MULTIPLY           ;If result it positive or negative branch to MULTIPLY
;Adds up diget value to register R3 and loops again
NOTFIRST ADD R3,R3,R0   ;Adds R0 to R3 and stores it in R3
ADD R2,R2,#-1           ;Adds -1 to R2 and stores it in R2
BRnp DIGETLOOP          ;If result it positive or negative branch to DIGETLOOP
;Clears R0 and adds the diget value content from R3
AND R0,R0,#0            ;Clears register R0
ADD R0,R0,R3            ;Adds R3 to R0 and stores it in R0
LD R1, SaveR1           ;Restore R1
LD R2, SaveR2           ;Restore R2
LD R3, SaveR3           ;Restore R3
LD R4, SaveR4           ;Restore R4
LD R5, SaveR5           ;Restore R5
RET                     ;Return


;sPrime
sPrime ST R1, SaveR1    ;Save R1
ST R2, SaveR2           ;Save R2
ST R3, SaveR3           ;Save R3
ST R4, SaveR4           ;Save R4
AND R1, R1, #0          ;Zero register R1
ADD R1, R1, #2          ;ADDs #2 to R1 and stores the value in R1
ADD R2, R0, #-1         ;ADDs #-1 to R0 and stores the value in R2
BRnz NOPRIME            ;Branch to NOPRIME if zero or negative (if R0 is 0 or 1)
ADD R1, R1, #-1         ;ADDs #-1 to R1 and stores the value in R1
OUTER ADD R1, R1 #1     ;ADDs #1 to R1 ans stores the value in R1
AND R2, R2, #0          ;Zero register R2
ADD R2, R2, R0          ;ADDs R0 to R2 and stores the value in R2
NOT R3, R1              ;NOT on R1, saves in R3
ADD R3, R3, #1          ;ADDs #1 to R3 and stores the value in R3
ADD R4, R0, R3          ;ADDs R3 to R0 and stores the value in R4
BRz PRIME               ;Branch to PRIME if result is zero
INNER ADD R2, R2, R3    ;ADDs R3 to R3 and stores the value in R2
BRz NOPRIME             ;Branch to NOPRIME if result is zero
BRp INNER               ;Branch to INNER if result is positive (inner loop for division)
ADD R4, R4, #0          ;ADDs #1 to R4 and stores the value in R4
BRp OUTER               ;Branch to OUTER if result is positive (outer loop for trying factors)
PRIME AND R0, R0, #0    ;Zero register R0
ADD R0, R0, #1          ;ADDs 1# to R0 and stores the value in R0 (no factors worked, thus prime)
LD R1, SaveR1           ;Restore R1
LD R2, SaveR2           ;Restore R2
LD R3, SaveR3           ;Restore R3
LD R4, SaveR4           ;Restore R4
RET                     ;Return
NOPRIME AND R0, R0, #0 ;Zero register R0 (NOTPRIME if a factor added up to 0, thus not prime)
LD R1, SaveR1           ;Restore R1
LD R2, SaveR2           ;Restore R2
LD R3, SaveR3           ;Restore R3
LD R4, SaveR4           ;Restore R4
RET                     ;Return


;resultS
resultS ST R1, SaveR1   ;Save R1
AND R1,R1,#0            ;Zeros register R1
ADD R1,R0,#0            ;ADDs #0 to R0 and stores the value in R1
BRz ZERO                ;Branch to ZERO if result was 0
LEA R0,ISPRIME          ;Loads the address of the ISPRIME string into R0
TRAP x22                ;PUTS prints the ISPRIME string to the console
LD R1, SaveR1           ;Restore R1
RET                     ;Return
ZERO LEA R0,NOTPRIME    ;Loads the address of the NOTPRIME string into R0
TRAP x22                ;PUTS prints the NOTPRIME string to the console
LD R1, SaveR1           ;Restore R1
RET                     ;Return


SaveR1 .BLKW 1          ;save R1
SaveR2 .BLKW 1          ;save R2
SaveR3 .BLKW 1          ;save R3
SaveR4 .BLKW 1          ;save R4
SaveR5 .BLKW 1          ;save R5
MESSAGE .STRINGZ "Input a 2 digit decimal number:"
ISPRIME .STRINGZ "The number is prime"
NOTPRIME .STRINGZ "The number is not prime"
ENDLINE .FILL x0A       ;ASCII code for x0A
MINUS .FILL #-48
.END