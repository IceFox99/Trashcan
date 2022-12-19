	.text
	.file	"funcall.c"
	.globl	funcall                         # -- Begin function funcall
	.p2align	4, 0x90
	.type	funcall,@function
funcall:                                # @funcall
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rsi
	jl	.LBB0_3
# %bb.1:
	movq	%rsi, %r14
	movq	%rdi, %r15
	andq	$-16, %r14
	xorl	%ebx, %ebx
	vmovss	%xmm1, 12(%rsp)                 # 4-byte Spill
	vmovss	%xmm0, 8(%rsp)                  # 4-byte Spill
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	vmovss	(%r15,%rbx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vmovss	12(%rsp), %xmm2                 # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	callq	f@PLT
	vmovss	%xmm0, (%r15,%rbx,4)
	incq	%rbx
	cmpq	%rbx, %r14
	jne	.LBB0_2
.LBB0_3:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	funcall, .Lfunc_end0-funcall
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
