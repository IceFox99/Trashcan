	.text
	.file	"loop_v.c"
	.globl	loop_v                          # -- Begin function loop_v
	.p2align	4, 0x90
	.type	loop_v,@function
loop_v:                                 # @loop_v
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rsi
	jl	.LBB0_11
# %bb.1:
	andq	$-16, %rsi
	xorl	%eax, %eax
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_9:                                #   in Loop: Header=BB0_2 Depth=1
	vmovss	%xmm2, (%rdi,%rax,4)
.LBB0_10:                               #   in Loop: Header=BB0_2 Depth=1
	incq	%rax
	cmpq	%rsi, %rax
	je	.LBB0_11
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_8 Depth 2
	testq	%rax, %rax
	je	.LBB0_10
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	leaq	-1(%rax), %rcx
	vmovss	(%rdi,%rax,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	cmpq	$7, %rcx
	jb	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	movq	%rax, %rcx
	andq	$-8, %rcx
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	addq	$-8, %rcx
	jne	.LBB0_5
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	testb	$7, %al
	je	.LBB0_9
# %bb.7:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%eax, %ecx
	andl	$7, %ecx
	.p2align	4, 0x90
.LBB0_8:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	decq	%rcx
	jne	.LBB0_8
	jmp	.LBB0_9
.LBB0_11:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	retq
.Lfunc_end0:
	.size	loop_v, .Lfunc_end0-loop_v
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
