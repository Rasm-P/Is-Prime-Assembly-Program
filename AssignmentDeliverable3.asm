.ORIG x3000

;Takes as argument a number (with the decimal value between 0 and 99) 
;stored in R0 and returns value 1 if the number is prime and value 0 
;if the number if not prime. The return value is also stored in register R0.
sPrime AND R1, R1, #0   ;Zero register R1
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
TRAP x25                ;Terminate program
NOPRIME AND R0, R0, #0  ;Zero register R0 (NOTPRIME if a factor added up to 0, thus not prime)
TRAP x25                ;Terminate program

.END