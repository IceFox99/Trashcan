	.text
	.file	"axpy_omp_simd.c"
	.globl	axpb_omp_simd                   # -- Begin function axpb_omp_simd
	.p2align	4, 0x90
	.type	axpb_omp_simd,@function
axpb_omp_simd:                          # @axpb_omp_simd
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rdx
	jl	.LBB0_11
# %bb.1:
	movq	%rdx, %r8
	andq	$-16, %r8
	je	.LBB0_2
# %bb.4:
	cmpq	$64, %r8
	jae	.LBB0_6
# %bb.5:
	xorl	%ecx, %ecx
	jmp	.LBB0_9
.LBB0_2:
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	vmovss	(%rdi,%rax,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, (%rsi,%rax,4)
	incq	%rax
	cmpq	%rax, %r8
	jne	.LBB0_3
	jmp	.LBB0_11
.LBB0_6:
	andl	$48, %edx
	movq	%r8, %rcx
	subq	%rdx, %rcx
	vbroadcastss	%xmm0, %zmm2
	vbroadcastss	%xmm1, %zmm3
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	vmovups	(%rdi,%rax,4), %zmm4
	vfmadd213ps	%zmm3, %zmm2, %zmm4     # zmm4 = (zmm2 * zmm4) + zmm3
	vmovups	64(%rdi,%rax,4), %zmm5
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vmovups	128(%rdi,%rax,4), %zmm6
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vmovups	192(%rdi,%rax,4), %zmm7
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vmovups	%zmm4, (%rsi,%rax,4)
	vmovups	%zmm5, 64(%rsi,%rax,4)
	vmovups	%zmm6, 128(%rsi,%rax,4)
	vmovups	%zmm7, 192(%rsi,%rax,4)
	addq	$64, %rax
	cmpq	%rax, %rcx
	jne	.LBB0_7
# %bb.8:
	testq	%rdx, %rdx
	je	.LBB0_11
.LBB0_9:
	vbroadcastss	%xmm0, %ymm0
	vbroadcastss	%xmm1, %ymm1
	.p2align	4, 0x90
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	vmovups	(%rdi,%rcx,4), %ymm2
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vmovups	%ymm2, (%rsi,%rcx,4)
	addq	$8, %rcx
	cmpq	%rcx, %r8
	jne	.LBB0_10
.LBB0_11:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	vzeroupper
	retq
.Lfunc_end0:
	.size	axpb_omp_simd, .Lfunc_end0-axpb_omp_simd
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
