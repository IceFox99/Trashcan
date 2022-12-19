	.text
	.file	"get_i.c"
	.globl	get_i                           # -- Begin function get_i
	.p2align	4, 0x90
	.type	get_i,@function
get_i:                                  # @get_i
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	andq	$-64, %rsp
	subq	$128, %rsp
                                        # kill: def $edi killed $edi def $rdi
	vmovaps	%zmm0, (%rsp)
	andl	$15, %edi
	vmovss	(%rsp,%rdi,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Lfunc_end0:
	.size	get_i, .Lfunc_end0-get_i
	.cfi_endproc
                                        # -- End function
	.type	n_float_lanes,@object           # @n_float_lanes
	.section	.rodata,"a",@progbits
	.globl	n_float_lanes
	.p2align	2
n_float_lanes:
	.long	16                              # 0x10
	.size	n_float_lanes, 4

	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
