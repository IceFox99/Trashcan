	.text
	.file	"loop_i.c"
	.globl	loop_i                          # -- Begin function loop_i
	.p2align	4, 0x90
	.type	loop_i,@function
loop_i:                                 # @loop_i
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rsi
	jl	.LBB0_10
# %bb.1:
	testq	%rdx, %rdx
	jle	.LBB0_10
# %bb.2:
	leaq	15(%rsi), %rax
	testq	%rsi, %rsi
	cmovnsq	%rsi, %rax
	andq	$-16, %rax
	cmpq	$2, %rax
	movl	$1, %r9d
	cmovgeq	%rax, %r9
	leaq	-1(%rdx), %r8
	movl	%edx, %esi
	andl	$7, %esi
	andq	$-8, %rdx
	xorl	%ecx, %ecx
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_9:                                #   in Loop: Header=BB0_3 Depth=1
	vmovss	%xmm2, (%rdi,%rcx,4)
	incq	%rcx
	cmpq	%r9, %rcx
	je	.LBB0_10
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_8 Depth 2
	vmovss	(%rdi,%rcx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	cmpq	$7, %r8
	jb	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movq	%rdx, %rax
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	addq	$-8, %rax
	jne	.LBB0_5
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
	testq	%rsi, %rsi
	je	.LBB0_9
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	movq	%rsi, %rax
	.p2align	4, 0x90
.LBB0_8:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	decq	%rax
	jne	.LBB0_8
	jmp	.LBB0_9
.LBB0_10:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	retq
.Lfunc_end0:
	.size	loop_i, .Lfunc_end0-loop_i
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
