	.text
	.file	"def_vector_type.c"
	.globl	distv                           # -- Begin function distv
	.p2align	4, 0x90
	.type	distv,@function
distv:                                  # @distv
	.cfi_startproc
# %bb.0:
	vmulps	%zmm1, %zmm1, %zmm1
	vfmadd213ps	%zmm1, %zmm0, %zmm0     # zmm0 = (zmm0 * zmm0) + zmm1
	retq
.Lfunc_end0:
	.size	distv, .Lfunc_end0-distv
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
