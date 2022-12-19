	.text
	.file	"sum.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function sum
.LCPI0_0:
	.long	0x80000000                      # float -0
	.section	.rodata,"a",@progbits
	.p2align	6
.LCPI0_1:
	.long	0x00000000                      # float 0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI0_2:
	.zero	4
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.long	0x80000000                      # float -0
	.text
	.globl	sum
	.p2align	4, 0x90
	.type	sum,@function
sum:                                    # @sum
	.cfi_startproc
# %bb.0:
	#APP
	# ========== loop begins ==========
	#NO_APP
	vxorps	%xmm0, %xmm0, %xmm0
	cmpq	$16, %rsi
	jl	.LBB0_19
# %bb.1:
	leaq	15(%rsi), %rcx
	testq	%rsi, %rsi
	cmovnsq	%rsi, %rcx
	andq	$-16, %rcx
	cmpq	$2, %rcx
	movl	$1, %eax
	cmovgeq	%rcx, %rax
	cmpq	$8, %rax
	jae	.LBB0_4
# %bb.2:
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	jmp	.LBB0_3
.LBB0_4:
	movabsq	$9223372036854775744, %r8       # imm = 0x7FFFFFFFFFFFFFC0
	cmpq	$64, %rax
	jae	.LBB0_6
# %bb.5:
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%ecx, %ecx
	jmp	.LBB0_14
.LBB0_6:
	movq	%rax, %rcx
	andq	%r8, %rcx
	leaq	-64(%rcx), %rdx
	movq	%rdx, %r9
	shrq	$6, %r9
	incq	%r9
	testq	%rdx, %rdx
	je	.LBB0_7
# %bb.8:
	movq	%r9, %rsi
	andq	$-2, %rsi
	vbroadcastss	.LCPI0_0(%rip), %zmm0   # zmm0 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vmovaps	.LCPI0_1(%rip), %zmm1           # zmm1 = [0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	xorl	%edx, %edx
	vmovaps	%zmm0, %zmm2
	vmovaps	%zmm0, %zmm3
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	vaddps	(%rdi,%rdx,4), %zmm1, %zmm1
	vaddps	64(%rdi,%rdx,4), %zmm0, %zmm0
	vaddps	128(%rdi,%rdx,4), %zmm2, %zmm2
	vaddps	192(%rdi,%rdx,4), %zmm3, %zmm3
	vaddps	256(%rdi,%rdx,4), %zmm1, %zmm1
	vaddps	320(%rdi,%rdx,4), %zmm0, %zmm0
	vaddps	384(%rdi,%rdx,4), %zmm2, %zmm2
	vaddps	448(%rdi,%rdx,4), %zmm3, %zmm3
	subq	$-128, %rdx
	addq	$-2, %rsi
	jne	.LBB0_9
# %bb.10:
	testb	$1, %r9b
	je	.LBB0_12
.LBB0_11:
	vaddps	(%rdi,%rdx,4), %zmm1, %zmm1
	vaddps	64(%rdi,%rdx,4), %zmm0, %zmm0
	vaddps	128(%rdi,%rdx,4), %zmm2, %zmm2
	vaddps	192(%rdi,%rdx,4), %zmm3, %zmm3
.LBB0_12:
	vaddps	%zmm1, %zmm0, %zmm0
	vaddps	%zmm0, %zmm2, %zmm0
	vaddps	%zmm0, %zmm3, %zmm0
	vmovshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
	vaddss	%xmm1, %xmm0, %xmm1
	vpermilpd	$1, %xmm0, %xmm2        # xmm2 = xmm0[1,0]
	vaddss	%xmm2, %xmm1, %xmm1
	vpermilps	$255, %xmm0, %xmm2      # xmm2 = xmm0[3,3,3,3]
	vaddss	%xmm2, %xmm1, %xmm1
	vextractf128	$1, %ymm0, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmovshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
	vaddss	%xmm3, %xmm1, %xmm1
	vpermilpd	$1, %xmm2, %xmm3        # xmm3 = xmm2[1,0]
	vaddss	%xmm3, %xmm1, %xmm1
	vpermilps	$255, %xmm2, %xmm2      # xmm2 = xmm2[3,3,3,3]
	vaddss	%xmm2, %xmm1, %xmm1
	vextractf32x4	$2, %zmm0, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmovshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
	vaddss	%xmm3, %xmm1, %xmm1
	vpermilpd	$1, %xmm2, %xmm3        # xmm3 = xmm2[1,0]
	vaddss	%xmm3, %xmm1, %xmm1
	vpermilps	$255, %xmm2, %xmm2      # xmm2 = xmm2[3,3,3,3]
	vaddss	%xmm2, %xmm1, %xmm1
	vextractf32x4	$3, %zmm0, %xmm0
	vaddss	%xmm0, %xmm1, %xmm1
	vmovshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
	vaddss	%xmm2, %xmm1, %xmm1
	vpermilpd	$1, %xmm0, %xmm2        # xmm2 = xmm0[1,0]
	vaddss	%xmm2, %xmm1, %xmm1
	vpermilps	$255, %xmm0, %xmm0      # xmm0 = xmm0[3,3,3,3]
	vaddss	%xmm0, %xmm1, %xmm0
	cmpq	%rcx, %rax
	je	.LBB0_18
# %bb.13:
	testb	$48, %al
	je	.LBB0_3
.LBB0_14:
	movq	%rcx, %rdx
	addq	$48, %r8
	movq	%r8, %rcx
	andq	%rax, %rcx
	vblendps	$254, .LCPI0_2(%rip), %ymm0, %ymm0 # ymm0 = ymm0[0],mem[1,2,3,4,5,6,7]
	.p2align	4, 0x90
.LBB0_15:                               # =>This Inner Loop Header: Depth=1
	vaddps	(%rdi,%rdx,4), %ymm0, %ymm0
	addq	$8, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_15
# %bb.16:
	vmovshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
	vaddss	%xmm1, %xmm0, %xmm1
	vpermilpd	$1, %xmm0, %xmm2        # xmm2 = xmm0[1,0]
	vaddss	%xmm2, %xmm1, %xmm1
	vpermilps	$255, %xmm0, %xmm2      # xmm2 = xmm0[3,3,3,3]
	vaddss	%xmm2, %xmm1, %xmm1
	vextractf128	$1, %ymm0, %xmm0
	vaddss	%xmm0, %xmm1, %xmm1
	vmovshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
	vaddss	%xmm2, %xmm1, %xmm1
	vpermilpd	$1, %xmm0, %xmm2        # xmm2 = xmm0[1,0]
	vaddss	%xmm2, %xmm1, %xmm1
	vpermilps	$255, %xmm0, %xmm0      # xmm0 = xmm0[3,3,3,3]
	vaddss	%xmm0, %xmm1, %xmm0
	jmp	.LBB0_17
.LBB0_7:
	vbroadcastss	.LCPI0_0(%rip), %zmm0   # zmm0 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vmovaps	.LCPI0_1(%rip), %zmm1           # zmm1 = [0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	xorl	%edx, %edx
	vmovaps	%zmm0, %zmm2
	vmovaps	%zmm0, %zmm3
	testb	$1, %r9b
	jne	.LBB0_11
	jmp	.LBB0_12
.LBB0_3:
	vaddss	(%rdi,%rcx,4), %xmm0, %xmm0
	incq	%rcx
.LBB0_17:
	cmpq	%rcx, %rax
	jne	.LBB0_3
.LBB0_18:
	vxorps	%xmm1, %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
.LBB0_19:
	#APP
	# ---------- loop ends ----------
	#NO_APP
	vzeroupper
	retq
.Lfunc_end0:
	.size	sum, .Lfunc_end0-sum
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
