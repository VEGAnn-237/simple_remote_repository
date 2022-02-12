; Занятие 4. Массивы
; (с) Ильин Андрей Викторович

            global CountMagicElements
            global TransformElements

            section .text

; ----------------------------------------------------------------------------
;    Количество положительных элементов, дающих по модулю 3 остаток 2.
; RCX - size
; RDX -> R10 - ptr
; R9 - answer
; R8 - const (3)

CountMagicElements:
            xor r9, r9
            mov r8, 3
            mov r10, rdx

.loop_begin:
            cmp rcx, 0
            jle .loop_end
            dec rcx

            mov eax, DWORD [r10 + 4 * rcx]
            cdq
            idiv r8d

            cmp edx, 2
            jne .endif
            inc r9
.endif:
            jmp .loop_begin
.loop_end:
            mov rax, r9
            ret

; ----------------------------------------------------------------------------
;    a[i] <-- a[i] * 4 + a[i-1], i > 0
; RCX - size
; RDX - ptr
; R8  - i
; eax - a[i]
; r9d - a[i-1]

TransformElements:
            mov r8, 1
.loop:
            cmp r8, rcx
            jge .exit

            mov eax, DWORD [rdx + 4 * r8]
            mov r9d, DWORD [rdx + 4 * r8 - 4]
            lea eax, [eax * 4 + r9d]
            mov DWORD [rdx + 4 * r8], eax

            inc r8
            jmp .loop
.exit:
            ret