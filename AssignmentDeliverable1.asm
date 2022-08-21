.ORIG x3000
LD R0,A         ;Loads A into R0
LD R1,B         ;Loads B into R1
X NOT R2,R0     ;NOT on R0, saves in R2
ADD R2,R2,#1    ;Adds 1 to R2 to get negative value
ADD R2,R2,R1    ;Adds R2 and R1
BRz DONE        ;Branch to DONE if result is 0
ADD R1,R1,#-1   ;Decrement R1 by 1
ADD R0,R0,#1    ;Increment R0 by 1
BRnzp X         ;Branch to X
DONE ST R1,C    ;Store C in R1 
TRAP x25        ;Terminate program
A .BLKW 1
B .BLKW 1
C .BLKW 1
.END