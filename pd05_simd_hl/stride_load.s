	.text
	.file	"stride_load.c"
	.section	.rodata,"a",@progbits
	.p2align	6                               # -- Begin function stride_load
.LCPI0_0:
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	4                               # 0x4
	.long	6                               # 0x6
	.long	8                               # 0x8
	.long	10                              # 0xa
	.long	12                              # 0xc
	.long	14                              # 0xe
	.long	16                              # 0x10
	.long	18                              # 0x12
	.long	20                              # 0x14
	.long	22                              # 0x16
	.long	24                              # 0x18
	.long	26                              # 0x1a
	.long	28                              # 0x1c
	.long	30                              # 0x1e
	.text
	.globl	stride_load
	.p2align	4, 0x90
	.type	stride_load,@function
stride_load:                            # @stride_load
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rdx
	jl	.LBB0_10
# %bb.1:
	movq	%rdx, %rax
	andq	$-16, %rax
	je	.LBB0_2
# %bb.3:
	cmpq	$65, %rax
	jae	.LBB0_5
# %bb.4:
	xorl	%ecx, %ecx
	jmp	.LBB0_7
.LBB0_2:
	xorl	%edx, %edx
	jmp	.LBB0_9
.LBB0_5:
	andl	$48, %edx
	movl	$64, %r8d
	cmovneq	%rdx, %r8
	movq	%rax, %rcx
	subq	%r8, %rcx
	vbroadcastss	%xmm0, %zmm2
	vbroadcastss	%xmm1, %zmm3
	xorl	%edx, %edx
	vmovaps	.LCPI0_0(%rip), %zmm4           # zmm4 = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30]
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	vmovups	(%rdi,%rdx,8), %zmm5
	vmovups	128(%rdi,%rdx,8), %zmm6
	vmovups	256(%rdi,%rdx,8), %zmm7
	vmovups	384(%rdi,%rdx,8), %zmm8
	vpermt2ps	64(%rdi,%rdx,8), %zmm4, %zmm5
	vpermt2ps	192(%rdi,%rdx,8), %zmm4, %zmm6
	vpermt2ps	320(%rdi,%rdx,8), %zmm4, %zmm7
	vpermt2ps	448(%rdi,%rdx,8), %zmm4, %zmm8
	vfmadd213ps	%zmm3, %zmm2, %zmm5     # zmm5 = (zmm2 * zmm5) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm6     # zmm6 = (zmm2 * zmm6) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm7     # zmm7 = (zmm2 * zmm7) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm8     # zmm8 = (zmm2 * zmm8) + zmm3
	vmovups	%zmm5, (%rsi,%rdx,4)
	vmovups	%zmm6, 64(%rsi,%rdx,4)
	vmovups	%zmm7, 128(%rsi,%rdx,4)
	vmovups	%zmm8, 192(%rsi,%rdx,4)
	addq	$64, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_6
.LBB0_7:
	leaq	-8(%rax), %rdx
	vbroadcastss	%xmm0, %ymm2
	vbroadcastss	%xmm1, %ymm3
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	vmovups	(%rdi,%rcx,8), %ymm4
	vshufps	$136, 32(%rdi,%rcx,8), %ymm4, %ymm4 # ymm4 = ymm4[0,2],mem[0,2],ymm4[4,6],mem[4,6]
	vpermpd	$216, %ymm4, %ymm4              # ymm4 = ymm4[0,2,1,3]
	vfmadd213ps	%ymm3, %ymm2, %ymm4     # ymm4 = (ymm2 * ymm4) + ymm3
	vmovups	%ymm4, (%rsi,%rcx,4)
	addq	$8, %rcx
	cmpq	%rcx, %rdx
	jne	.LBB0_8
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	vmovss	(%rdi,%rdx,8), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, (%rsi,%rdx,4)
	incq	%rdx
	cmpq	%rdx, %rax
	jne	.LBB0_9
.LBB0_10:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	vzeroupper
	retq
.Lfunc_end0:
	.size	stride_load, .Lfunc_end0-stride_load
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
