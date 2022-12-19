	.text
	.file	"non_affine_idx.c"
	.globl	non_affine_idx                  # -- Begin function non_affine_idx
	.p2align	4, 0x90
	.type	non_affine_idx,@function
non_affine_idx:                         # @non_affine_idx
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	leaq	15(%rdx), %r8
	testq	%rdx, %rdx
	cmovnsq	%rdx, %r8
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rdx
	jl	.LBB0_9
# %bb.1:
	andq	$-16, %r8
	cmpq	$2, %r8
	movl	$1, %r10d
	cmovgeq	%r8, %r10
	movabsq	$9223372036854775792, %r11      # imm = 0x7FFFFFFFFFFFFFF0
	andq	%r10, %r11
	movl	$4, %ebx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_2 Depth=1
	xorl	%edx, %edx
	idivq	%r8
.LBB0_14:                               #   in Loop: Header=BB0_2 Depth=1
	vmovss	(%rdi,%rdx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 4(%rsi,%r9,4)
	leaq	2(%r9), %rax
	addq	%rbx, %rcx
	addq	$8, %rbx
	cmpq	%rax, %r11
	je	.LBB0_4
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movq	%rax, %r9
	imulq	%rax, %rax
	movq	%rax, %rdx
	orq	%r8, %rdx
	shrq	$32, %rdx
	je	.LBB0_3
# %bb.10:                               #   in Loop: Header=BB0_2 Depth=1
	xorl	%edx, %edx
	idivq	%r8
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_3:                                #   in Loop: Header=BB0_2 Depth=1
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%r8d
                                        # kill: def $edx killed $edx def $rdx
.LBB0_11:                               #   in Loop: Header=BB0_2 Depth=1
	vmovss	(%rdi,%rdx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, (%rsi,%r9,4)
	leaq	1(%r9), %rax
	imulq	%rax, %rax
	movq	%rax, %rdx
	orq	%r8, %rdx
	shrq	$32, %rdx
	jne	.LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_2 Depth=1
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%r8d
                                        # kill: def $edx killed $edx def $rdx
	jmp	.LBB0_14
.LBB0_4:
	testb	$1, %r10b
	je	.LBB0_9
# %bb.5:
	movq	%rcx, %rax
	orq	%r8, %rax
	shrq	$32, %rax
	je	.LBB0_6
# %bb.7:
	movq	%rcx, %rax
	cqto
	idivq	%r8
	jmp	.LBB0_8
.LBB0_6:
	movl	%ecx, %eax
	xorl	%edx, %edx
	divl	%r8d
                                        # kill: def $edx killed $edx def $rdx
.LBB0_8:
	vfmadd231ss	(%rdi,%rdx,4), %xmm0, %xmm1 # xmm1 = (xmm0 * mem) + xmm1
	vmovss	%xmm1, 8(%rsi,%r9,4)
.LBB0_9:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	non_affine_idx, .Lfunc_end0-non_affine_idx
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
