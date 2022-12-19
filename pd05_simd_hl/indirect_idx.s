	.text
	.file	"indirect_idx.c"
	.globl	indirect_idx                    # -- Begin function indirect_idx
	.p2align	4, 0x90
	.type	indirect_idx,@function
indirect_idx:                           # @indirect_idx
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rcx
	jl	.LBB0_3
# %bb.1:
	andq	$-16, %rcx
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movq	(%rsi,%r8,8), %rax
	vmovss	(%rdi,%rax,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, (%rdx,%r8,4)
	movq	8(%rsi,%r8,8), %rax
	vmovss	(%rdi,%rax,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 4(%rdx,%r8,4)
	movq	16(%rsi,%r8,8), %rax
	vmovss	(%rdi,%rax,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 8(%rdx,%r8,4)
	movq	24(%rsi,%r8,8), %rax
	vmovss	(%rdi,%rax,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 12(%rdx,%r8,4)
	addq	$4, %r8
	cmpq	%r8, %rcx
	jne	.LBB0_2
.LBB0_3:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	retq
.Lfunc_end0:
	.size	indirect_idx, .Lfunc_end0-indirect_idx
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
