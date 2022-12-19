	.text
	.file	"struct_load.c"
	.section	.rodata,"a",@progbits
	.p2align	6                               # -- Begin function struct_load
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
.LCPI0_2:
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
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI0_3:
	.quad	64                              # 0x40
.LCPI0_4:
	.quad	16                              # 0x10
	.text
	.globl	struct_load
	.p2align	4, 0x90
	.type	struct_load,@function
struct_load:                            # @struct_load
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rdx
	jl	.LBB0_11
# %bb.1:
	andq	$-16, %rdx
	cmpq	$17, %rdx
	jae	.LBB0_3
# %bb.2:
	xorl	%ecx, %ecx
	jmp	.LBB0_10
.LBB0_3:
	vbroadcastss	%xmm0, %zmm2
	vbroadcastss	%xmm1, %zmm3
	leaq	-32(%rdx), %rax
	movq	%rax, %rcx
	shrq	$4, %rcx
	incq	%rcx
	movl	%ecx, %r8d
	andl	$3, %r8d
	cmpq	$48, %rax
	jae	.LBB0_5
# %bb.4:
	vmovaps	.LCPI0_0(%rip), %zmm4           # zmm4 = [8,9,10,11,12,13,14,15]
	vmovaps	.LCPI0_1(%rip), %zmm5           # zmm5 = [0,1,2,3,4,5,6,7]
	xorl	%eax, %eax
	jmp	.LBB0_7
.LBB0_5:
	andq	$-4, %rcx
	vmovaps	.LCPI0_0(%rip), %zmm4           # zmm4 = [8,9,10,11,12,13,14,15]
	vmovaps	.LCPI0_1(%rip), %zmm5           # zmm5 = [0,1,2,3,4,5,6,7]
	xorl	%eax, %eax
	vmovaps	.LCPI0_2(%rip), %zmm6           # zmm6 = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30]
	vpbroadcastq	.LCPI0_3(%rip), %zmm7   # zmm7 = [64,64,64,64,64,64,64,64]
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	vmovups	(%rdi,%rax,8), %zmm8
	vpermt2ps	64(%rdi,%rax,8), %zmm6, %zmm8
	vfmadd213ps	%zmm3, %zmm2, %zmm8     # zmm8 = (zmm2 * zmm8) + zmm3
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm8, (%rsi,%zmm5,8) {%k1}
	vextractf64x4	$1, %zmm8, %ymm8
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm8, (%rsi,%zmm4,8) {%k1}
	vmovups	128(%rdi,%rax,8), %zmm8
	vpermt2ps	192(%rdi,%rax,8), %zmm6, %zmm8
	vfmadd213ps	%zmm3, %zmm2, %zmm8     # zmm8 = (zmm2 * zmm8) + zmm3
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm8, 128(%rsi,%zmm5,8) {%k1}
	vextractf64x4	$1, %zmm8, %ymm8
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm8, 128(%rsi,%zmm4,8) {%k1}
	vmovups	256(%rdi,%rax,8), %zmm8
	vpermt2ps	320(%rdi,%rax,8), %zmm6, %zmm8
	vfmadd213ps	%zmm3, %zmm2, %zmm8     # zmm8 = (zmm2 * zmm8) + zmm3
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm8, 256(%rsi,%zmm5,8) {%k1}
	vextractf64x4	$1, %zmm8, %ymm8
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm8, 256(%rsi,%zmm4,8) {%k1}
	vmovups	384(%rdi,%rax,8), %zmm8
	vpermt2ps	448(%rdi,%rax,8), %zmm6, %zmm8
	vfmadd213ps	%zmm3, %zmm2, %zmm8     # zmm8 = (zmm2 * zmm8) + zmm3
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm8, 384(%rsi,%zmm5,8) {%k1}
	vextractf64x4	$1, %zmm8, %ymm8
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm8, 384(%rsi,%zmm4,8) {%k1}
	addq	$64, %rax
	vpaddq	%zmm7, %zmm5, %zmm5
	vpaddq	%zmm7, %zmm4, %zmm4
	addq	$-4, %rcx
	jne	.LBB0_6
.LBB0_7:
	leaq	-16(%rdx), %rcx
	testq	%r8, %r8
	je	.LBB0_10
# %bb.8:
	leaq	(%rdi,%rax,8), %r9
	shlq	$7, %r8
	xorl	%eax, %eax
	vmovaps	.LCPI0_2(%rip), %zmm6           # zmm6 = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30]
	vpbroadcastq	.LCPI0_4(%rip), %zmm7   # zmm7 = [16,16,16,16,16,16,16,16]
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	vmovups	(%r9,%rax), %zmm8
	vpermt2ps	64(%r9,%rax), %zmm6, %zmm8
	vfmadd213ps	%zmm3, %zmm2, %zmm8     # zmm8 = (zmm2 * zmm8) + zmm3
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm8, (%rsi,%zmm5,8) {%k1}
	vextractf64x4	$1, %zmm8, %ymm8
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm8, (%rsi,%zmm4,8) {%k1}
	vpaddq	%zmm7, %zmm5, %zmm5
	vpaddq	%zmm7, %zmm4, %zmm4
	subq	$-128, %rax
	cmpq	%rax, %r8
	jne	.LBB0_9
	.p2align	4, 0x90
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	vmovss	(%rdi,%rcx,8), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, (%rsi,%rcx,8)
	incq	%rcx
	cmpq	%rcx, %rdx
	jne	.LBB0_10
.LBB0_11:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	vzeroupper
	retq
.Lfunc_end0:
	.size	struct_load, .Lfunc_end0-struct_load
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
