	.file	"solution.c"
	.intel_syntax noprefix
	.text
	.globl	factorial  # factorial function
	.type	factorial, @function
factorial:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -16[rbp], 1 #long long result = 1;
	mov	QWORD PTR -8[rbp], 2
	jmp	.L2
.L3:
	mov	rax, QWORD PTR -16[rbp]
	imul	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -16[rbp], rax
	add	QWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	cmp	QWORD PTR -8[rbp], rax
	jle	.L3
	mov	rax, QWORD PTR -16[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	factorial, .-factorial
	.globl	bernoulliNumber  # bernoulliNumber function
	.type	bernoulliNumber, @function
bernoulliNumber:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 112
	mov	DWORD PTR -100[rbp], edi
	cmp	DWORD PTR -100[rbp], 0
	jne	.L6
	fld1
	jmp	.L7
.L6:
	fldz
	fstp	TBYTE PTR -80[rbp] #long double semiResult = 0.0;
	mov	eax, DWORD PTR -100[rbp] #long double n1 = factorial(n + 1);
	add	eax, 1
	mov	edi, eax
	call	factorial
	mov	QWORD PTR -112[rbp], rax
	fild	QWORD PTR -112[rbp]
	fstp	TBYTE PTR -64[rbp]
	mov	DWORD PTR -84[rbp], 0
	jmp	.L8
.L9:
	mov	eax, DWORD PTR -84[rbp] #long double bk = bernoulliNumber(k);
	mov	edi, eax
	call	bernoulliNumber
	fstp	TBYTE PTR -48[rbp] #long double fk = factorial(k);
	mov	eax, DWORD PTR -84[rbp]
	mov	edi, eax
	call	factorial
	mov	QWORD PTR -112[rbp], rax
	fild	QWORD PTR -112[rbp]
	fstp	TBYTE PTR -32[rbp] #long double fn1k = factorial(n + 1 - k);
	mov	eax, DWORD PTR -100[rbp]
	add	eax, 1
	sub	eax, DWORD PTR -84[rbp]
	mov	edi, eax
	call	factorial
	mov	QWORD PTR -112[rbp], rax
	fild	QWORD PTR -112[rbp]
	fstp	TBYTE PTR -16[rbp]
	mov	eax, DWORD PTR -100[rbp]
	add	eax, 1
	sub	eax, DWORD PTR -84[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movsd	QWORD PTR -112[rbp], xmm0
	fld	QWORD PTR -112[rbp]
	fld	TBYTE PTR -16[rbp]
	fld	TBYTE PTR -32[rbp]
	fmulp	st(1), st
	fld	TBYTE PTR -64[rbp]
	fdivrp	st(1), st
	fmulp	st(1), st
	fld	TBYTE PTR -48[rbp]
	fmulp	st(1), st
	fld	TBYTE PTR -80[rbp]
	faddp	st(1), st
	fstp	TBYTE PTR -80[rbp]
	add	DWORD PTR -84[rbp], 1
.L8:
	mov	eax, DWORD PTR -84[rbp]
	cmp	eax, DWORD PTR -100[rbp]
	jl	.L9
	mov	eax, DWORD PTR -100[rbp]
	add	eax, 1
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR .LC3[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -112[rbp], xmm0
	fld	QWORD PTR -112[rbp]
	fld	TBYTE PTR -80[rbp]
	fmulp	st(1), st
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	bernoulliNumber, .-bernoulliNumber
	.globl	tanhNumber  # tanh function
	.type	tanhNumber, @function
tanhNumber:
.LFB2:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	DWORD PTR -36[rbp], edi
	fldz
	fstp	TBYTE PTR -16[rbp]  #long double result = 0;
	mov	DWORD PTR -24[rbp], 1
	jmp	.L11
.L12:
	mov	eax, DWORD PTR -24[rbp]
	add	eax, eax
	mov	DWORD PTR -20[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -20[rbp]
	mov	rax, QWORD PTR .LC5[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movsd	QWORD PTR -64[rbp], xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -20[rbp]
	mov	rax, QWORD PTR .LC5[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movq	rax, xmm0
	movsd	xmm1, QWORD PTR .LC3[rip]
	movq	xmm2, rax
	subsd	xmm2, xmm1
	movapd	xmm0, xmm2
	movapd	xmm3, xmm0
	mulsd	xmm3, QWORD PTR -64[rbp]
	movsd	QWORD PTR -64[rbp], xmm3
	fld	QWORD PTR -64[rbp]
	fstp	TBYTE PTR -64[rbp]
	mov	eax, DWORD PTR -20[rbp]
	mov	edi, eax
	call	bernoulliNumber
	fld	TBYTE PTR -64[rbp]
	fmulp	st(1), st
	fstp	TBYTE PTR -64[rbp]
	mov	eax, DWORD PTR -20[rbp]
	sub	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	fld	TBYTE PTR 16[rbp]
	fstp	QWORD PTR -48[rbp]
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -48[rbp]
	call	pow@PLT
	movsd	QWORD PTR -48[rbp], xmm0
	fld	QWORD PTR -48[rbp]
	fld	TBYTE PTR -64[rbp]
	fmulp	st(1), st
	fstp	TBYTE PTR -64[rbp]
	mov	eax, DWORD PTR -20[rbp]
	mov	edi, eax
	call	factorial
	mov	QWORD PTR -48[rbp], rax
	fild	QWORD PTR -48[rbp]
	fld	TBYTE PTR -64[rbp]
	fdivrp	st(1), st
	fld	TBYTE PTR -16[rbp]
	faddp	st(1), st
	fstp	TBYTE PTR -16[rbp]
	add	DWORD PTR -24[rbp], 1
.L11:
	mov	eax, DWORD PTR -24[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L12
	fld	TBYTE PTR -16[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	tanhNumber, .-tanhNumber # tanh function
	.section	.rodata
.LC6:
	.string	"%Lf"
.LC7:
	.string	"Threshold: %d Diff: %lf%%\n"
.LC11:
	.string	"Threshold: %d Diff: %Lf%%\n"
.LC12:
	.string	"Bernoulli: tanh(%Lf) = %Lf\n"
.LC13:
	.string	"Exponent: tanh(%Lf) = %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 112
	mov	rax, QWORD PTR fs:40  # long double angle;
	mov	QWORD PTR -8[rbp], rax  # long double angle;
	xor	eax, eax
	mov	DWORD PTR -84[rbp], 11  #int maxThreshold = 11;
	lea	rax, -80[rbp]
	mov	rsi, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	DWORD PTR -88[rbp], 1
	jmp	.L15
.L19:
	fld	TBYTE PTR -80[rbp]
	mov	eax, DWORD PTR -88[rbp]
	lea	rsp, -16[rsp]
	fstp	TBYTE PTR [rsp]
	mov	edi, eax
	call	tanhNumber
	add	rsp, 16
	fstp	TBYTE PTR -64[rbp]
	fld	TBYTE PTR -80[rbp]
	fstp	QWORD PTR -104[rbp]
	movsd	xmm0, QWORD PTR -104[rbp]
	call	tanh@PLT
	movsd	QWORD PTR -104[rbp], xmm0
	fld	QWORD PTR -104[rbp]
	fstp	TBYTE PTR -48[rbp]
	fld	TBYTE PTR -48[rbp]
	fldz
	fucomip	st, st(1)
	fstp	st(0)
	jp	.L16
	fld	TBYTE PTR -48[rbp]
	fldz
	fucomip	st, st(1)
	fstp	st(0)
	jne	.L16
	mov	eax, DWORD PTR -88[rbp]
	mov	rdx, QWORD PTR .LC8[rip]
	movq	xmm0, rdx
	mov	esi, eax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	jmp	.L18
.L16:
	fld	TBYTE PTR -64[rbp]
	fld	TBYTE PTR -48[rbp]
	fsubp	st(1), st
	fstp	QWORD PTR -104[rbp]
	movsd	xmm1, QWORD PTR -104[rbp]
	movq	xmm0, QWORD PTR .LC9[rip]
	andpd	xmm1, xmm0
	movsd	QWORD PTR -104[rbp], xmm1
	fld	QWORD PTR -104[rbp]
	fld	TBYTE PTR -48[rbp]
	fdivp	st(1), st
	fld	TBYTE PTR .LC10[rip]
	fmulp	st(1), st
	fstp	TBYTE PTR -32[rbp]
	mov	eax, DWORD PTR -88[rbp]
	push	QWORD PTR -24[rbp]
	push	QWORD PTR -32[rbp]
	mov	esi, eax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	rsp, 16
.L18:
	add	DWORD PTR -88[rbp], 1  #threshold
.L15:
	mov	eax, DWORD PTR -88[rbp]
	cmp	eax, DWORD PTR -84[rbp]
	jle	.L19
	fld	TBYTE PTR -80[rbp]
	mov	eax, DWORD PTR -84[rbp]
	lea	rsp, -16[rsp]
	fstp	TBYTE PTR [rsp]
	mov	edi, eax
	call	tanhNumber
	add	rsp, 16
	fld	TBYTE PTR -80[rbp]
	fxch	st(1)
	lea	rsp, -16[rsp]
	fstp	TBYTE PTR [rsp]
	lea	rsp, -16[rsp]
	fstp	TBYTE PTR [rsp]
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	rsp, 32
	fld	TBYTE PTR -80[rbp]
	fstp	QWORD PTR -104[rbp]
	movsd	xmm0, QWORD PTR -104[rbp]
	call	tanh@PLT
	movq	rax, xmm0
	fld	TBYTE PTR -80[rbp]
	lea	rsp, -16[rsp]
	fstp	TBYTE PTR [rsp]
	movq	xmm0, rax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	add	rsp, 16
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	-1074790400
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC5:
	.long	0
	.long	1073741824
	.align 8
.LC8:
	.long	0
	.long	0
	.align 16
.LC9:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 16
.LC10:
	.long	0
	.long	-939524096
	.long	16389
	.long	0
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
