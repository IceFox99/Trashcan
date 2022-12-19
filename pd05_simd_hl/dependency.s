	.text
	.file	"dependency.c"
	.globl	dependency                      # -- Begin function dependency
	.p2align	4, 0x90
	.type	dependency,@function
dependency:                             # @dependency
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$2, %rsi
	jl	.LBB0_6
# %bb.1:
	vmovss	(%rdi), %xmm2                   # xmm2 = mem[0],zero,zero,zero
	leaq	-2(%rsi), %rcx
	decq	%rsi
	movl	%esi, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	.LBB0_7
# %bb.2:
	xorl	%ecx, %ecx
	jmp	.LBB0_3
.LBB0_7:
	andq	$-4, %rsi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 4(%rdi,%rcx,4)
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 8(%rdi,%rcx,4)
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 12(%rdi,%rcx,4)
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 16(%rdi,%rcx,4)
	addq	$4, %rcx
	cmpq	%rcx, %rsi
	jne	.LBB0_8
.LBB0_3:
	testq	%rax, %rax
	je	.LBB0_6
# %bb.4:
	leaq	(%rdi,%rcx,4), %rcx
	addq	$4, %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, (%rcx,%rdx,4)
	incq	%rdx
	cmpq	%rdx, %rax
	jne	.LBB0_5
.LBB0_6:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	retq
.Lfunc_end0:
	.size	dependency, .Lfunc_end0-dependency
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
