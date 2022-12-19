	.text
	.file	"fundef_decl_simd.c"
	.globl	fundef_decl_simd                # -- Begin function fundef_decl_simd
	.p2align	4, 0x90
	.type	fundef_decl_simd,@function
fundef_decl_simd:                       # @fundef_decl_simd
	.cfi_startproc
# %bb.0:
	vfmadd213ss	%xmm2, %xmm1, %xmm0     # xmm0 = (xmm1 * xmm0) + xmm2
	retq
.Lfunc_end0:
	.size	fundef_decl_simd, .Lfunc_end0-fundef_decl_simd
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
