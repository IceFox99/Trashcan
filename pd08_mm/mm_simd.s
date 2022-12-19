	.text
	.file	"mm_simd.cc"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function _Z4gemm6matrixS_S_
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
	.globl	_Z4gemm6matrixS_S_
	.p2align	4, 0x90
	.type	_Z4gemm6matrixS_S_,@function
_Z4gemm6matrixS_S_:                     # @_Z4gemm6matrixS_S_
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	120(%rsp), %rax
	movq	%rax, -104(%rsp)                # 8-byte Spill
	testq	%rax, %rax
	jle	.LBB0_29
# %bb.1:
	movq	128(%rsp), %rsi
	testq	%rsi, %rsi
	jle	.LBB0_29
# %bb.2:
	leaq	120(%rsp), %rax
	movq	64(%rsp), %rdi
	movq	16(%rax), %r15
	movq	24(%rax), %rdx
	testq	%rdi, %rdi
	jle	.LBB0_3
# %bb.7:
	leaq	88(%rsp), %rbx
	leaq	56(%rsp), %rbp
	movq	16(%rbp), %r8
	movq	24(%rbp), %r11
	movq	16(%rbx), %rax
	movq	24(%rbx), %r10
	cmpq	$8, %rdi
	setae	%r9b
	cmpq	$1, %rax
	sete	%bl
	andb	%r9b, %bl
	movb	%bl, -113(%rsp)                 # 1-byte Spill
	movq	%rdi, %r13
	andq	$-64, %r13
	movq	%rdi, %rbp
	andq	$-8, %rbp
	leaq	192(%r11), %rbx
	movq	%r8, -72(%rsp)                  # 8-byte Spill
	leaq	(,%r8,4), %rcx
	movq	%rcx, -80(%rsp)                 # 8-byte Spill
	movq	%r10, -112(%rsp)                # 8-byte Spill
	leaq	192(%r10), %rcx
	movq	%rcx, -88(%rsp)                 # 8-byte Spill
	movq	%rax, %r14
	shlq	$8, %r14
	movq	%rax, %r8
	shlq	$5, %r8
	leaq	(,%rax,4), %rcx
	movq	%rcx, -48(%rsp)                 # 8-byte Spill
	movq	%rax, -96(%rsp)                 # 8-byte Spill
	leaq	(,%rax,8), %r10
	xorl	%ecx, %ecx
	vmovaps	.LCPI0_2(%rip), %ymm0           # ymm0 = <u,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0>
	vbroadcastss	.LCPI0_0(%rip), %zmm1   # zmm1 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vmovaps	.LCPI0_1(%rip), %zmm2           # zmm2 = [0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	movq	%r11, -40(%rsp)                 # 8-byte Spill
	movq	%rdx, -16(%rsp)                 # 8-byte Spill
	movq	%r15, -64(%rsp)                 # 8-byte Spill
	movq	%rsi, -24(%rsp)                 # 8-byte Spill
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_28:                               #   in Loop: Header=BB0_8 Depth=1
	movq	-56(%rsp), %rcx                 # 8-byte Reload
	incq	%rcx
	movq	-80(%rsp), %rax                 # 8-byte Reload
	addq	%rax, %rbx
	addq	%rax, %r11
	cmpq	-104(%rsp), %rcx                # 8-byte Folded Reload
	movq	-64(%rsp), %r15                 # 8-byte Reload
	je	.LBB0_29
.LBB0_8:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
                                        #       Child Loop BB0_14 Depth 3
                                        #       Child Loop BB0_19 Depth 3
                                        #       Child Loop BB0_26 Depth 3
	movq	-72(%rsp), %rax                 # 8-byte Reload
	imulq	%rcx, %rax
	movq	%rax, -32(%rsp)                 # 8-byte Spill
	movq	%r15, %rdx
	movq	%rcx, -56(%rsp)                 # 8-byte Spill
	imulq	%rcx, %rdx
	movq	%rdx, -8(%rsp)                  # 8-byte Spill
	movq	-112(%rsp), %r15                # 8-byte Reload
	movq	-88(%rsp), %rcx                 # 8-byte Reload
	xorl	%r9d, %r9d
	jmp	.LBB0_9
.LBB0_16:                               #   in Loop: Header=BB0_9 Depth=2
	vmovaps	%xmm3, %xmm4
	.p2align	4, 0x90
.LBB0_27:                               #   in Loop: Header=BB0_9 Depth=2
	#APP
	# loop ends
	#NO_APP
	movq	-8(%rsp), %rax                  # 8-byte Reload
	addq	%r9, %rax
	movq	-16(%rsp), %rcx                 # 8-byte Reload
	vaddss	(%rcx,%rax,4), %xmm4, %xmm3
	vmovss	%xmm3, (%rcx,%rax,4)
	incq	%r9
	movq	%r12, %rcx
	addq	$4, %rcx
	addq	$4, %r15
	movq	-24(%rsp), %rsi                 # 8-byte Reload
	cmpq	%rsi, %r9
	je	.LBB0_28
.LBB0_9:                                #   Parent Loop BB0_8 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_14 Depth 3
                                        #       Child Loop BB0_19 Depth 3
                                        #       Child Loop BB0_26 Depth 3
	#APP
	# loop begins
	#NO_APP
	cmpb	$0, -113(%rsp)                  # 1-byte Folded Reload
	je	.LBB0_10
# %bb.11:                               #   in Loop: Header=BB0_9 Depth=2
	cmpq	$64, %rdi
	jae	.LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_9 Depth=2
	movq	%rcx, %r12
	vxorps	%xmm3, %xmm3, %xmm3
	xorl	%eax, %eax
	jmp	.LBB0_18
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_9 Depth=2
	movq	%rcx, %r12
	vxorps	%xmm3, %xmm3, %xmm3
	xorl	%edx, %edx
	jmp	.LBB0_21
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_9 Depth=2
	movq	%rcx, %rdx
	xorl	%r12d, %r12d
	vmovaps	%zmm2, %zmm3
	vmovaps	%zmm1, %zmm4
	vmovaps	%zmm1, %zmm5
	vmovaps	%zmm1, %zmm6
	.p2align	4, 0x90
.LBB0_14:                               #   Parent Loop BB0_8 Depth=1
                                        #     Parent Loop BB0_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovups	-192(%rbx,%r12,4), %zmm7
	vmovups	-128(%rbx,%r12,4), %zmm8
	vmovups	-64(%rbx,%r12,4), %zmm9
	vmovups	(%rbx,%r12,4), %zmm10
	vfmadd231ps	-192(%rdx), %zmm7, %zmm3 # zmm3 = (zmm7 * mem) + zmm3
	vfmadd231ps	-128(%rdx), %zmm8, %zmm4 # zmm4 = (zmm8 * mem) + zmm4
	vfmadd231ps	-64(%rdx), %zmm9, %zmm5 # zmm5 = (zmm9 * mem) + zmm5
	vfmadd231ps	(%rdx), %zmm10, %zmm6   # zmm6 = (zmm10 * mem) + zmm6
	addq	$64, %r12
	addq	%r14, %rdx
	cmpq	%r12, %r13
	jne	.LBB0_14
# %bb.15:                               #   in Loop: Header=BB0_9 Depth=2
	vaddps	%zmm3, %zmm4, %zmm3
	vaddps	%zmm3, %zmm5, %zmm3
	vaddps	%zmm3, %zmm6, %zmm3
	vmovshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
	vaddss	%xmm4, %xmm3, %xmm4
	vpermilpd	$1, %xmm3, %xmm5        # xmm5 = xmm3[1,0]
	vaddss	%xmm5, %xmm4, %xmm4
	vpermilps	$255, %xmm3, %xmm5      # xmm5 = xmm3[3,3,3,3]
	vaddss	%xmm5, %xmm4, %xmm4
	vextractf128	$1, %ymm3, %xmm5
	vaddss	%xmm5, %xmm4, %xmm4
	vmovshdup	%xmm5, %xmm6            # xmm6 = xmm5[1,1,3,3]
	vaddss	%xmm6, %xmm4, %xmm4
	vpermilpd	$1, %xmm5, %xmm6        # xmm6 = xmm5[1,0]
	vaddss	%xmm6, %xmm4, %xmm4
	vpermilps	$255, %xmm5, %xmm5      # xmm5 = xmm5[3,3,3,3]
	vaddss	%xmm5, %xmm4, %xmm4
	vextractf32x4	$2, %zmm3, %xmm5
	vaddss	%xmm5, %xmm4, %xmm4
	vmovshdup	%xmm5, %xmm6            # xmm6 = xmm5[1,1,3,3]
	vaddss	%xmm6, %xmm4, %xmm4
	vpermilpd	$1, %xmm5, %xmm6        # xmm6 = xmm5[1,0]
	vaddss	%xmm6, %xmm4, %xmm4
	vpermilps	$255, %xmm5, %xmm5      # xmm5 = xmm5[3,3,3,3]
	vaddss	%xmm5, %xmm4, %xmm4
	vextractf32x4	$3, %zmm3, %xmm3
	vaddss	%xmm3, %xmm4, %xmm4
	vmovshdup	%xmm3, %xmm5            # xmm5 = xmm3[1,1,3,3]
	vaddss	%xmm5, %xmm4, %xmm4
	vpermilpd	$1, %xmm3, %xmm5        # xmm5 = xmm3[1,0]
	vaddss	%xmm5, %xmm4, %xmm4
	vpermilps	$255, %xmm3, %xmm3      # xmm3 = xmm3[3,3,3,3]
	vaddss	%xmm3, %xmm4, %xmm3
	movq	%rcx, %r12
	cmpq	%r13, %rdi
	je	.LBB0_16
# %bb.17:                               #   in Loop: Header=BB0_9 Depth=2
	movq	%r13, %rax
	movq	%r13, %rdx
	testb	$56, %dil
	je	.LBB0_21
.LBB0_18:                               #   in Loop: Header=BB0_9 Depth=2
	vblendps	$254, %ymm0, %ymm3, %ymm3       # ymm3 = ymm3[0],ymm0[1,2,3,4,5,6,7]
	movq	-96(%rsp), %rcx                 # 8-byte Reload
	imulq	%rax, %rcx
	addq	%r9, %rcx
	movq	-112(%rsp), %rdx                # 8-byte Reload
	leaq	(%rdx,%rcx,4), %rcx
	.p2align	4, 0x90
.LBB0_19:                               #   Parent Loop BB0_8 Depth=1
                                        #     Parent Loop BB0_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovups	(%r11,%rax,4), %ymm4
	vfmadd231ps	(%rcx), %ymm4, %ymm3    # ymm3 = (ymm4 * mem) + ymm3
	addq	$8, %rax
	addq	%r8, %rcx
	cmpq	%rax, %rbp
	jne	.LBB0_19
# %bb.20:                               #   in Loop: Header=BB0_9 Depth=2
	vmovshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
	vaddss	%xmm4, %xmm3, %xmm4
	vpermilpd	$1, %xmm3, %xmm5        # xmm5 = xmm3[1,0]
	vaddss	%xmm5, %xmm4, %xmm4
	vpermilps	$255, %xmm3, %xmm5      # xmm5 = xmm3[3,3,3,3]
	vaddss	%xmm5, %xmm4, %xmm4
	vextractf128	$1, %ymm3, %xmm3
	vaddss	%xmm3, %xmm4, %xmm4
	vmovshdup	%xmm3, %xmm5            # xmm5 = xmm3[1,1,3,3]
	vaddss	%xmm5, %xmm4, %xmm4
	vpermilpd	$1, %xmm3, %xmm5        # xmm5 = xmm3[1,0]
	vaddss	%xmm5, %xmm4, %xmm4
	vpermilps	$255, %xmm3, %xmm3      # xmm3 = xmm3[3,3,3,3]
	vaddss	%xmm3, %xmm4, %xmm3
	movq	%rbp, %rdx
	vmovaps	%xmm3, %xmm4
	cmpq	%rbp, %rdi
	je	.LBB0_27
.LBB0_21:                               #   in Loop: Header=BB0_9 Depth=2
	movq	%rdx, %rax
	orq	$1, %rax
	testb	$1, %dil
	jne	.LBB0_23
# %bb.22:                               #   in Loop: Header=BB0_9 Depth=2
                                        # implicit-def: $xmm4
	cmpq	%rax, %rdi
	je	.LBB0_27
	jmp	.LBB0_25
	.p2align	4, 0x90
.LBB0_23:                               #   in Loop: Header=BB0_9 Depth=2
	movq	-32(%rsp), %rcx                 # 8-byte Reload
	addq	%rdx, %rcx
	movq	-40(%rsp), %rsi                 # 8-byte Reload
	vmovss	(%rsi,%rcx,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	imulq	-96(%rsp), %rdx                 # 8-byte Folded Reload
	addq	%r9, %rdx
	movq	-112(%rsp), %rcx                # 8-byte Reload
	vfmadd231ss	(%rcx,%rdx,4), %xmm4, %xmm3 # xmm3 = (xmm4 * mem) + xmm3
	vmovaps	%xmm3, %xmm4
	movq	%rax, %rdx
	cmpq	%rax, %rdi
	je	.LBB0_27
.LBB0_25:                               #   in Loop: Header=BB0_9 Depth=2
	leaq	1(%rdx), %rax
	movq	-48(%rsp), %rsi                 # 8-byte Reload
	imulq	%rsi, %rax
	addq	%r15, %rax
	imulq	%rdx, %rsi
	addq	%r15, %rsi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_26:                               #   Parent Loop BB0_8 Depth=1
                                        #     Parent Loop BB0_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovss	(%r11,%rdx,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	vmovss	4(%r11,%rdx,4), %xmm5           # xmm5 = mem[0],zero,zero,zero
	vfmadd132ss	(%rsi,%rcx), %xmm3, %xmm4 # xmm4 = (xmm4 * mem) + xmm3
	vfmadd231ss	(%rax,%rcx), %xmm5, %xmm4 # xmm4 = (xmm5 * mem) + xmm4
	addq	$2, %rdx
	addq	%r10, %rcx
	vmovaps	%xmm4, %xmm3
	cmpq	%rdx, %rdi
	jne	.LBB0_26
	jmp	.LBB0_27
.LBB0_3:
	shlq	$2, %r15
	xorl	%eax, %eax
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#APP
	# loop begins
	#NO_APP
	#APP
	# loop ends
	#NO_APP
	vaddss	(%rdx,%rcx,4), %xmm0, %xmm1
	vmovss	%xmm1, (%rdx,%rcx,4)
	incq	%rcx
	cmpq	%rcx, %rsi
	jne	.LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	incq	%rax
	addq	%r15, %rdx
	cmpq	-104(%rsp), %rax                # 8-byte Folded Reload
	jne	.LBB0_4
.LBB0_29:
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	vzeroupper
	retq
.Lfunc_end0:
	.size	_Z4gemm6matrixS_S_, .Lfunc_end0-_Z4gemm6matrixS_S_
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __gxx_personality_v0
