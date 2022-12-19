	.text
	.file	"scalar_vector.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function axpb_16
.LCPI0_0:
	.long	0x40400000                      # float 3
	.text
	.globl	axpb_16
	.p2align	4, 0x90
	.type	axpb_16,@function
axpb_16:                                # @axpb_16
	.cfi_startproc
# %bb.0:
	vbroadcastss	%xmm0, %zmm0
	vfmadd213ps	.LCPI0_0(%rip){1to16}, %zmm1, %zmm0 # zmm0 = (zmm1 * zmm0) + mem
	retq
.Lfunc_end0:
	.size	axpb_16, .Lfunc_end0-axpb_16
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
