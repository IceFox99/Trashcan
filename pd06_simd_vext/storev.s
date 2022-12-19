	.text
	.file	"storev.c"
	.globl	storev                          # -- Begin function storev
	.p2align	4, 0x90
	.type	storev,@function
storev:                                 # @storev
	.cfi_startproc
# %bb.0:
	vmovups	%zmm0, (%rdi)
	vzeroupper
	retq
.Lfunc_end0:
	.size	storev, .Lfunc_end0-storev
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
