	.file	"solution.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.3.0-1ubuntu1~22.04) version 11.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fcf-protection=none -fstack-protector-strong -fstack-clash-protection
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
	push	rbp	#
	mov	rbp, rsp	#,
	mov	DWORD PTR -20[rbp], edi	# n, n
# solution.c:6:     long long result = 1;
	mov	QWORD PTR -16[rbp], 1	# result,
# solution.c:7:     for (long long i = 2; i <= n; i++) {
	mov	QWORD PTR -8[rbp], 2	# i,
# solution.c:7:     for (long long i = 2; i <= n; i++) {
	jmp	.L2	#
.L3:
# solution.c:8:         result *= i;
	mov	rax, QWORD PTR -16[rbp]	# tmp86, result
	imul	rax, QWORD PTR -8[rbp]	# tmp85, i
	mov	QWORD PTR -16[rbp], rax	# result, tmp85
# solution.c:7:     for (long long i = 2; i <= n; i++) {
	add	QWORD PTR -8[rbp], 1	# i,
.L2:
# solution.c:7:     for (long long i = 2; i <= n; i++) {
	mov	eax, DWORD PTR -20[rbp]	# tmp87, n
	cdqe
	cmp	QWORD PTR -8[rbp], rax	# i, _1
	jle	.L3	#,
# solution.c:12:     return result;
	mov	rax, QWORD PTR -16[rbp]	# _7, result
# solution.c:13: }
	pop	rbp	#
	ret	
	.size	factorial, .-factorial
	.globl	bernoulliNumber
	.type	bernoulliNumber, @function
bernoulliNumber:
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 112	#,
	mov	DWORD PTR -100[rbp], edi	# n, n
# solution.c:16:     if (n == 0) {
	cmp	DWORD PTR -100[rbp], 0	# n,
	jne	.L6	#,
# solution.c:17:         return 1.0;
	fld1	
	jmp	.L7	#
.L6:
# solution.c:19:     long double semiResult = 0.0;
	fldz	
	fstp	TBYTE PTR -80[rbp]	# semiResult
# solution.c:20:     long double n1 = factorial(n + 1);
	mov	eax, DWORD PTR -100[rbp]	# tmp104, n
	add	eax, 1	# _1,
	mov	edi, eax	#, _1
	call	factorial	#
# solution.c:20:     long double n1 = factorial(n + 1);
	mov	QWORD PTR -112[rbp], rax	# %sfp, _2
	fild	QWORD PTR -112[rbp]	# %sfp
	fstp	TBYTE PTR -64[rbp]	# n1
# solution.c:21:     for (int k = 0; k < n; k++) {
	mov	DWORD PTR -84[rbp], 0	# k,
# solution.c:21:     for (int k = 0; k < n; k++) {
	jmp	.L8	#
.L9:
# solution.c:22:         long double bk = bernoulliNumber(k);
	mov	eax, DWORD PTR -84[rbp]	# tmp106, k
	mov	edi, eax	#, tmp106
	call	bernoulliNumber	#
	fstp	TBYTE PTR -48[rbp]	# bk
# solution.c:23:         long double fk = factorial(k);
	mov	eax, DWORD PTR -84[rbp]	# tmp108, k
	mov	edi, eax	#, tmp108
	call	factorial	#
# solution.c:23:         long double fk = factorial(k);
	mov	QWORD PTR -112[rbp], rax	# %sfp, _3
	fild	QWORD PTR -112[rbp]	# %sfp
	fstp	TBYTE PTR -32[rbp]	# fk
# solution.c:24:         long double fn1k = factorial(n + 1 - k);
	mov	eax, DWORD PTR -100[rbp]	# tmp110, n
	add	eax, 1	# _4,
# solution.c:24:         long double fn1k = factorial(n + 1 - k);
	sub	eax, DWORD PTR -84[rbp]	# _5, k
	mov	edi, eax	#, _5
	call	factorial	#
# solution.c:24:         long double fn1k = factorial(n + 1 - k);
	mov	QWORD PTR -112[rbp], rax	# %sfp, _6
	fild	QWORD PTR -112[rbp]	# %sfp
	fstp	TBYTE PTR -16[rbp]	# fn1k
# solution.c:26:         semiResult += pow(-1, n + 1 - k) * (n1 / (fn1k * fk)) * bk;
	mov	eax, DWORD PTR -100[rbp]	# tmp112, n
	add	eax, 1	# _7,
# solution.c:26:         semiResult += pow(-1, n + 1 - k) * (n1 / (fn1k * fk)) * bk;
	sub	eax, DWORD PTR -84[rbp]	# _8, k
# solution.c:26:         semiResult += pow(-1, n + 1 - k) * (n1 / (fn1k * fk)) * bk;
	pxor	xmm0, xmm0	# _9
	cvtsi2sd	xmm0, eax	# _9, _8
	mov	rax, QWORD PTR .LC2[rip]	# tmp113,
	movapd	xmm1, xmm0	#, _9
	movq	xmm0, rax	#, tmp113
	call	pow@PLT	#
	movsd	QWORD PTR -112[rbp], xmm0	# %sfp,
	fld	QWORD PTR -112[rbp]	# %sfp
# solution.c:26:         semiResult += pow(-1, n + 1 - k) * (n1 / (fn1k * fk)) * bk;
	fld	TBYTE PTR -16[rbp]	# fn1k
	fld	TBYTE PTR -32[rbp]	# fk
	fmulp	st(1), st	#,
# solution.c:26:         semiResult += pow(-1, n + 1 - k) * (n1 / (fn1k * fk)) * bk;
	fld	TBYTE PTR -64[rbp]	# n1
	fdivrp	st(1), st	#,
# solution.c:26:         semiResult += pow(-1, n + 1 - k) * (n1 / (fn1k * fk)) * bk;
	fmulp	st(1), st	#,
# solution.c:26:         semiResult += pow(-1, n + 1 - k) * (n1 / (fn1k * fk)) * bk;
	fld	TBYTE PTR -48[rbp]	# bk
	fmulp	st(1), st	#,
# solution.c:26:         semiResult += pow(-1, n + 1 - k) * (n1 / (fn1k * fk)) * bk;
	fld	TBYTE PTR -80[rbp]	# semiResult
	faddp	st(1), st	#,
	fstp	TBYTE PTR -80[rbp]	# semiResult
# solution.c:21:     for (int k = 0; k < n; k++) {
	add	DWORD PTR -84[rbp], 1	# k,
.L8:
# solution.c:21:     for (int k = 0; k < n; k++) {
	mov	eax, DWORD PTR -84[rbp]	# tmp120, k
	cmp	eax, DWORD PTR -100[rbp]	# tmp120, n
	jl	.L9	#,
# solution.c:28:     return 1.0 / (n + 1) * semiResult;
	mov	eax, DWORD PTR -100[rbp]	# tmp121, n
	add	eax, 1	# _15,
# solution.c:28:     return 1.0 / (n + 1) * semiResult;
	pxor	xmm1, xmm1	# _16
	cvtsi2sd	xmm1, eax	# _16, _15
	movsd	xmm0, QWORD PTR .LC3[rip]	# tmp122,
	divsd	xmm0, xmm1	# tmp122, _16
	movsd	QWORD PTR -112[rbp], xmm0	# %sfp, tmp122
	fld	QWORD PTR -112[rbp]	# %sfp
# solution.c:28:     return 1.0 / (n + 1) * semiResult;
	fld	TBYTE PTR -80[rbp]	# semiResult
	fmulp	st(1), st	#,
.L7:
# solution.c:29: }
	leave	
	ret	
	.size	bernoulliNumber, .-bernoulliNumber
	.globl	tanhNumber
	.type	tanhNumber, @function
tanhNumber:
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 64	#,
	mov	DWORD PTR -36[rbp], edi	# threshold, threshold
# solution.c:56:     long double result = 0;
	fldz	
	fstp	TBYTE PTR -16[rbp]	# result
# solution.c:57:     for (int n = 1; n < threshold; n++) {
	mov	DWORD PTR -24[rbp], 1	# n,
# solution.c:57:     for (int n = 1; n < threshold; n++) {
	jmp	.L11	#
.L12:
# solution.c:58:         int n2 = n * 2;
	mov	eax, DWORD PTR -24[rbp]	# tmp106, n
	add	eax, eax	# tmp105
	mov	DWORD PTR -20[rbp], eax	# n2, tmp105
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	pxor	xmm0, xmm0	# _1
	cvtsi2sd	xmm0, DWORD PTR -20[rbp]	# _1, n2
	mov	rax, QWORD PTR .LC5[rip]	# tmp107,
	movapd	xmm1, xmm0	#, _1
	movq	xmm0, rax	#, tmp107
	call	pow@PLT	#
	movsd	QWORD PTR -64[rbp], xmm0	# %sfp,
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	pxor	xmm0, xmm0	# _3
	cvtsi2sd	xmm0, DWORD PTR -20[rbp]	# _3, n2
	mov	rax, QWORD PTR .LC5[rip]	# tmp108,
	movapd	xmm1, xmm0	#, _3
	movq	xmm0, rax	#, tmp108
	call	pow@PLT	#
	movq	rax, xmm0	# _4,
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	movsd	xmm1, QWORD PTR .LC3[rip]	# tmp109,
	movq	xmm2, rax	# _4, _4
	subsd	xmm2, xmm1	# _4, tmp109
	movapd	xmm0, xmm2	# _5, _4
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	movapd	xmm3, xmm0	# _5, _5
	mulsd	xmm3, QWORD PTR -64[rbp]	# _5, %sfp
	movsd	QWORD PTR -64[rbp], xmm3	# %sfp, _5
	fld	QWORD PTR -64[rbp]	# %sfp
	fstp	TBYTE PTR -64[rbp]	# %sfp
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	mov	eax, DWORD PTR -20[rbp]	# tmp110, n2
	mov	edi, eax	#, tmp110
	call	bernoulliNumber	#
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	fld	TBYTE PTR -64[rbp]	# %sfp
	fmulp	st(1), st	#,
	fstp	TBYTE PTR -64[rbp]	# %sfp
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	mov	eax, DWORD PTR -20[rbp]	# tmp111, n2
	sub	eax, 1	# _10,
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	pxor	xmm0, xmm0	# _11
	cvtsi2sd	xmm0, eax	# _11, _10
	fld	TBYTE PTR 16[rbp]	# angle
	fstp	QWORD PTR -48[rbp]	# %sfp
	movapd	xmm1, xmm0	#, _11
	movsd	xmm0, QWORD PTR -48[rbp]	#, %sfp
	call	pow@PLT	#
	movsd	QWORD PTR -48[rbp], xmm0	# %sfp,
	fld	QWORD PTR -48[rbp]	# %sfp
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	fld	TBYTE PTR -64[rbp]	# %sfp
	fmulp	st(1), st	#,
	fstp	TBYTE PTR -64[rbp]	# %sfp
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	mov	eax, DWORD PTR -20[rbp]	# tmp113, n2
	mov	edi, eax	#, tmp113
	call	factorial	#
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	mov	QWORD PTR -48[rbp], rax	# %sfp, _16
	fild	QWORD PTR -48[rbp]	# %sfp
	fld	TBYTE PTR -64[rbp]	# %sfp
	fdivrp	st(1), st	#,
# solution.c:59:         result += (pow(2, n2) * (pow(2, n2) - 1) * bernoulliNumber(n2) * pow(angle, n2 - 1)) / factorial(n2);
	fld	TBYTE PTR -16[rbp]	# result
	faddp	st(1), st	#,
	fstp	TBYTE PTR -16[rbp]	# result
# solution.c:57:     for (int n = 1; n < threshold; n++) {
	add	DWORD PTR -24[rbp], 1	# n,
.L11:
# solution.c:57:     for (int n = 1; n < threshold; n++) {
	mov	eax, DWORD PTR -24[rbp]	# tmp116, n
	cmp	eax, DWORD PTR -36[rbp]	# tmp116, threshold
	jl	.L12	#,
# solution.c:61:     return result;
	fld	TBYTE PTR -16[rbp]	# result
# solution.c:62: }
	leave	
	ret	
	.size	tanhNumber, .-tanhNumber
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
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 112	#,
# solution.c:64: int main() {
	mov	rax, QWORD PTR fs:40	# tmp124, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.3463, tmp124
	xor	eax, eax	# tmp124
# solution.c:66:     int maxThreshold = 11;
	mov	DWORD PTR -84[rbp], 11	# maxThreshold,
# solution.c:67:     scanf("%Lf", &angle);
	lea	rax, -80[rbp]	# tmp100,
	mov	rsi, rax	#, tmp100
	lea	rax, .LC6[rip]	# tmp101,
	mov	rdi, rax	#, tmp101
	mov	eax, 0	#,
	call	__isoc99_scanf@PLT	#
# solution.c:68:     for (int threshold = 1; threshold <= maxThreshold; threshold += 1) {
	mov	DWORD PTR -88[rbp], 1	# threshold,
# solution.c:68:     for (int threshold = 1; threshold <= maxThreshold; threshold += 1) {
	jmp	.L15	#
.L19:
# solution.c:69:         long double customTanh = tanhNumber(angle, threshold);
	fld	TBYTE PTR -80[rbp]	# angle
	mov	eax, DWORD PTR -88[rbp]	# tmp102, threshold
	lea	rsp, -16[rsp]	#,
	fstp	TBYTE PTR [rsp]	#
	mov	edi, eax	#, tmp102
	call	tanhNumber	#
	add	rsp, 16	#,
	fstp	TBYTE PTR -64[rbp]	# customTanh
# solution.c:70:         long double mathTanh = tanh(angle);
	fld	TBYTE PTR -80[rbp]	# angle
	fstp	QWORD PTR -104[rbp]	# %sfp
	movsd	xmm0, QWORD PTR -104[rbp]	# _3, %sfp
	call	tanh@PLT	#
# solution.c:70:         long double mathTanh = tanh(angle);
	movsd	QWORD PTR -104[rbp], xmm0	# %sfp, _4
	fld	QWORD PTR -104[rbp]	# %sfp
	fstp	TBYTE PTR -48[rbp]	# mathTanh
# solution.c:71:         if (mathTanh == 0.0) {
	fld	TBYTE PTR -48[rbp]	# mathTanh
	fldz	
	fucomip	st, st(1)	#,
	fstp	st(0)		#
	jp	.L16	#,
	fld	TBYTE PTR -48[rbp]	# mathTanh
	fldz	
	fucomip	st, st(1)	#,
	fstp	st(0)		#
	jne	.L16	#,
# solution.c:72:             printf("Threshold: %d Diff: %lf%%\n", threshold, 0.0);
	mov	eax, DWORD PTR -88[rbp]	# tmp108, threshold
	mov	rdx, QWORD PTR .LC8[rip]	# tmp109,
	movq	xmm0, rdx	#, tmp109
	mov	esi, eax	#, tmp108
	lea	rax, .LC7[rip]	# tmp110,
	mov	rdi, rax	#, tmp110
	mov	eax, 1	#,
	call	printf@PLT	#
# solution.c:73:             continue;
	jmp	.L18	#
.L16:
# solution.c:75:         long double difference = fabs(customTanh - mathTanh) / mathTanh * 100;
	fld	TBYTE PTR -64[rbp]	# customTanh
	fld	TBYTE PTR -48[rbp]	# mathTanh
	fsubp	st(1), st	#,
	fstp	QWORD PTR -104[rbp]	# %sfp
	movsd	xmm1, QWORD PTR -104[rbp]	# _6, %sfp
# solution.c:75:         long double difference = fabs(customTanh - mathTanh) / mathTanh * 100;
	movq	xmm0, QWORD PTR .LC9[rip]	# tmp113,
	andpd	xmm1, xmm0	# _6, tmp113
	movsd	QWORD PTR -104[rbp], xmm1	# %sfp, _6
	fld	QWORD PTR -104[rbp]	# %sfp
# solution.c:75:         long double difference = fabs(customTanh - mathTanh) / mathTanh * 100;
	fld	TBYTE PTR -48[rbp]	# mathTanh
	fdivp	st(1), st	#,
# solution.c:75:         long double difference = fabs(customTanh - mathTanh) / mathTanh * 100;
	fld	TBYTE PTR .LC10[rip]	#
	fmulp	st(1), st	#,
	fstp	TBYTE PTR -32[rbp]	# difference
# solution.c:76:         printf("Threshold: %d Diff: %Lf%%\n", threshold, difference);
	mov	eax, DWORD PTR -88[rbp]	# tmp117, threshold
	push	QWORD PTR -24[rbp]	# difference
	push	QWORD PTR -32[rbp]	# difference
	mov	esi, eax	#, tmp117
	lea	rax, .LC11[rip]	# tmp118,
	mov	rdi, rax	#, tmp118
	mov	eax, 0	#,
	call	printf@PLT	#
	add	rsp, 16	#,
.L18:
# solution.c:68:     for (int threshold = 1; threshold <= maxThreshold; threshold += 1) {
	add	DWORD PTR -88[rbp], 1	# threshold,
.L15:
# solution.c:68:     for (int threshold = 1; threshold <= maxThreshold; threshold += 1) {
	mov	eax, DWORD PTR -88[rbp]	# tmp119, threshold
	cmp	eax, DWORD PTR -84[rbp]	# tmp119, maxThreshold
	jle	.L19	#,
# solution.c:84:     printf("Bernoulli: tanh(%Lf) = %Lf\n", angle, tanhNumber(angle, maxThreshold));
	fld	TBYTE PTR -80[rbp]	# angle
	mov	eax, DWORD PTR -84[rbp]	# tmp120, maxThreshold
	lea	rsp, -16[rsp]	#,
	fstp	TBYTE PTR [rsp]	#
	mov	edi, eax	#, tmp120
	call	tanhNumber	#
	add	rsp, 16	#,
	fld	TBYTE PTR -80[rbp]	# angle
	fxch	st(1)		#
	lea	rsp, -16[rsp]	#,
	fstp	TBYTE PTR [rsp]	#
	lea	rsp, -16[rsp]	#,
	fstp	TBYTE PTR [rsp]	#
	lea	rax, .LC12[rip]	# tmp121,
	mov	rdi, rax	#, tmp121
	mov	eax, 0	#,
	call	printf@PLT	#
	add	rsp, 32	#,
# solution.c:89:     printf("Exponent: tanh(%Lf) = %lf\n", angle, tanh(angle));
	fld	TBYTE PTR -80[rbp]	# angle
	fstp	QWORD PTR -104[rbp]	# %sfp
	movsd	xmm0, QWORD PTR -104[rbp]	# _14, %sfp
	call	tanh@PLT	#
	movq	rax, xmm0	# _15,
	fld	TBYTE PTR -80[rbp]	# angle
	lea	rsp, -16[rsp]	#,
	fstp	TBYTE PTR [rsp]	#
	movq	xmm0, rax	#, _15
	lea	rax, .LC13[rip]	# tmp122,
	mov	rdi, rax	#, tmp122
	mov	eax, 1	#,
	call	printf@PLT	#
	add	rsp, 16	#,
# solution.c:90:     return 0;
	mov	eax, 0	# _27,
# solution.c:91: }
	mov	rdx, QWORD PTR -8[rbp]	# tmp125, D.3463
	sub	rdx, QWORD PTR fs:40	# tmp125, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L21	#,
	call	__stack_chk_fail@PLT	#
.L21:
	leave	
	ret	
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
