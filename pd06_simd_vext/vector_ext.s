	.text
	.file	"vector_ext.c"
	.globl	dist_4                          # -- Begin function dist_4
	.p2align	4, 0x90
	.type	dist_4,@function
dist_4:                                 # @dist_4
	.cfi_startproc
# %bb.0:
	vmulps	%xmm1, %xmm1, %xmm1
	vfmadd213ps	%xmm1, %xmm0, %xmm0     # xmm0 = (xmm0 * xmm0) + xmm1
	retq
.Lfunc_end0:
	.size	dist_4, .Lfunc_end0-dist_4
	.cfi_endproc
                                        # -- End function
	.globl	dist_8                          # -- Begin function dist_8
	.p2align	4, 0x90
	.type	dist_8,@function
dist_8:                                 # @dist_8
	.cfi_startproc
# %bb.0:
	vmulps	%ymm1, %ymm1, %ymm1
	vfmadd213ps	%ymm1, %ymm0, %ymm0     # ymm0 = (ymm0 * ymm0) + ymm1
	retq
.Lfunc_end1:
	.size	dist_8, .Lfunc_end1-dist_8
	.cfi_endproc
                                        # -- End function
	.globl	dist_16                         # -- Begin function dist_16
	.p2align	4, 0x90
	.type	dist_16,@function
dist_16:                                # @dist_16
	.cfi_startproc
# %bb.0:
	vmulps	%zmm1, %zmm1, %zmm1
	vfmadd213ps	%zmm1, %zmm0, %zmm0     # zmm0 = (zmm0 * zmm0) + zmm1
	retq
.Lfunc_end2:
	.size	dist_16, .Lfunc_end2-dist_16
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
