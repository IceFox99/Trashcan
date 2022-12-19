	.text
	.file	"uncertain_dependency.c"
	.globl	uncertain_dependency            # -- Begin function uncertain_dependency
	.p2align	4, 0x90
	.type	uncertain_dependency,@function
uncertain_dependency:                   # @uncertain_dependency
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rdx
	jl	.LBB0_12
# %bb.1:
	movq	%rdx, %r8
	andq	$-16, %r8
	je	.LBB0_3
# %bb.2:
	movq	%rsi, %rax
	subq	%rdi, %rax
	cmpq	$255, %rax
	jbe	.LBB0_3
# %bb.5:
	cmpq	$64, %r8
	jae	.LBB0_7
# %bb.6:
	xorl	%ecx, %ecx
	jmp	.LBB0_10
.LBB0_3:
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	vmovss	(%rdi,%rcx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, (%rsi,%rcx,4)
	vmovss	4(%rdi,%rcx,4), %xmm2           # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 4(%rsi,%rcx,4)
	vmovss	8(%rdi,%rcx,4), %xmm2           # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 8(%rsi,%rcx,4)
	vmovss	12(%rdi,%rcx,4), %xmm2          # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, 12(%rsi,%rcx,4)
	addq	$4, %rcx
	cmpq	%rcx, %r8
	jne	.LBB0_4
	jmp	.LBB0_12
.LBB0_7:
	andl	$48, %edx
	movq	%r8, %rcx
	subq	%rdx, %rcx
	vbroadcastss	%xmm0, %zmm2
	vbroadcastss	%xmm1, %zmm3
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
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
	jne	.LBB0_8
# %bb.9:
	testq	%rdx, %rdx
	je	.LBB0_12
.LBB0_10:
	vbroadcastss	%xmm0, %ymm0
	vbroadcastss	%xmm1, %ymm1
	.p2align	4, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	vmovups	(%rdi,%rcx,4), %ymm2
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vmovups	%ymm2, (%rsi,%rcx,4)
	addq	$8, %rcx
	cmpq	%rcx, %r8
	jne	.LBB0_11
.LBB0_12:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	vzeroupper
	retq
.Lfunc_end0:
	.size	uncertain_dependency, .Lfunc_end0-uncertain_dependency
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
