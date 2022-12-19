	.text
	.file	"stride_store.c"
	.section	.rodata,"a",@progbits
	.p2align	6                               # -- Begin function stride_store
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
	.quad	64                              # 0x40
.LCPI0_3:
	.quad	16                              # 0x10
	.text
	.globl	stride_store
	.p2align	4, 0x90
	.type	stride_store,@function
stride_store:                           # @stride_store
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	cmpq	$16, %rdx
	jl	.LBB0_11
# %bb.1:
	andq	$-16, %rdx
	je	.LBB0_2
# %bb.4:
	vbroadcastss	%xmm0, %zmm0
	vbroadcastss	%xmm1, %zmm1
	addq	$-16, %rdx
	movq	%rdx, %rcx
	shrq	$4, %rcx
	incq	%rcx
	movl	%ecx, %eax
	andl	$3, %eax
	cmpq	$48, %rdx
	jae	.LBB0_6
# %bb.5:
	vmovaps	.LCPI0_0(%rip), %zmm2           # zmm2 = [8,9,10,11,12,13,14,15]
	vmovaps	.LCPI0_1(%rip), %zmm3           # zmm3 = [0,1,2,3,4,5,6,7]
	xorl	%edx, %edx
	jmp	.LBB0_8
.LBB0_2:
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	vmovss	(%rdi,%rax,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	vmovss	%xmm2, (%rsi,%rax,8)
	incq	%rax
	cmpq	%rax, %rdx
	jne	.LBB0_3
	jmp	.LBB0_11
.LBB0_6:
	andq	$-4, %rcx
	vmovaps	.LCPI0_0(%rip), %zmm2           # zmm2 = [8,9,10,11,12,13,14,15]
	vmovaps	.LCPI0_1(%rip), %zmm3           # zmm3 = [0,1,2,3,4,5,6,7]
	xorl	%edx, %edx
	vpbroadcastq	.LCPI0_2(%rip), %zmm4   # zmm4 = [64,64,64,64,64,64,64,64]
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	vmovups	(%rdi,%rdx,4), %zmm5
	vfmadd213ps	%zmm1, %zmm0, %zmm5     # zmm5 = (zmm0 * zmm5) + zmm1
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm5, (%rsi,%zmm3,8) {%k1}
	vextractf64x4	$1, %zmm5, %ymm5
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm5, (%rsi,%zmm2,8) {%k1}
	vmovups	64(%rdi,%rdx,4), %zmm5
	vfmadd213ps	%zmm1, %zmm0, %zmm5     # zmm5 = (zmm0 * zmm5) + zmm1
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm5, 128(%rsi,%zmm3,8) {%k1}
	vextractf64x4	$1, %zmm5, %ymm5
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm5, 128(%rsi,%zmm2,8) {%k1}
	vmovups	128(%rdi,%rdx,4), %zmm5
	vfmadd213ps	%zmm1, %zmm0, %zmm5     # zmm5 = (zmm0 * zmm5) + zmm1
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm5, 256(%rsi,%zmm3,8) {%k1}
	vextractf64x4	$1, %zmm5, %ymm5
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm5, 256(%rsi,%zmm2,8) {%k1}
	vmovups	192(%rdi,%rdx,4), %zmm5
	vfmadd213ps	%zmm1, %zmm0, %zmm5     # zmm5 = (zmm0 * zmm5) + zmm1
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm5, 384(%rsi,%zmm3,8) {%k1}
	vextractf64x4	$1, %zmm5, %ymm5
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm5, 384(%rsi,%zmm2,8) {%k1}
	addq	$64, %rdx
	vpaddq	%zmm4, %zmm3, %zmm3
	vpaddq	%zmm4, %zmm2, %zmm2
	addq	$-4, %rcx
	jne	.LBB0_7
.LBB0_8:
	testq	%rax, %rax
	je	.LBB0_11
# %bb.9:
	leaq	(%rdi,%rdx,4), %rcx
	shlq	$6, %rax
	xorl	%edx, %edx
	vpbroadcastq	.LCPI0_3(%rip), %zmm4   # zmm4 = [16,16,16,16,16,16,16,16]
	.p2align	4, 0x90
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	vmovups	(%rcx,%rdx), %zmm5
	vfmadd213ps	%zmm1, %zmm0, %zmm5     # zmm5 = (zmm0 * zmm5) + zmm1
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm5, (%rsi,%zmm3,8) {%k1}
	vextractf64x4	$1, %zmm5, %ymm5
	kxnorw	%k0, %k0, %k1
	vscatterqps	%ymm5, (%rsi,%zmm2,8) {%k1}
	vpaddq	%zmm4, %zmm3, %zmm3
	vpaddq	%zmm4, %zmm2, %zmm2
	addq	$64, %rdx
	cmpq	%rdx, %rax
	jne	.LBB0_10
.LBB0_11:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	vzeroupper
	retq
.Lfunc_end0:
	.size	stride_store, .Lfunc_end0-stride_store
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
