.ORIG x3000

;Prints message "Input a 2 digit decimal number:"
readS LEA R0, MESSAGE   ;Loads the adress of the string MESSAGE
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
TRAP x25                ;HALT

MESSAGE .STRINGZ "Input a 2 digit decimal number:"
MINUS .FILL #-48
.END