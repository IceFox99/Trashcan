	.text
	.file	"make_vector.c"
	.globl	make_vector                     # -- Begin function make_vector
	.p2align	4, 0x90
	.type	make_vector,@function
make_vector:                            # @make_vector
	.cfi_startproc
# %bb.0:
	vinsertps	$16, %xmm5, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm5[0],xmm4[2,3]
	vinsertps	$32, %xmm6, %xmm4, %xmm4 # xmm4 = xmm4[0,1],xmm6[0],xmm4[3]
	vinsertps	$48, %xmm7, %xmm4, %xmm4 # xmm4 = xmm4[0,1,2],xmm7[0]
	vinsertps	$16, %xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0],xmm0[2,3]
	vinsertps	$32, %xmm2, %xmm0, %xmm0 # xmm0 = xmm0[0,1],xmm2[0],xmm0[3]
	vmovss	8(%rsp), %xmm1                  # xmm1 = mem[0],zero,zero,zero
	vinsertps	$16, 16(%rsp), %xmm1, %xmm1 # xmm1 = xmm1[0],mem[0],xmm1[2,3]
	vinsertps	$32, 24(%rsp), %xmm1, %xmm1 # xmm1 = xmm1[0,1],mem[0],xmm1[3]
	vinsertps	$48, 32(%rsp), %xmm1, %xmm1 # xmm1 = xmm1[0,1,2],mem[0]
	vinsertps	$48, %xmm3, %xmm0, %xmm0 # xmm0 = xmm0[0,1,2],xmm3[0]
	vmovss	40(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	vinsertps	$16, 48(%rsp), %xmm2, %xmm2 # xmm2 = xmm2[0],mem[0],xmm2[2,3]
	vinsertps	$32, 56(%rsp), %xmm2, %xmm2 # xmm2 = xmm2[0,1],mem[0],xmm2[3]
	vinsertps	$48, 64(%rsp), %xmm2, %xmm2 # xmm2 = xmm2[0,1,2],mem[0]
	vinsertf128	$1, %xmm4, %ymm0, %ymm0
	vinsertf128	$1, %xmm2, %ymm1, %ymm1
	vinsertf64x4	$1, %ymm1, %zmm0, %zmm0
	retq
.Lfunc_end0:
	.size	make_vector, .Lfunc_end0-make_vector
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
