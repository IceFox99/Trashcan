	.text
	.file	"axpb_scalar.c"
	.globl	axpb_scalar                     # -- Begin function axpb_scalar
	.p2align	4, 0x90
	.type	axpb_scalar,@function
axpb_scalar:                            # @axpb_scalar
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	testq	%rsi, %rsi
	jle	.LBB0_6
# %bb.1:
	leaq	-1(%rsi), %rcx
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
	vmovss	(%rdi,%rcx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, (%rdi,%rcx,4)
	vmovss	4(%rdi,%rcx,4), %xmm2           # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 4(%rdi,%rcx,4)
	vmovss	8(%rdi,%rcx,4), %xmm2           # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 8(%rdi,%rcx,4)
	vmovss	12(%rdi,%rcx,4), %xmm2          # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 12(%rdi,%rcx,4)
	addq	$4, %rcx
	cmpq	%rcx, %rsi
	jne	.LBB0_8
.LBB0_3:
	testq	%rax, %rax
	je	.LBB0_6
# %bb.4:
	leaq	(%rdi,%rcx,4), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	vmovss	(%rcx,%rdx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
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
	.size	axpb_scalar, .Lfunc_end0-axpb_scalar
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
