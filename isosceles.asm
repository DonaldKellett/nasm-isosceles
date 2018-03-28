global start

section .text ; code

start:
  mov rdx, output ; rdx holds memory address of next byte to write
  mov r8, maxLines ; initial number of leading whitespace on line plus 1
  dec r8 ; Now register 8 stores initial number of leading whitespace on line
  mov r9, 1 ; initial number of stars to print
  mov r10, 0 ; number of whitespace written on line so far
  mov r11, 0 ; number of stars written on line so far
  mov r12, 0 ; number of lines written so far
whitespacePrep:
  cmp r10, r8 ; Did we already reach the no. of whitespace for this line?
  jnl stars ; If we already did then skip to printing stars directly
whitespace:
  mov byte [rdx], ' ' ; Write whitespace character to selected location in string buffer
  inc rdx ; Advance pointer to prepare for next byte to write
  inc r10 ; Count number of whitespace written on line so far
  cmp r10, r8 ; Did we reach the number of whitespace for this line?
  jnge whitespace ; If we haven't reached the no. of whitespace for this line, go back to label "whitespace"
stars:
  mov byte [rdx], '*' ; Write asterisk to selected location in string buffer
  inc rdx ; Advance pointer to next byte for writing
  inc r11 ; Count number of stars written on line so far
  cmp r11, r9 ; Did we reach the number of stars for this line?
  jnge stars ; Loop back to "stars" label if we haven't printed out enough stars yet
lineDone:
  mov r10, 0 ; Reset no. of whitespace written on line
  mov r11, 0 ; Reset no. of stars written on line
  dec r8 ; Number of leading whitespace on next line is one less than current line
  add r9, 2 ; Next line should contain 2 more stars than current line
  mov byte [rdx], 10 ; Write newline to buffer
  inc rdx ; Advance pointer to next byte for writing
  inc r12 ; now one more line has been written to buffer
  cmp r12, maxLines ; Have we already written our desired no. of lines?
  jnge whitespacePrep ; If we haven't written enough lines then go back to printing whitespace
done:
  mov rax, 0x02000004 ; system call for write
  mov rdi, 1 ; file handle 1 is stdout
  mov rsi, output ; Address of string buffer to output
  mov rdx, dataSize ; Number of bytes to print out
  syscall
  mov rax, 0x02000001 ; system call for exit
  xor rdi, rdi ; exit with exit code 0
  syscall ; invoke OS to exit program

section .bss ; writable data

maxLines: equ 20 ; No. of lines to print for the given isosceles triangle
dataSize: equ 610 ; Total no. of bytes required to store isosceles triangle
output: resb dataSize ; Allocate buffer for storing output string
