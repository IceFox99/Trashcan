	.text
	.file	"mm_basic.cc"
	.globl	_Z4gemm6matrixS_S_              # -- Begin function _Z4gemm6matrixS_S_
	.p2align	4, 0x90
	.type	_Z4gemm6matrixS_S_,@function
_Z4gemm6matrixS_S_:                     # @_Z4gemm6matrixS_S_
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
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	120(%rsp), %rax
	movq	%rax, -56(%rsp)                 # 8-byte Spill
	testq	%rax, %rax
	jle	.LBB0_17
# %bb.1:
	movq	128(%rsp), %r12
	testq	%r12, %r12
	jle	.LBB0_17
# %bb.2:
	leaq	120(%rsp), %rax
	movq	64(%rsp), %r13
	movq	16(%rax), %r9
	movq	24(%rax), %rsi
	testq	%r13, %r13
	jle	.LBB0_3
# %bb.7:
	leaq	88(%rsp), %rcx
	leaq	56(%rsp), %rax
	movq	16(%rax), %rbp
	movq	24(%rax), %rdx
	movq	16(%rcx), %rax
	movq	24(%rcx), %rcx
	movq	%rcx, -48(%rsp)                 # 8-byte Spill
	movq	%r13, %rbx
	andq	$-2, %rbx
	movq	%rdx, -8(%rsp)                  # 8-byte Spill
	addq	$4, %rdx
	movq	%rbp, -32(%rsp)                 # 8-byte Spill
	leaq	(,%rbp,4), %rcx
	movq	%rcx, -40(%rsp)                 # 8-byte Spill
	leaq	(,%rax,8), %rcx
	xorl	%edi, %edi
	movq	%r9, -24(%rsp)                  # 8-byte Spill
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_16:                               #   in Loop: Header=BB0_8 Depth=1
	movq	-16(%rsp), %rdi                 # 8-byte Reload
	incq	%rdi
	addq	-40(%rsp), %rdx                 # 8-byte Folded Reload
	cmpq	-56(%rsp), %rdi                 # 8-byte Folded Reload
	movq	-24(%rsp), %r9                  # 8-byte Reload
	je	.LBB0_17
.LBB0_8:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
                                        #       Child Loop BB0_12 Depth 3
	movq	-32(%rsp), %r11                 # 8-byte Reload
	imulq	%rdi, %r11
	movq	%rdi, -16(%rsp)                 # 8-byte Spill
	imulq	%rdi, %r9
	movq	-48(%rsp), %r15                 # 8-byte Reload
	xorl	%r8d, %r8d
	jmp	.LBB0_9
	.p2align	4, 0x90
.LBB0_15:                               #   in Loop: Header=BB0_9 Depth=2
	#APP
	# loop ends
	#NO_APP
	leaq	(%r9,%r8), %rbp
	vaddss	(%rsi,%rbp,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rsi,%rbp,4)
	incq	%r8
	addq	$4, %r15
	cmpq	%r12, %r8
	je	.LBB0_16
.LBB0_9:                                #   Parent Loop BB0_8 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_12 Depth 3
	#APP
	# loop begins
	#NO_APP
	cmpq	$1, %r13
	jne	.LBB0_11
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=2
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%r10d, %r10d
	jmp	.LBB0_13
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_9 Depth=2
	vxorps	%xmm1, %xmm1, %xmm1
	movq	%r15, %r14
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB0_12:                               #   Parent Loop BB0_8 Depth=1
                                        #     Parent Loop BB0_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovss	-4(%rdx,%r10,4), %xmm0          # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%r10,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd132ss	(%r14), %xmm1, %xmm0    # xmm0 = (xmm0 * mem) + xmm1
	vfmadd231ss	(%r14,%rax,4), %xmm2, %xmm0 # xmm0 = (xmm2 * mem) + xmm0
	addq	$2, %r10
	addq	%rcx, %r14
	vmovaps	%xmm0, %xmm1
	cmpq	%r10, %rbx
	jne	.LBB0_12
.LBB0_13:                               #   in Loop: Header=BB0_9 Depth=2
	testb	$1, %r13b
	je	.LBB0_15
# %bb.14:                               #   in Loop: Header=BB0_9 Depth=2
	leaq	(%r11,%r10), %rbp
	movq	-8(%rsp), %rdi                  # 8-byte Reload
	vmovss	(%rdi,%rbp,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	imulq	%rax, %r10
	addq	%r8, %r10
	movq	-48(%rsp), %rdi                 # 8-byte Reload
	vfmadd231ss	(%rdi,%r10,4), %xmm1, %xmm0 # xmm0 = (xmm1 * mem) + xmm0
	jmp	.LBB0_15
.LBB0_3:
	shlq	$2, %r9
	xorl	%eax, %eax
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#APP
	# loop begins
	#NO_APP
	#APP
	# loop ends
	#NO_APP
	vaddss	(%rsi,%rcx,4), %xmm0, %xmm1
	vmovss	%xmm1, (%rsi,%rcx,4)
	incq	%rcx
	cmpq	%rcx, %r12
	jne	.LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	incq	%rax
	addq	%r9, %rsi
	cmpq	-56(%rsp), %rax                 # 8-byte Folded Reload
	jne	.LBB0_4
.LBB0_17:
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
	.size	_Z4gemm6matrixS_S_, .Lfunc_end0-_Z4gemm6matrixS_S_
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
