Machine oriented programming Project 1

# Is-Prime-Assembly-Program #
Course: 02322 Machine oriented programming Spring 22

Contributors:
- Rasmus Prætorius s215777
- Andrew Shereef s173750
- Alban Dalifi s205416

## Assignment specifications (see pdf: 02322 Machine Oriented programming Project 1 Group 28) ##
Assembly code made for the LC-3 16 bit computer.

### AssignmentDeliverable1 ###
To solve this exercise, a diagram deconstructing the operations needed to find the midpoint
between two whole numbers was made. The idea represented in diagram 1A was that once
could increment the lower of the two numbers, and decrement the higher number in a loop
until the two numbers were equal. This diagram also documents the assembly program
“AssignmentDeliverable1.asm”.

### AssignmentDeliverable2 ###
On the back of the first diagram 2B, a second diagram further deconstructs this function
down to its fundamental operations. This involved reading characters from the console with
echo and converting them from ASCII characters to digit values by adding #-48. Branching
was used to determine the first digit and to multiply it by 9 inside a loop and +1 outside the
loop. Later the second digit could be added to the first, thus making up their concatenation.
This diagram also documents the assembly program “AssignmentDeliverable2.asm”.

### AssignmentDeliverable3 ###
To further detail the operations needed, another diagram 3B was made, deconstructing the
tasks needed to test if the number in R0 is a prime number. This involved using an outer
loop iterating over numbers from 2 to the value of the number in R0, and an inner loop
testing if a particular value is a factor in the number. This was done by iteratively subtracting
the test number to see if the result would become 0, in which case the number would be a
prime number. If the R0 number is less than 1 or has no factors other than itself, the number
would then be a prime number. This diagram also documents the assembly program
“AssignmentDeliverable3.asm”.

### AssignmentDeliverable4 ###
To further detail the operations needed, another diagram 4B was made deconstructing the
tasks further. Here, depending on the result of a branch used on R0, one of two possible
string message addresses are loaded into R0 and printed to the console. This diagram also
documents the assembly program “AssignmentDeliverable4.asm”.

### AssignmentDeliverable5 ###
To further detail the operations needed, another diagram 5B was made, deconstructing the
subroutine calls and loop. Upon jump, each subroutine readS, sPrime and resultS, store the
registers needed before their operations, and restore them to their original values again
afterwards, before returning to whence they were called. A newline is printed for each
iteration, so that the prompt messages from each subroutine remain visibly separate in the
console. This diagram also documents the assembly program
“AssignmentDeliverable5.asm”.
