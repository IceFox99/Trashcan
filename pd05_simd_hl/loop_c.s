	.text
	.file	"loop_c.c"
	.globl	loop_c                          # -- Begin function loop_c
	.p2align	4, 0x90
	.type	loop_c,@function
loop_c:                                 # @loop_c
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rsi
	jl	.LBB0_11
# %bb.1:
	movq	%rsi, %rax
	andq	$-16, %rax
	je	.LBB0_2
# %bb.4:
	cmpq	$64, %rax
	jae	.LBB0_6
# %bb.5:
	xorl	%ecx, %ecx
	jmp	.LBB0_9
.LBB0_2:
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	vmovss	(%rdi,%rcx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, (%rdi,%rcx,4)
	incq	%rcx
	cmpq	%rcx, %rax
	jne	.LBB0_3
	jmp	.LBB0_11
.LBB0_6:
	andl	$48, %esi
	movq	%rax, %rcx
	subq	%rsi, %rcx
	vbroadcastss	%xmm0, %zmm2
	vbroadcastss	%xmm1, %zmm3
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	vmovups	(%rdi,%rdx,4), %zmm4
	vfmadd213ps	%zmm3, %zmm2, %zmm4     # zmm4 = (zmm2 * zmm4) + zmm3
	vmovups	64(%rdi,%rdx,4), %zmm5
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vmovups	128(%rdi,%rdx,4), %zmm6
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vmovups	192(%rdi,%rdx,4), %zmm7
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm4     # zmm4 = (zmm2 * zmm4) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm4     # zmm4 = (zmm2 * zmm4) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm4     # zmm4 = (zmm2 * zmm4) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm4     # zmm4 = (zmm2 * zmm4) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm4     # zmm4 = (zmm2 * zmm4) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm4     # zmm4 = (zmm2 * zmm4) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm4     # zmm4 = (zmm2 * zmm4) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm4     # zmm4 = (zmm2 * zmm4) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm4     # zmm4 = (zmm2 * zmm4) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vmovups	%zmm4, (%rdi,%rdx,4)
	vmovups	%zmm5, 64(%rdi,%rdx,4)
	vmovups	%zmm6, 128(%rdi,%rdx,4)
	vmovups	%zmm7, 192(%rdi,%rdx,4)
	addq	$64, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_7
# %bb.8:
	testq	%rsi, %rsi
	je	.LBB0_11
.LBB0_9:
	vbroadcastss	%xmm0, %ymm0
	vbroadcastss	%xmm1, %ymm1
	.p2align	4, 0x90
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	vmovups	(%rdi,%rcx,4), %ymm2
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vfmadd213ps	%ymm1, %ymm0, %ymm2     # ymm2 = (ymm0 * ymm2) + ymm1
	vmovups	%ymm2, (%rdi,%rcx,4)
	addq	$8, %rcx
	cmpq	%rcx, %rax
	jne	.LBB0_10
.LBB0_11:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	vzeroupper
	retq
.Lfunc_end0:
	.size	loop_c, .Lfunc_end0-loop_c
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
