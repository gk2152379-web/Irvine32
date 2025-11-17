

INCLUDE Irvine32.inc

.data
msgP BYTE "Enter value for P: ", 0
msgR BYTE "Enter value for R: ", 0
msgQ BYTE "Enter value for Q: ", 0
msgS BYTE "Enter value for S: ", 0
msgT BYTE "Enter value for T: ", 0

msgDec BYTE "In signed integers is ", 0
msgHex BYTE "In hexadecimal is ", 0

msgExpr BYTE "Expression (2P - R) - (Q + S) - 3T, the answer:",0

P SWORD ?
R SWORD ?
Q SWORD ?
S SWORD ?
T SWORD ?
result1 SWORD ?

.code
main PROC

    ; ---- INPUT SECTION ----
    mov edx, OFFSET msgP
    call WriteString
    call ReadInt
    mov P, ax

    mov edx, OFFSET msgR
    call WriteString
    call ReadInt
    mov R, ax

    mov edx, OFFSET msgQ
    call WriteString
    call ReadInt
    mov Q, ax

    mov edx, OFFSET msgS
    call WriteString
    call ReadInt
    mov S, ax

    mov edx, OFFSET msgT
    call WriteString
    call ReadInt
    mov T, ax

    ; ---- CALCULATION SECTION ----
    ; AX = 2P
    mov ax, P
    shl ax, 1

    ; AX = 2P - R
    sub ax, R

    ; BX = Q + S
    mov bx, Q
    add bx, S

    ; AX = (2P - R) - (Q + S)
    sub ax, bx

    ; subtract 3T
    mov bx, T
    imul bx, 3
    sub ax, bx

    mov result1, ax

    ; ---- OUTPUT SECTION ----
    call CrLf
    mov edx, OFFSET msgExpr
    call WriteString
    call CrLf

    mov edx, OFFSET msgDec
    call WriteString
    movsx eax, result1
    call WriteInt
    call CrLf

    mov edx, OFFSET msgHex
    call WriteString
    movzx eax, result1
    call WriteHex
    call CrLf

    exit
main ENDP
END main
