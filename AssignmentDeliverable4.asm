.ORIG x3000

;Takes a value stored in R0 and prints an appropriate 
;message depending on the value being 1 or 0
resultS AND R1,R1,#0    ;Zeros register R1
ADD R1,R0,#0            ;ADDs #0 to R0 and stores the value in R1
BRz ZERO                ;Branch to ZERO if result was 0
LEA R0,ISPRIME          ;Loads the address of the ISPRIME string into R0
TRAP x22                ;PUTS prints the ISPRIME string to the console
TRAP x25                ;HALT the program
ZERO LEA R0,NOTPRIME    ;Loads the address of the NOTPRIME string into R0
TRAP x22                ;PUTS prints the NOTPRIME string to the console
TRAP x25                ;HALT the program

ISPRIME .STRINGZ "The number is prime"
NOTPRIME .STRINGZ "The number is not prime"
.END