	.text
	.file	"branch.c"
	.section	.rodata,"a",@progbits
	.p2align	6                               # -- Begin function branch
.LCPI0_0:
	.quad	8                               # 0x8
	.quad	9                               # 0x9
	.quad	10                              # 0xa
	.quad	11                              # 0xb
	.quad	12                              # 0xc
	.quad	13                              # 0xd
	.quad	14                              # 0xe
	.quad	15                              # 0xf
.LCPI0_1:
	.quad	0                               # 0x0
	.quad	1                               # 0x1
	.quad	2                               # 0x2
	.quad	3                               # 0x3
	.quad	4                               # 0x4
	.quad	5                               # 0x5
	.quad	6                               # 0x6
	.quad	7                               # 0x7
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI0_2:
	.quad	1                               # 0x1
.LCPI0_3:
	.quad	64                              # 0x40
	.text
	.globl	branch
	.p2align	4, 0x90
	.type	branch,@function
branch:                                 # @branch
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rsi
	jl	.LBB0_9
# %bb.1:
	movq	%rsi, %r8
	andq	$-16, %r8
	cmpq	$64, %r8
	jae	.LBB0_3
# %bb.2:
	xorl	%ecx, %ecx
	jmp	.LBB0_6
.LBB0_3:
	andl	$48, %esi
	movq	%r8, %rcx
	subq	%rsi, %rcx
	vbroadcastss	%xmm0, %zmm2
	vbroadcastss	%xmm1, %zmm3
	leaq	192(%rdi), %rdx
	vmovdqa64	.LCPI0_0(%rip), %zmm4   # zmm4 = [8,9,10,11,12,13,14,15]
	vmovdqa64	.LCPI0_1(%rip), %zmm5   # zmm5 = [0,1,2,3,4,5,6,7]
	xorl	%eax, %eax
	vpbroadcastq	.LCPI0_2(%rip), %zmm6   # zmm6 = [1,1,1,1,1,1,1,1]
	vpbroadcastq	.LCPI0_3(%rip), %zmm7   # zmm7 = [64,64,64,64,64,64,64,64]
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	vptestnmq	%zmm6, %zmm5, %k0
	vptestnmq	%zmm6, %zmm4, %k1
	kunpckbw	%k0, %k1, %k1
	vmovups	-192(%rdx,%rax,4), %zmm8 {%k1} {z}
	vmovups	-128(%rdx,%rax,4), %zmm9 {%k1} {z}
	vmovups	-64(%rdx,%rax,4), %zmm10 {%k1} {z}
	vmovups	(%rdx,%rax,4), %zmm11 {%k1} {z}
	vfmadd213ps	%zmm3, %zmm2, %zmm8     # zmm8 = (zmm2 * zmm8) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm9     # zmm9 = (zmm2 * zmm9) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm10    # zmm10 = (zmm2 * zmm10) + zmm3
	vfmadd213ps	%zmm3, %zmm2, %zmm11    # zmm11 = (zmm2 * zmm11) + zmm3
	vmovups	%zmm8, -192(%rdx,%rax,4) {%k1}
	vmovups	%zmm9, -128(%rdx,%rax,4) {%k1}
	vmovups	%zmm10, -64(%rdx,%rax,4) {%k1}
	vmovups	%zmm11, (%rdx,%rax,4) {%k1}
	addq	$64, %rax
	vpaddq	%zmm7, %zmm5, %zmm5
	vpaddq	%zmm7, %zmm4, %zmm4
	cmpq	%rax, %rcx
	jne	.LBB0_4
# %bb.5:
	testq	%rsi, %rsi
	jne	.LBB0_6
.LBB0_9:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	vzeroupper
	retq
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_6 Depth=1
	incq	%rcx
	cmpq	%rcx, %r8
	je	.LBB0_9
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	testb	$1, %cl
	jne	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	vmovss	(%rdi,%rcx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, (%rdi,%rcx,4)
	jmp	.LBB0_8
.Lfunc_end0:
	.size	branch, .Lfunc_end0-branch
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
