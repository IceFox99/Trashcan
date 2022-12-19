	.text
	.file	"simd_no_ilp.c"
	.globl	dump_result                     # -- Begin function dump_result
	.p2align	4, 0x90
	.type	dump_result,@function
dump_result:                            # @dump_result
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	testl	%edx, %edx
	jle	.LBB0_8
# %bb.1:
	movq	%rcx, %r15
	movq	%rdi, %r14
	movslq	%edx, %rbp
	testq	%rcx, %rcx
	jle	.LBB0_2
# %bb.4:
	movq	%rsi, %rbx
	leaq	(,%r15,8), %rax
	movq	%rax, (%rsp)                    # 8-byte Spill
	leaq	.L.str.2(%rip), %r12
	xorl	%esi, %esi
	movq	%rbp, 8(%rsp)                   # 8-byte Spill
	.p2align	4, 0x90
.LBB0_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	leaq	(%rsi,%rsi,8), %r13
	movl	64(%r14,%r13,8), %edx
	movl	68(%r14,%r13,8), %ecx
	vmovsd	(%r14,%r13,8), %xmm0            # xmm0 = mem[0],zero
	leaq	.L.str(%rip), %rdi
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	movb	$1, %al
	callq	printf@PLT
	vmovsd	8(%r14,%r13,8), %xmm0           # xmm0 = mem[0],zero
	leaq	.L.str.1(%rip), %rbp
	movq	%rbp, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	16(%r14,%r13,8), %xmm0          # xmm0 = mem[0],zero
	movq	%rbp, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	24(%r14,%r13,8), %xmm0          # xmm0 = mem[0],zero
	movq	%rbp, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	32(%r14,%r13,8), %xmm0          # xmm0 = mem[0],zero
	movq	%rbp, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	40(%r14,%r13,8), %xmm0          # xmm0 = mem[0],zero
	movq	%rbp, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	48(%r14,%r13,8), %xmm0          # xmm0 = mem[0],zero
	movq	%rbp, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	56(%r14,%r13,8), %xmm0          # xmm0 = mem[0],zero
	movq	%rbp, %rdi
	movb	$1, %al
	callq	printf@PLT
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx,%rbp,8), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	incq	%rbp
	cmpq	%rbp, %r15
	jne	.LBB0_6
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=1
	movl	$10, %edi
	callq	putchar@PLT
	movq	16(%rsp), %rsi                  # 8-byte Reload
	incq	%rsi
	addq	(%rsp), %rbx                    # 8-byte Folded Reload
	movq	8(%rsp), %rbp                   # 8-byte Reload
	cmpq	%rbp, %rsi
	jne	.LBB0_5
	jmp	.LBB0_8
.LBB0_2:
	addq	$68, %r14
	xorl	%ebx, %ebx
	leaq	.L.str(%rip), %r15
	leaq	.L.str.1(%rip), %r12
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%r14), %edx
	movl	(%r14), %ecx
	vmovsd	-68(%r14), %xmm0                # xmm0 = mem[0],zero
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	-60(%r14), %xmm0                # xmm0 = mem[0],zero
	movq	%r12, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	-52(%r14), %xmm0                # xmm0 = mem[0],zero
	movq	%r12, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	-44(%r14), %xmm0                # xmm0 = mem[0],zero
	movq	%r12, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	-36(%r14), %xmm0                # xmm0 = mem[0],zero
	movq	%r12, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	-28(%r14), %xmm0                # xmm0 = mem[0],zero
	movq	%r12, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	-20(%r14), %xmm0                # xmm0 = mem[0],zero
	movq	%r12, %rdi
	movb	$1, %al
	callq	printf@PLT
	vmovsd	-12(%r14), %xmm0                # xmm0 = mem[0],zero
	movq	%r12, %rdi
	movb	$1, %al
	callq	printf@PLT
	movl	$10, %edi
	callq	putchar@PLT
	incq	%rbx
	addq	$72, %r14
	cmpq	%rbx, %rbp
	jne	.LBB0_3
.LBB0_8:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	dump_result, .Lfunc_end0-dump_result
	.cfi_endproc
                                        # -- End function
	.globl	show_performance                # -- Begin function show_performance
	.p2align	4, 0x90
	.type	show_performance,@function
show_performance:                       # @show_performance
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	leaq	-1(%rcx), %rax
	movslq	%edx, %rbp
	imulq	%r8, %rax
	testl	%ebp, %ebp
	jle	.LBB1_1
# %bb.4:
	movq	%rcx, %r14
	movq	%rsi, %r15
	vcvtsi2sd	%rax, %xmm0, %xmm0
	vmovsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	shlq	$3, %rax
	movq	%rax, (%rsp)                    # 8-byte Spill
	vcvtsi2sd	%rax, %xmm1, %xmm0
	vmovsd	%xmm0, 8(%rsp)                  # 8-byte Spill
	shlq	$3, %r14
	movq	$-1, %r13
	xorl	%ebx, %ebx
	movq	$-1, %r12
	.p2align	4, 0x90
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	movq	(%r15), %rax
	cmpq	%r13, %rax
	movq	%r13, %rcx
	cmovlq	%rax, %rcx
	cmpq	$-1, %r13
	movq	%rcx, %r13
	cmoveq	%rax, %r13
	movq	-8(%r15,%r14), %rcx
	addq	%r14, %r15
	cmpq	%r12, %rcx
	movq	%r12, %rdx
	cmovgq	%rcx, %rdx
	cmpq	$-1, %r12
	movq	%rdx, %r12
	cmoveq	%rcx, %r12
	subq	%rax, %rcx
	vcvtsi2sd	%rcx, %xmm3, %xmm1
	vdivsd	16(%rsp), %xmm1, %xmm0          # 8-byte Folded Reload
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	vmovsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	leaq	.L.str.4(%rip), %rsi
	movq	%rbx, %rdx
	movb	$2, %al
	callq	fprintf@PLT
	incq	%rbx
	cmpq	%rbx, %rbp
	jne	.LBB1_5
# %bb.2:
	subq	%r13, %r12
	vcvtsi2sd	%r12, %xmm3, %xmm0
	movq	(%rsp), %rax                    # 8-byte Reload
	jmp	.LBB1_3
.LBB1_1:
	shlq	$3, %rax
	vxorpd	%xmm0, %xmm0, %xmm0
.LBB1_3:
	imulq	%rbp, %rax
	vcvtsi2sd	%rax, %xmm3, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	.L.str.5(%rip), %rsi
	movb	$1, %al
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	fprintf@PLT                     # TAILCALL
.Lfunc_end1:
	.size	show_performance, .Lfunc_end1-show_performance
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI2_0:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	cmpl	$1, %edi
	jle	.LBB2_3
# %bb.1:
	movq	%rsi, %rbx
	movl	%edi, %ebp
	movq	8(%rsi), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtoll@PLT
	movq	%rax, %r14
	movq	%rax, (%rsp)
	cmpl	$2, %ebp
	je	.LBB2_4
# %bb.13:
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtoll@PLT
	movq	%rax, 16(%rsp)
	cmpl	$3, %ebp
	jbe	.LBB2_5
# %bb.14:
	movq	24(%rbx), %rdi
	xorl	%esi, %esi
	callq	strtod@PLT
	vmovsd	%xmm0, 32(%rsp)
	cmpl	$4, %ebp
	je	.LBB2_6
# %bb.16:
	movq	32(%rbx), %rdi
	xorl	%esi, %esi
	callq	strtod@PLT
	jmp	.LBB2_7
.LBB2_3:
	movq	$100, (%rsp)
	movl	$100, %r14d
.LBB2_4:
	movq	$1000000, 16(%rsp)              # imm = 0xF4240
.LBB2_5:
	movabsq	$4607092346807469998, %rax      # imm = 0x3FEFAE147AE147AE
	movq	%rax, 32(%rsp)
.LBB2_6:
	vmovsd	.LCPI2_0(%rip), %xmm0           # xmm0 = mem[0],zero
.LBB2_7:
	vmovsd	%xmm0, 64(%rsp)
	callq	omp_get_max_threads@PLT
	movslq	%eax, %r15
	leaq	(,%r15,8), %rax
	leaq	(%rax,%rax,8), %rdi
	movl	$1, %esi
	callq	calloc@PLT
	movq	%rax, 24(%rsp)
	imulq	%r15, %r14
	shlq	$3, %r14
	movl	$1, %esi
	movq	%r14, %rdi
	callq	calloc@PLT
	movq	%rax, 8(%rsp)
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	24(%rsp), %rbp
	leaq	8(%rsp), %rbx
	leaq	16(%rsp), %r10
	leaq	.L__unnamed_1(%rip), %rdi
	leaq	.omp_outlined.(%rip), %rdx
	leaq	40(%rsp), %rcx
	leaq	72(%rsp), %r8
	leaq	32(%rsp), %r9
	movl	$6, %esi
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	__kmpc_fork_call@PLT
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movq	24(%rsp), %rdi
	movq	8(%rsp), %rsi
	movq	(%rsp), %rcx
	movl	%r15d, %edx
	callq	dump_result
	movq	(%rsp), %r13
	leaq	-1(%r13), %rax
	imulq	16(%rsp), %rax
	testl	%r15d, %r15d
	jle	.LBB2_11
# %bb.8:
	movq	8(%rsp), %rbp
	vcvtsi2sd	%rax, %xmm1, %xmm0
	vmovsd	%xmm0, 56(%rsp)                 # 8-byte Spill
	shlq	$3, %rax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	vcvtsi2sd	%rax, %xmm1, %xmm0
	vmovsd	%xmm0, 48(%rsp)                 # 8-byte Spill
	shlq	$3, %r13
	movq	$-1, %r12
	xorl	%ebx, %ebx
	movq	$-1, %r14
	.p2align	4, 0x90
.LBB2_9:                                # =>This Inner Loop Header: Depth=1
	movq	(%rbp), %rax
	cmpq	%r12, %rax
	movq	%r12, %rcx
	cmovlq	%rax, %rcx
	cmpq	$-1, %r12
	movq	%rcx, %r12
	cmoveq	%rax, %r12
	movq	-8(%rbp,%r13), %rcx
	addq	%r13, %rbp
	cmpq	%r14, %rcx
	movq	%r14, %rdx
	cmovgq	%rcx, %rdx
	cmpq	$-1, %r14
	movq	%rdx, %r14
	cmoveq	%rcx, %r14
	subq	%rax, %rcx
	vcvtsi2sd	%rcx, %xmm3, %xmm1
	vdivsd	56(%rsp), %xmm1, %xmm0          # 8-byte Folded Reload
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	vmovsd	48(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	leaq	.L.str.4(%rip), %rsi
	movq	%rbx, %rdx
	movb	$2, %al
	callq	fprintf@PLT
	incq	%rbx
	cmpq	%rbx, %r15
	jne	.LBB2_9
# %bb.10:
	subq	%r12, %r14
	vcvtsi2sd	%r14, %xmm3, %xmm0
	movq	40(%rsp), %rax                  # 8-byte Reload
	jmp	.LBB2_12
.LBB2_11:
	shlq	$3, %rax
	vxorpd	%xmm0, %xmm0, %xmm0
.LBB2_12:
	imulq	%r15, %rax
	vcvtsi2sd	%rax, %xmm3, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	.L.str.5(%rip), %rsi
	movb	$1, %al
	callq	fprintf@PLT
	xorl	%eax, %eax
	addq	$72, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function .omp_outlined.
	.type	.omp_outlined.,@function
.omp_outlined.:                         # @.omp_outlined.
	.cfi_startproc
# %bb.0:
	movq	16(%rsp), %r10
	movq	8(%rsp), %rax
	vmovsd	(%rdx), %xmm0                   # xmm0 = mem[0],zero
	vmovsd	(%rcx), %xmm1                   # xmm1 = mem[0],zero
	movq	(%r8), %rdi
	movq	(%r9), %rsi
	movq	(%rax), %rdx
	movq	(%r10), %rcx
	jmp	thread_fun                      # TAILCALL
.Lfunc_end3:
	.size	.omp_outlined., .Lfunc_end3-.omp_outlined.
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function thread_fun
.LCPI4_0:
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.section	.rodata,"a",@progbits
	.p2align	6
.LCPI4_1:
	.quad	8                               # 0x8
	.quad	0                               # 0x0
	.quad	1                               # 0x1
	.quad	2                               # 0x2
	.quad	3                               # 0x3
	.zero	8
	.zero	8
	.zero	8
	.text
	.globl	thread_fun
	.p2align	4, 0x90
	.type	thread_fun,@function
thread_fun:                             # @thread_fun
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, (%rsp)                    # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %rbp
	movq	%rdi, %r15
	vmovaps	%xmm1, 32(%rsp)                 # 16-byte Spill
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	callq	omp_get_thread_num@PLT
                                        # kill: def $eax killed $eax def $rax
	leal	(,%rax,8), %ecx
	vcvtsi2sd	%ecx, %xmm2, %xmm0
	vmovd	%eax, %xmm1
	vpbroadcastd	%xmm1, %xmm1
	vpslld	$3, %xmm1, %xmm1
	vpor	.LCPI4_0(%rip), %xmm1, %xmm1
	vcvtdq2pd	%xmm1, %ymm1
	vmovapd	.LCPI4_1(%rip), %zmm2           # zmm2 = <8,0,1,2,3,u,u,u>
	vpermi2pd	%zmm0, %zmm1, %zmm2
	leal	5(,%rax,8), %ecx
	vcvtsi2sd	%ecx, %xmm3, %xmm0
	movb	$32, %cl
	kmovw	%ecx, %k1
	vbroadcastsd	%xmm0, %zmm2 {%k1}
	leal	6(,%rax,8), %ecx
	vcvtsi2sd	%ecx, %xmm3, %xmm0
	movb	$64, %cl
	kmovw	%ecx, %k1
	vbroadcastsd	%xmm0, %zmm2 {%k1}
	leal	7(,%rax,8), %ecx
	vcvtsi2sd	%ecx, %xmm3, %xmm0
	movb	$-128, %cl
	kmovw	%ecx, %k1
	vbroadcastsd	%xmm0, %zmm2 {%k1}
	vmovupd	%zmm2, 160(%rsp)                # 64-byte Spill
	movslq	%eax, %rbx
	vzeroupper
	callq	sched_getcpu@PLT
	leaq	(%rbx,%rbx,8), %rcx
	movq	%rcx, 8(%rsp)                   # 8-byte Spill
	movl	%eax, 64(%r15,%rcx,8)
	callq	mk_perf_event_counter
	movl	%edx, %r13d
	testq	%r12, %r12
	movq	%r15, 16(%rsp)                  # 8-byte Spill
	jle	.LBB4_13
# %bb.1:
	movq	%rax, %r14
	imulq	%r12, %rbx
	leaq	(%rbp,%rbx,8), %rbp
	movq	(%rsp), %rax                    # 8-byte Reload
	testq	%rax, %rax
	jle	.LBB4_2
# %bb.4:
	movq	%r12, 24(%rsp)                  # 8-byte Spill
	vbroadcastsd	96(%rsp), %zmm1         # 16-byte Folded Reload
	vbroadcastsd	32(%rsp), %zmm2         # 16-byte Folded Reload
	leaq	-1(%rax), %rbx
	movl	%eax, %r15d
	andl	$7, %r15d
	andq	$-8, %rax
	movq	%rax, (%rsp)                    # 8-byte Spill
	xorl	%r12d, %r12d
	vmovupd	%zmm1, 96(%rsp)                 # 64-byte Spill
	vmovupd	%zmm2, 32(%rsp)                 # 64-byte Spill
	jmp	.LBB4_5
	.p2align	4, 0x90
.LBB4_12:                               #   in Loop: Header=BB4_5 Depth=1
	vmovupd	%zmm0, 160(%rsp)                # 64-byte Spill
	#APP
	# end loop
	#NO_APP
	incq	%r12
	cmpq	24(%rsp), %r12                  # 8-byte Folded Reload
	je	.LBB4_13
.LBB4_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_8 Depth 2
                                        #     Child Loop BB4_11 Depth 2
	movq	%r14, %rdi
	movl	%r13d, %esi
	vzeroupper
	callq	perf_event_counter_get
	movq	%rax, (%rbp,%r12,8)
	#APP
	# begin loop
	#NO_APP
	cmpq	$7, %rbx
	jae	.LBB4_7
# %bb.6:                                #   in Loop: Header=BB4_5 Depth=1
	vmovupd	160(%rsp), %zmm0                # 64-byte Reload
	vmovupd	96(%rsp), %zmm1                 # 64-byte Reload
	vmovupd	32(%rsp), %zmm2                 # 64-byte Reload
	jmp	.LBB4_9
	.p2align	4, 0x90
.LBB4_7:                                #   in Loop: Header=BB4_5 Depth=1
	movq	(%rsp), %rax                    # 8-byte Reload
	vmovupd	160(%rsp), %zmm0                # 64-byte Reload
	vmovupd	96(%rsp), %zmm1                 # 64-byte Reload
	vmovupd	32(%rsp), %zmm2                 # 64-byte Reload
	.p2align	4, 0x90
.LBB4_8:                                #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vfmadd213pd	%zmm2, %zmm1, %zmm0     # zmm0 = (zmm1 * zmm0) + zmm2
	vfmadd213pd	%zmm2, %zmm1, %zmm0     # zmm0 = (zmm1 * zmm0) + zmm2
	vfmadd213pd	%zmm2, %zmm1, %zmm0     # zmm0 = (zmm1 * zmm0) + zmm2
	vfmadd213pd	%zmm2, %zmm1, %zmm0     # zmm0 = (zmm1 * zmm0) + zmm2
	vfmadd213pd	%zmm2, %zmm1, %zmm0     # zmm0 = (zmm1 * zmm0) + zmm2
	vfmadd213pd	%zmm2, %zmm1, %zmm0     # zmm0 = (zmm1 * zmm0) + zmm2
	vfmadd213pd	%zmm2, %zmm1, %zmm0     # zmm0 = (zmm1 * zmm0) + zmm2
	vfmadd213pd	%zmm2, %zmm1, %zmm0     # zmm0 = (zmm1 * zmm0) + zmm2
	addq	$-8, %rax
	jne	.LBB4_8
.LBB4_9:                                #   in Loop: Header=BB4_5 Depth=1
	testq	%r15, %r15
	je	.LBB4_12
# %bb.10:                               #   in Loop: Header=BB4_5 Depth=1
	movq	%r15, %rax
	.p2align	4, 0x90
.LBB4_11:                               #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vfmadd213pd	%zmm2, %zmm1, %zmm0     # zmm0 = (zmm1 * zmm0) + zmm2
	decq	%rax
	jne	.LBB4_11
	jmp	.LBB4_12
.LBB4_2:
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB4_3:                                # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%r13d, %esi
	callq	perf_event_counter_get
	movq	%rax, (%rbp,%rbx,8)
	#APP
	# begin loop
	#NO_APP
	#APP
	# end loop
	#NO_APP
	incq	%rbx
	cmpq	%rbx, %r12
	jne	.LBB4_3
.LBB4_13:
	cmpl	$-1, %r13d
	je	.LBB4_15
# %bb.14:
	movl	%r13d, %edi
	vzeroupper
	callq	close@PLT
.LBB4_15:
	vzeroupper
	callq	sched_getcpu@PLT
	movq	16(%rsp), %rcx                  # 8-byte Reload
	movq	8(%rsp), %rdx                   # 8-byte Reload
	movl	%eax, 68(%rcx,%rdx,8)
	vmovups	160(%rsp), %zmm0                # 64-byte Reload
	vmovups	%zmm0, (%rcx,%rdx,8)
	addq	$232, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	vzeroupper
	retq
.Lfunc_end4:
	.size	thread_fun, .Lfunc_end4-thread_fun
	.cfi_endproc
                                        # -- End function
	.globl	perf_event_open                 # -- Begin function perf_event_open
	.p2align	4, 0x90
	.type	perf_event_open,@function
perf_event_open:                        # @perf_event_open
	.cfi_startproc
# %bb.0:
	movq	%r8, %r9
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	%esi, %edx
	movq	%rdi, %rsi
	movl	$298, %edi                      # imm = 0x12A
	xorl	%eax, %eax
	jmp	syscall@PLT                     # TAILCALL
.Lfunc_end5:
	.size	perf_event_open, .Lfunc_end5-perf_event_open
	.cfi_endproc
                                        # -- End function
	.globl	mk_perf_event_counter           # -- Begin function mk_perf_event_counter
	.p2align	4, 0x90
	.type	mk_perf_event_counter,@function
mk_perf_event_counter:                  # @mk_perf_event_counter
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	andq	$-64, %rsp
	subq	$192, %rsp
	.cfi_offset %rbx, -24
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%zmm0, (%rsp)
	vmovups	%zmm0, 48(%rsp)
	movl	$112, 4(%rsp)
	movq	$97, 40(%rsp)
	movq	%rsp, %rsi
	movl	$298, %edi                      # imm = 0x12A
	xorl	%edx, %edx
	movl	$-1, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	xorl	%eax, %eax
	vzeroupper
	callq	syscall@PLT
	movq	%rax, %rbx
	cmpl	$-1, %ebx
	je	.LBB6_1
# %bb.2:
	movl	$9219, %esi                     # imm = 0x2403
	movl	%ebx, %edi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	ioctl@PLT
	cmpl	$-1, %eax
	je	.LBB6_4
# %bb.3:
	movl	$9216, %esi                     # imm = 0x2400
	movl	%ebx, %edi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	ioctl@PLT
	cmpl	$-1, %eax
	je	.LBB6_4
.LBB6_6:
	callq	pthread_self@PLT
	movl	%ebx, %edx
	leaq	-8(%rbp), %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB6_4:
	.cfi_def_cfa %rbp, 16
	leaq	.L.str.7(%rip), %rdi
	callq	perror@PLT
	movl	%ebx, %edi
	callq	close@PLT
	jmp	.LBB6_5
.LBB6_1:
	leaq	.L.str.6(%rip), %rdi
	callq	perror@PLT
.LBB6_5:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	.L.str.8(%rip), %rsi
	leaq	.L.str.9(%rip), %rdx
	movl	$85, %ecx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	$-1, %ebx
	jmp	.LBB6_6
.Lfunc_end6:
	.size	mk_perf_event_counter, .Lfunc_end6-mk_perf_event_counter
	.cfi_endproc
                                        # -- End function
	.globl	perf_event_counter_destroy      # -- Begin function perf_event_counter_destroy
	.p2align	4, 0x90
	.type	perf_event_counter_destroy,@function
perf_event_counter_destroy:             # @perf_event_counter_destroy
	.cfi_startproc
# %bb.0:
	cmpl	$-1, %esi
	je	.LBB7_1
# %bb.2:
	movl	%esi, %edi
	jmp	close@PLT                       # TAILCALL
.LBB7_1:
	retq
.Lfunc_end7:
	.size	perf_event_counter_destroy, .Lfunc_end7-perf_event_counter_destroy
	.cfi_endproc
                                        # -- End function
	.globl	perf_event_counter_get          # -- Begin function perf_event_counter_get
	.p2align	4, 0x90
	.type	perf_event_counter_get,@function
perf_event_counter_get:                 # @perf_event_counter_get
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%esi, %ebp
	movq	%rdi, %rbx
	callq	pthread_self@PLT
	cmpq	%rbx, %rax
	jne	.LBB8_1
# %bb.2:
	cmpl	$-1, %ebp
	je	.LBB8_3
# %bb.4:
	movq	%rsp, %rsi
	movl	$8, %edx
	movl	%ebp, %edi
	callq	read@PLT
	cmpq	$8, %rax
	jne	.LBB8_5
# %bb.7:
	movq	(%rsp), %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB8_3:
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB8_1:
	.cfi_def_cfa_offset 32
	movq	stderr@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdi
	leaq	.L.str.10(%rip), %rsi
	leaq	.L.str.9(%rip), %rdx
	movl	$109, %ecx
	movq	%rax, %r8
	movq	%rbx, %r9
	xorl	%eax, %eax
	callq	fprintf@PLT
	movq	$-1, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB8_5:
	.cfi_def_cfa_offset 32
	cmpq	$-1, %rax
	jne	.LBB8_6
# %bb.9:
	leaq	.L.str.11(%rip), %rdi
	callq	perror@PLT
	movl	$1, %edi
	callq	exit@PLT
.LBB8_6:
	leaq	.L.str.12(%rip), %rdi
	leaq	.L.str.9(%rip), %rsi
	leaq	.L__PRETTY_FUNCTION__.perf_event_counter_get(%rip), %rcx
	movl	$121, %edx
	callq	__assert_fail@PLT
.Lfunc_end8:
	.size	perf_event_counter_get, .Lfunc_end8-perf_event_counter_get
	.cfi_endproc
                                        # -- End function
	.globl	get_clock                       # -- Begin function get_clock
	.p2align	4, 0x90
	.type	get_clock,@function
get_clock:                              # @get_clock
	.cfi_startproc
# %bb.0:
	jmp	perf_event_counter_get          # TAILCALL
.Lfunc_end9:
	.size	get_clock, .Lfunc_end9-get_clock
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"thread=%ld vcore0=%u vcore1=%u x=%f"
	.size	.L.str, 36

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	",%f"
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	" %lld"
	.size	.L.str.2, 6

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"thread %ld : cycles/iter = %f, fmas/cycle = %f\n"
	.size	.L.str.4, 48

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"fmas/cycle = %f\n"
	.size	.L.str.5, 17

	.type	.L__unnamed_2,@object           # @0
.L__unnamed_2:
	.asciz	";unknown;unknown;0;0;;"
	.size	.L__unnamed_2, 23

	.type	.L__unnamed_1,@object           # @1
	.section	.data.rel.ro,"aw",@progbits
	.p2align	3
.L__unnamed_1:
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	0                               # 0x0
	.long	22                              # 0x16
	.quad	.L__unnamed_2
	.size	.L__unnamed_1, 24

	.type	.L.str.6,@object                # @.str.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6:
	.asciz	"perf_event_open"
	.size	.L.str.6, 16

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"ioctl"
	.size	.L.str.7, 6

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"%s:%d:warning: the environment does not support perf_event. CPU clock cannot be obtained\n"
	.size	.L.str.8, 90

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"./perf.h"
	.size	.L.str.9, 9

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"%s:%d:perf_event_counter_get: the caller thread (%ld) is invalid (!= %ld)\n"
	.size	.L.str.10, 75

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"read"
	.size	.L.str.11, 5

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"rd == sizeof(long long)"
	.size	.L.str.12, 24

	.type	.L__PRETTY_FUNCTION__.perf_event_counter_get,@object # @__PRETTY_FUNCTION__.perf_event_counter_get
.L__PRETTY_FUNCTION__.perf_event_counter_get:
	.asciz	"long long perf_event_counter_get(perf_event_counter_t)"
	.size	.L__PRETTY_FUNCTION__.perf_event_counter_get, 55

	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym .omp_outlined.
