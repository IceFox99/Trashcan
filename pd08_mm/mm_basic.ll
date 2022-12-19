; ModuleID = 'mm_basic.cc'
target datalayout = "e-p:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define internal void @pgCplus_compiled.() noinline {
L.entry:
	ret void
}

%struct.matrix = type <{ i64, i64, i64, float*}> 



define dso_local void @_Z4gemm6matrixS_S_(%struct.matrix* byval(%struct.matrix) %A, %struct.matrix* byval(%struct.matrix) %B, %struct.matrix* byval(%struct.matrix) %C) #0 mustprogress !dbg !23 {
L.entry:
	%M.addr = alloca i64, align 8
	%N.addr = alloca i64, align 8
	%i.addr = alloca i64, align 8
	%.lcr050001.addr = alloca i64, align 8
	%.r1.0267.addr = alloca i64, align 8
	%.r1.0148.addr = alloca i8*, align 8
	%.r1.0047.addr = alloca i8*, align 8
	%j.addr = alloca i64, align 8
	%.lcr050002.addr = alloca i64, align 8
	%.r1.0155.addr = alloca i64, align 8
	%.r1.0083.addr = alloca i8*, align 8
	%c.addr = alloca float, align 4
	%.ndk0002.addr = alloca i64, align 8
	%.ndk0003.addr = alloca i64, align 8
	%.vind_1.addr = alloca i8*, align 8
	%.VR_c_0.addr = alloca <8 x float>, align 4
	%.G0014.addr = alloca i8*, align 8
	%.G0012.addr = alloca i8*, align 8
	%.G0010.addr = alloca i8*, align 8
	%.G0008.addr = alloca i8*, align 8
	%.G0006.addr = alloca i8*, align 8
	%.G0004.addr = alloca i8*, align 8
	%.G0002.addr = alloca i8*, align 8
	%.G0000.addr = alloca i8*, align 8
	%.G0016.addr = alloca i8*, align 8
	%.inl_i_16.addr = alloca i64, align 8
	%.inl_j_17.addr = alloca i64, align 8

	%0 = bitcast %struct.matrix* %C to i64*, !dbg !49
	%1 = load i64, i64*  %0, align 8, !tbaa !66, !dbg !49
	store i64  %1, i64* %M.addr, align 8, !tbaa !68, !dbg !49
	%2 = bitcast %struct.matrix* %C to i8*, !dbg !50
	%3 = getelementptr i8, i8*  %2, i64 8, !dbg !50
	%4 = bitcast i8*  %3 to i64*, !dbg !50
	%5 = load i64, i64*  %4, align 8, !tbaa !66, !dbg !50
	store i64  %5, i64* %N.addr, align 8, !tbaa !68, !dbg !50
	store i64 0, i64* %i.addr, align 8, !tbaa !68, !dbg !32
	%6 = icmp sle i64  %1, 0, !dbg !32
	br i1  %6, label %L.B0002, label %L.B0035, !dbg !32
L.B0035:
	store i64  %1, i64* %.lcr050001.addr, align 8, !tbaa !70, !dbg !32
	%7 = bitcast %struct.matrix* %A to i8*, !dbg !32
	%8 = getelementptr i8, i8*  %7, i64 8, !dbg !32
	%9 = bitcast i8*  %8 to i64*, !dbg !32
	%10 = load i64, i64*  %9, align 8, !tbaa !66, !dbg !32
	%11 = and i64  %10, -8, !dbg !32
	store i64  %11, i64* %.r1.0267.addr, align 8, !tbaa !70, !dbg !32
	%12 = bitcast %struct.matrix* %B to i8*, !dbg !32
	%13 = getelementptr i8, i8*  %12, i64 16, !dbg !32
	%14 = bitcast i8*  %13 to i64*, !dbg !32
	%15 = load i64, i64*  %14, align 8, !tbaa !66, !dbg !32
	%16 = mul i64  %15, 32, !dbg !32
	%17 = inttoptr i64  %16 to i8*, !dbg !32
	store i8*  %17, i8** %.r1.0148.addr, align 8, !tbaa !71, !dbg !32
	%18 = mul i64  %15, 4, !dbg !32
	%19 = inttoptr i64  %18 to i8*, !dbg !32
	store i8*  %19, i8** %.r1.0047.addr, align 8, !tbaa !71, !dbg !32
	br label %L.B0001
L.B0001:
	store i64 0, i64* %j.addr, align 8, !tbaa !68, !dbg !34
	%20 = load i64, i64* %N.addr, align 8, !tbaa !68, !dbg !34
	%21 = icmp sle i64  %20, 0, !dbg !34
	br i1  %21, label %L.B0006, label %L.B0036, !dbg !34
L.B0036:
	store i64  %20, i64* %.lcr050002.addr, align 8, !tbaa !70, !dbg !34
	%22 = load i64, i64* %i.addr, align 8, !tbaa !68, !dbg !34
	%23 = bitcast %struct.matrix* %A to i8*, !dbg !34
	%24 = getelementptr i8, i8*  %23, i64 16, !dbg !34
	%25 = bitcast i8*  %24 to i64*, !dbg !34
	%26 = load i64, i64*  %25, align 8, !tbaa !66, !dbg !34
	%27 = mul i64  %22,  %26, !dbg !34
	store i64  %27, i64* %.r1.0155.addr, align 8, !tbaa !70, !dbg !34
	%28 = getelementptr i8, i8*  %23, i64 24, !dbg !34
	%29 = bitcast i8*  %28 to i8**, !dbg !34
	%30 = load i8*, i8**  %29, align 8, !tbaa !71, !dbg !34
	%31 = mul i64  %27, 4, !dbg !34
	%32 = getelementptr i8, i8*  %30, i64  %31, !dbg !34
	store i8*  %32, i8** %.r1.0083.addr, align 8, !tbaa !71, !dbg !34
	br label %L.B0005
L.B0005:
	store float 0x0000000000000000, float* %c.addr, align 4, !tbaa !73, !dbg !51
	call void asm sideeffect "# loop begins", "" () mustprogress, !dbg !36
	store i64 0, i64* %.ndk0002.addr, align 8, !tbaa !70, !dbg !34
	%33 = bitcast %struct.matrix* %A to i8*, !dbg !34
	%34 = getelementptr i8, i8*  %33, i64 8, !dbg !34
	%35 = bitcast i8*  %34 to i64*, !dbg !34
	%36 = load i64, i64*  %35, align 8, !tbaa !66, !dbg !34
	store i64  %36, i64* %.ndk0003.addr, align 8, !tbaa !70, !dbg !34
	%37 = icmp sle i64  %36, 0, !dbg !34
	br i1  %37, label %L.B0031, label %L.B0037, !dbg !34
L.B0037:
	%38 = icmp slt i64  %36, 8, !dbg !52
	br i1  %38, label %L.B0030, label %L.B0038, !dbg !52
L.B0038:
	%39 = load i8*, i8** %.r1.0083.addr, align 8, !tbaa !71, !dbg !52
	store i8*  %39, i8** %.vind_1.addr, align 8, !tbaa !71, !dbg !52
	store <8 x float> zeroinitializer, <8 x float>* %.VR_c_0.addr, align 1, !tbaa !66, !dbg !52
	br label %L.B0032
L.B0032:
	%40 = load i64, i64* %.ndk0003.addr, align 8, !tbaa !70, !dbg !52
	%41 = sub i64  %40, 7, !dbg !52
	store i64  %41, i64* %.ndk0003.addr, align 8, !tbaa !70, !dbg !52
	%42 = load i64, i64* %j.addr, align 8, !tbaa !68, !dbg !53
	%43 = bitcast %struct.matrix* %B to i8*, !dbg !53
	%44 = getelementptr i8, i8*  %43, i64 16, !dbg !53
	%45 = bitcast i8*  %44 to i64*, !dbg !53
	%46 = load i64, i64*  %45, align 8, !tbaa !66, !dbg !53
	%47 = mul i64  %46, 7, !dbg !53
	%48 = add i64  %42,  %47, !dbg !53
	%49 = mul i64  %48, 4, !dbg !53
	%50 = inttoptr i64  %49 to i8*, !dbg !53
	store i8*  %50, i8** %.G0014.addr, align 8, !tbaa !71, !dbg !53
	%51 = mul i64  %46, 6, !dbg !53
	%52 = add i64  %42,  %51, !dbg !53
	%53 = mul i64  %52, 4, !dbg !53
	%54 = inttoptr i64  %53 to i8*, !dbg !53
	store i8*  %54, i8** %.G0012.addr, align 8, !tbaa !71, !dbg !53
	%55 = mul i64  %46, 5, !dbg !53
	%56 = add i64  %42,  %55, !dbg !53
	%57 = mul i64  %56, 4, !dbg !53
	%58 = inttoptr i64  %57 to i8*, !dbg !53
	store i8*  %58, i8** %.G0010.addr, align 8, !tbaa !71, !dbg !53
	%59 = mul i64  %46, 4, !dbg !53
	%60 = add i64  %42,  %59, !dbg !53
	%61 = mul i64  %60, 4, !dbg !53
	%62 = inttoptr i64  %61 to i8*, !dbg !53
	store i8*  %62, i8** %.G0008.addr, align 8, !tbaa !71, !dbg !53
	%63 = mul i64  %46, 3, !dbg !53
	%64 = add i64  %42,  %63, !dbg !53
	%65 = mul i64  %64, 4, !dbg !53
	%66 = inttoptr i64  %65 to i8*, !dbg !53
	store i8*  %66, i8** %.G0006.addr, align 8, !tbaa !71, !dbg !53
	%67 = mul i64  %46, 2, !dbg !53
	%68 = add i64  %42,  %67, !dbg !53
	%69 = mul i64  %68, 4, !dbg !53
	%70 = inttoptr i64  %69 to i8*, !dbg !53
	store i8*  %70, i8** %.G0004.addr, align 8, !tbaa !71, !dbg !53
	%71 = add i64  %42,  %46, !dbg !53
	%72 = mul i64  %71, 4, !dbg !53
	%73 = inttoptr i64  %72 to i8*, !dbg !53
	store i8*  %73, i8** %.G0002.addr, align 8, !tbaa !71, !dbg !53
	%74 = mul i64  %42, 4, !dbg !53
	%75 = inttoptr i64  %74 to i8*, !dbg !53
	store i8*  %75, i8** %.G0000.addr, align 8, !tbaa !71, !dbg !53
	%76 = load i8*, i8** %.r1.0148.addr, align 8, !tbaa !71, !dbg !53
	store i8*  %76, i8** %.G0016.addr, align 8, !tbaa !71, !dbg !53
	br label %L.B0033
L.B0033:
	%77 = load <8 x float>, <8 x float>* %.VR_c_0.addr, align 4, !tbaa !66, !dbg !52
	%78 = load i8*, i8** %.vind_1.addr, align 8, !tbaa !71, !dbg !52
	%79 = bitcast i8*  %78 to <8 x float>*, !dbg !52
	%80 = load <8 x float>, <8 x float>*  %79, align 4, !tbaa !66, !dbg !52
	%81 = bitcast %struct.matrix* %B to i8*, !dbg !52
	%82 = getelementptr i8, i8*  %81, i64 24, !dbg !52
	%83 = bitcast i8*  %82 to i8**, !dbg !52
	%84 = load i8*, i8**  %83, align 8, !tbaa !71, !dbg !52
	%85 = load i8*, i8** %.G0000.addr, align 8, !tbaa !71, !dbg !52
	%86 = ptrtoint i8*  %85 to i64, !dbg !52
	%87 = getelementptr i8, i8*  %84, i64  %86, !dbg !52
	%88 = bitcast i8*  %87 to float*, !dbg !52
	%89 = load float, float*  %88, align 4, !tbaa !66, !dbg !52
	%90 = insertelement <8 x float> undef, float  %89, i32 0, !dbg !52
	%91 = load i8*, i8** %.G0002.addr, align 8, !tbaa !71, !dbg !52
	%92 = ptrtoint i8*  %91 to i64, !dbg !52
	%93 = getelementptr i8, i8*  %84, i64  %92, !dbg !52
	%94 = bitcast i8*  %93 to float*, !dbg !52
	%95 = load float, float*  %94, align 4, !tbaa !66, !dbg !52
	%96 = insertelement <8 x float>  %90, float  %95, i32 1, !dbg !52
	%97 = load i8*, i8** %.G0004.addr, align 8, !tbaa !71, !dbg !52
	%98 = ptrtoint i8*  %97 to i64, !dbg !52
	%99 = getelementptr i8, i8*  %84, i64  %98, !dbg !52
	%100 = bitcast i8*  %99 to float*, !dbg !52
	%101 = load float, float*  %100, align 4, !tbaa !66, !dbg !52
	%102 = insertelement <8 x float>  %96, float  %101, i32 2, !dbg !52
	%103 = load i8*, i8** %.G0006.addr, align 8, !tbaa !71, !dbg !52
	%104 = ptrtoint i8*  %103 to i64, !dbg !52
	%105 = getelementptr i8, i8*  %84, i64  %104, !dbg !52
	%106 = bitcast i8*  %105 to float*, !dbg !52
	%107 = load float, float*  %106, align 4, !tbaa !66, !dbg !52
	%108 = insertelement <8 x float>  %102, float  %107, i32 3, !dbg !52
	%109 = load i8*, i8** %.G0008.addr, align 8, !tbaa !71, !dbg !52
	%110 = ptrtoint i8*  %109 to i64, !dbg !52
	%111 = getelementptr i8, i8*  %84, i64  %110, !dbg !52
	%112 = bitcast i8*  %111 to float*, !dbg !52
	%113 = load float, float*  %112, align 4, !tbaa !66, !dbg !52
	%114 = insertelement <8 x float>  %108, float  %113, i32 4, !dbg !52
	%115 = load i8*, i8** %.G0010.addr, align 8, !tbaa !71, !dbg !52
	%116 = ptrtoint i8*  %115 to i64, !dbg !52
	%117 = getelementptr i8, i8*  %84, i64  %116, !dbg !52
	%118 = bitcast i8*  %117 to float*, !dbg !52
	%119 = load float, float*  %118, align 4, !tbaa !66, !dbg !52
	%120 = insertelement <8 x float>  %114, float  %119, i32 5, !dbg !52
	%121 = load i8*, i8** %.G0012.addr, align 8, !tbaa !71, !dbg !52
	%122 = ptrtoint i8*  %121 to i64, !dbg !52
	%123 = getelementptr i8, i8*  %84, i64  %122, !dbg !52
	%124 = bitcast i8*  %123 to float*, !dbg !52
	%125 = load float, float*  %124, align 4, !tbaa !66, !dbg !52
	%126 = insertelement <8 x float>  %120, float  %125, i32 6, !dbg !52
	%127 = load i8*, i8** %.G0014.addr, align 8, !tbaa !71, !dbg !52
	%128 = ptrtoint i8*  %127 to i64, !dbg !52
	%129 = getelementptr i8, i8*  %84, i64  %128, !dbg !52
	%130 = bitcast i8*  %129 to float*, !dbg !52
	%131 = load float, float*  %130, align 4, !tbaa !66, !dbg !52
	%132 = insertelement <8 x float>  %126, float  %131, i32 7, !dbg !52
	%133 = call <8 x float> @llvm.fma.v8f32 (<8 x float>  %80, <8 x float>  %132, <8 x float>  %77) mustprogress, !dbg !52
	store <8 x float>  %133, <8 x float>* %.VR_c_0.addr, align 1, !tbaa !66, !dbg !52
	%134 = getelementptr i8, i8*  %78, i64 32, !dbg !52
	store i8*  %134, i8** %.vind_1.addr, align 8, !tbaa !71, !dbg !52
	%135 = load i8*, i8** %.G0016.addr, align 8, !tbaa !71, !dbg !53
	%136 = ptrtoint i8*  %135 to i64, !dbg !53
	%137 = getelementptr i8, i8*  %127, i64  %136, !dbg !53
	store i8*  %137, i8** %.G0014.addr, align 8, !tbaa !71, !dbg !53
	%138 = getelementptr i8, i8*  %121, i64  %136, !dbg !53
	store i8*  %138, i8** %.G0012.addr, align 8, !tbaa !71, !dbg !53
	%139 = getelementptr i8, i8*  %115, i64  %136, !dbg !53
	store i8*  %139, i8** %.G0010.addr, align 8, !tbaa !71, !dbg !53
	%140 = getelementptr i8, i8*  %109, i64  %136, !dbg !53
	store i8*  %140, i8** %.G0008.addr, align 8, !tbaa !71, !dbg !53
	%141 = getelementptr i8, i8*  %103, i64  %136, !dbg !53
	store i8*  %141, i8** %.G0006.addr, align 8, !tbaa !71, !dbg !53
	%142 = getelementptr i8, i8*  %97, i64  %136, !dbg !53
	store i8*  %142, i8** %.G0004.addr, align 8, !tbaa !71, !dbg !53
	%143 = getelementptr i8, i8*  %91, i64  %136, !dbg !53
	store i8*  %143, i8** %.G0002.addr, align 8, !tbaa !71, !dbg !53
	%144 = getelementptr i8, i8*  %85, i64  %136, !dbg !53
	store i8*  %144, i8** %.G0000.addr, align 8, !tbaa !71, !dbg !53
	%145 = load i64, i64* %.ndk0003.addr, align 8, !tbaa !70, !dbg !52
	%146 = sub i64  %145, 8, !dbg !52
	store i64  %146, i64* %.ndk0003.addr, align 8, !tbaa !70, !dbg !52
	%147 = icmp sgt i64  %146, 0, !dbg !52
	br i1  %147, label %L.B0033, label %L.B0039, !llvm.loop !54, !dbg !52
L.B0039:
	%148 = load i64, i64* %.ndk0003.addr, align 8, !tbaa !70, !dbg !52
	%149 = add i64  %148, 7, !dbg !52
	store i64  %149, i64* %.ndk0003.addr, align 8, !tbaa !70, !dbg !52
	%150 = load i64, i64* %.r1.0267.addr, align 8, !tbaa !70, !dbg !52
	store i64  %150, i64* %.ndk0002.addr, align 8, !tbaa !70, !dbg !52
	%151 = load <8 x float>, <8 x float>* %.VR_c_0.addr, align 4, !tbaa !66, !dbg !52
	%152 = call fast float @llvm.vector.reduce.fadd.v8f32 (float 0x0000000000000000, <8 x float>  %151) mustprogress, !dbg !52
	store float  %152, float* %c.addr, align 4, !tbaa !73, !dbg !52
	%153 = load i64, i64* %.ndk0003.addr, align 8, !tbaa !70, !dbg !52
	%154 = icmp eq i64  %153, 0, !dbg !52
	br i1  %154, label %L.B0034, label %L.B0030, !dbg !52
L.B0030:
	%155 = load i64, i64* %j.addr, align 8, !tbaa !68, !dbg !53
	%156 = bitcast %struct.matrix* %B to i8*, !dbg !53
	%157 = getelementptr i8, i8*  %156, i64 16, !dbg !53
	%158 = bitcast i8*  %157 to i64*, !dbg !53
	%159 = load i64, i64*  %158, align 8, !tbaa !66, !dbg !53
	%160 = load i64, i64* %.ndk0002.addr, align 8, !tbaa !70, !dbg !53
	%161 = mul i64  %159,  %160, !dbg !53
	%162 = add i64  %155,  %161, !dbg !53
	%163 = mul i64  %162, 4, !dbg !53
	%164 = inttoptr i64  %163 to i8*, !dbg !53
	store i8*  %164, i8** %.G0000.addr, align 8, !tbaa !71, !dbg !53
	%165 = load i8*, i8** %.r1.0047.addr, align 8, !tbaa !71, !dbg !53
	store i8*  %165, i8** %.G0004.addr, align 8, !tbaa !71, !dbg !53
	br label %L.M0000
L.M0000:
	%166 = load float, float* %c.addr, align 4, !tbaa !73, !dbg !52
	%167 = bitcast %struct.matrix* %B to i8*, !dbg !52
	%168 = getelementptr i8, i8*  %167, i64 24, !dbg !52
	%169 = bitcast i8*  %168 to i8**, !dbg !52
	%170 = load i8*, i8**  %169, align 8, !tbaa !71, !dbg !52
	%171 = load i8*, i8** %.G0000.addr, align 8, !tbaa !71, !dbg !52
	%172 = ptrtoint i8*  %171 to i64, !dbg !52
	%173 = getelementptr i8, i8*  %170, i64  %172, !dbg !52
	%174 = bitcast i8*  %173 to float*, !dbg !52
	%175 = load float, float*  %174, align 4, !tbaa !66, !dbg !52
	%176 = load i64, i64* %.r1.0155.addr, align 8, !tbaa !70, !dbg !52
	%177 = load i64, i64* %.ndk0002.addr, align 8, !tbaa !70, !dbg !52
	%178 = add i64  %176,  %177, !dbg !52
	%179 = bitcast %struct.matrix* %A to i8*, !dbg !52
	%180 = getelementptr i8, i8*  %179, i64 24, !dbg !52
	%181 = bitcast i8*  %180 to i8**, !dbg !52
	%182 = load i8*, i8**  %181, align 8, !tbaa !71, !dbg !52
	%183 = bitcast i8*  %182 to float*, !dbg !52
	%184 = getelementptr float, float*  %183, i64  %178, !dbg !52
	%185 = load float, float*  %184, align 4, !tbaa !66, !dbg !52
	%186 = call float @llvm.fma.f32 (float  %175, float  %185, float  %166) mustprogress, !dbg !52
	store float  %186, float* %c.addr, align 4, !tbaa !73, !dbg !52
	%187 = add i64  %177, 1, !dbg !34
	store i64  %187, i64* %.ndk0002.addr, align 8, !tbaa !70, !dbg !34
	%188 = load i8*, i8** %.G0004.addr, align 8, !tbaa !71, !dbg !53
	%189 = ptrtoint i8*  %188 to i64, !dbg !53
	%190 = getelementptr i8, i8*  %171, i64  %189, !dbg !53
	store i8*  %190, i8** %.G0000.addr, align 8, !tbaa !71, !dbg !53
	%191 = load i64, i64* %.ndk0003.addr, align 8, !tbaa !70, !dbg !34
	%192 = sub i64  %191, 1, !dbg !34
	store i64  %192, i64* %.ndk0003.addr, align 8, !tbaa !70, !dbg !34
	%193 = icmp sgt i64  %192, 0, !dbg !34
	br i1  %193, label %L.M0000, label %L.B0034, !llvm.loop !54, !dbg !34
L.B0034:
	br label %L.B0031
L.B0031:
	call void asm sideeffect "# loop ends", "" () mustprogress, !dbg !59
	%194 = load i64, i64* %i.addr, align 8, !tbaa !68, !dbg !60
	%195 = load i64, i64* %j.addr, align 8, !tbaa !68, !dbg !60
	%196 = load float, float* %c.addr, align 4, !tbaa !73, !dbg !60
	%197 = bitcast %struct.matrix* %C to i8*, !dbg !60
	%198 = getelementptr i8, i8*  %197, i64 16, !dbg !60
	%199 = bitcast i8*  %198 to i64*, !dbg !60
	%200 = load i64, i64*  %199, align 8, !tbaa !66, !dbg !60
	%201 = mul i64  %200,  %194, !dbg !60
	%202 = add i64  %195,  %201, !dbg !60
	%203 = getelementptr i8, i8*  %197, i64 24, !dbg !60
	%204 = bitcast i8*  %203 to i8**, !dbg !60
	%205 = load i8*, i8**  %204, align 8, !tbaa !71, !dbg !60
	%206 = bitcast i8*  %205 to float*, !dbg !60
	%207 = getelementptr float, float*  %206, i64  %202, !dbg !60
	%208 = load float, float*  %207, align 4, !tbaa !66, !dbg !60
	%209 = fadd float  %196,  %208, !dbg !60
	store float  %209, float*  %207, align 4, !tbaa !66, !dbg !60

	%210 = add i64  %195, 1, !dbg !61
	store i64  %210, i64* %j.addr, align 8, !tbaa !68, !dbg !61
	%211 = load i64, i64* %.lcr050002.addr, align 8, !tbaa !70, !dbg !61
	%212 = icmp slt i64  %210,  %211, !dbg !61
	br i1  %212, label %L.B0005, label %L.B0006, !dbg !61
L.B0006:
	%213 = load i64, i64* %i.addr, align 8, !tbaa !68, !dbg !62

	%214 = add i64  %213, 1, !dbg !62
	store i64  %214, i64* %i.addr, align 8, !tbaa !68, !dbg !62
	%215 = load i64, i64* %.lcr050001.addr, align 8, !tbaa !70, !dbg !62
	%216 = icmp slt i64  %214,  %215, !dbg !62
	br i1  %216, label %L.B0001, label %L.B0002, !dbg !62
L.B0002:
	ret void, !dbg !63
}

define linkonce_odr float* @_ZN6matrixclEll(%struct.matrix* %_T1_1620.arg, i64 %i.arg, i64 %j.arg) #0 inlinehint mustprogress !dbg !80 {
L.entry:
	%_T1_1620.addr = alloca %struct.matrix*, align 8
	%i.addr = alloca i64, align 8
	%j.addr = alloca i64, align 8

	store %struct.matrix* %_T1_1620.arg, %struct.matrix** %_T1_1620.addr, align 8, !tbaa !71
	store i64 %i.arg, i64* %i.addr, align 8, !tbaa !66
	store i64 %j.arg, i64* %j.addr, align 8, !tbaa !66
	%0 = load %struct.matrix*, %struct.matrix** %_T1_1620.addr, align 8, !tbaa !71, !dbg !84
	%1 = bitcast %struct.matrix*  %0 to i8*, !dbg !84
	%2 = getelementptr i8, i8*  %1, i64 24, !dbg !84
	%3 = bitcast i8*  %2 to i8**, !dbg !84
	%4 = load i8*, i8**  %3, align 8, !tbaa !71, !dbg !84
	%5 = load i64, i64* %j.addr, align 8, !tbaa !68, !dbg !84
	%6 = getelementptr i8, i8*  %1, i64 16, !dbg !84
	%7 = bitcast i8*  %6 to i64*, !dbg !84
	%8 = load i64, i64*  %7, align 8, !tbaa !66, !dbg !84
	%9 = load i64, i64* %i.addr, align 8, !tbaa !68, !dbg !84
	%10 = mul i64  %8,  %9, !dbg !84
	%11 = add i64  %5,  %10, !dbg !84
	%12 = mul i64  %11, 4, !dbg !84
	%13 = getelementptr i8, i8*  %4, i64  %12, !dbg !84
	%14 = bitcast i8*  %13 to float*, !dbg !84
	ret float*  %14, !dbg !84
}

attributes #0 = { null_pointer_is_valid }

declare dso_local float @llvm.fma.f32(float, float, float)
declare dso_local <8 x float> @llvm.fma.v8f32(<8 x float>, <8 x float>, <8 x float>)
declare dso_local float @llvm.vector.reduce.fadd.v8f32(float, <8 x float>)
declare i32 @__gxx_personality_v0(...)

; Named metadata
!llvm.module.flags = !{ !1, !2 }
!llvm.dbg.cu = !{ !10 }

; Metadata
!1 = !{ i32 2, !"Dwarf Version", i32 4 }
!2 = !{ i32 2, !"Debug Info Version", i32 3 }
!3 = !DIFile(filename: "mm_basic.cc", directory: "/home/u22741/notebooks/pd08_mm")
; !4 = !DIFile(tag: DW_TAG_file_type, pair: !3)
!4 = !{ i32 41, !3 }
!5 = !{  }
!6 = !{  }
!7 = !{ !23, !80 }
!8 = !{  }
!9 = !{  }
!10 = distinct !DICompileUnit(file: !3, language: DW_LANG_C_plus_plus, producer: " NVC++ 22.11-0", enums: !5, retainedTypes: !6, globals: !8, emissionKind: FullDebug, imports: !9)
!11 = !{ !14, !15, !16, !19 }
!12 = !DICompositeType(tag: DW_TAG_structure_type, file: !3, name: "matrix", size: 256, align: 64, elements: !11)
!13 = !DIBasicType(tag: DW_TAG_base_type, name: "long", size: 64, align: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_member, file: !3, scope: !12, name: "M", size: 64, align: 64, baseType: !13)
!15 = !DIDerivedType(tag: DW_TAG_member, file: !3, scope: !12, name: "N", size: 64, align: 64, offset: 64, baseType: !13)
!16 = !DIDerivedType(tag: DW_TAG_member, file: !3, scope: !12, name: "ld", size: 64, align: 64, offset: 128, baseType: !13)
!17 = !DIBasicType(tag: DW_TAG_base_type, name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, size: 64, align: 64, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_member, file: !3, scope: !12, name: "a", size: 64, align: 64, offset: 192, baseType: !18)
!20 = !{ null, !12, !12, !12 }
!21 = !DISubroutineType(types: !20)
!22 = !{  }
!23 = distinct !DISubprogram(file: !3, scope: !10, name: "_Z4gemm6matrixS_S_", line: 4, type: !21, spFlags: 8, unit: !10, scopeLine: 4)
!24 = !DILocation(line: 4, column: 1, scope: !23)
!25 = !DILexicalBlock(file: !3, scope: !23, line: 4, column: 1)
!26 = !DILocation(line: 4, column: 1, scope: !25)
!27 = !DILexicalBlock(file: !3, scope: !25, line: 7, column: 1)
!28 = !DILocation(line: 7, column: 1, scope: !27)
!29 = !DILexicalBlock(file: !3, scope: !27, line: 8, column: 1)
!30 = !DILocation(line: 8, column: 1, scope: !29)
!31 = !DILexicalBlock(file: !3, scope: !29, line: 8, column: 1)
!32 = !DILocation(line: 8, column: 1, scope: !31)
!33 = !DILexicalBlock(file: !3, scope: !31, line: 9, column: 1)
!34 = !DILocation(line: 9, column: 1, scope: !33)
!35 = !DILexicalBlock(file: !3, scope: !33, line: 11, column: 1)
!36 = !DILocation(line: 11, column: 1, scope: !35)
!37 = !DILexicalBlock(file: !3, scope: !35, line: 1, column: 1)
!38 = !DILocation(column: 1, scope: !37)
!39 = !DILexicalBlock(file: !3, scope: !37, line: 1, column: 1)
!40 = !DILocation(column: 1, scope: !39)
!41 = !DILexicalBlock(file: !3, scope: !33, line: 1, column: 1)
!42 = !DILocation(column: 1, scope: !41)
!43 = !DILexicalBlock(file: !3, scope: !35, line: 1, column: 1)
!44 = !DILocation(column: 1, scope: !43)
!45 = !DILexicalBlock(file: !3, scope: !43, line: 1, column: 1)
!46 = !DILocation(column: 1, scope: !45)
!47 = !DILexicalBlock(file: !3, scope: !33, line: 1, column: 1)
!48 = !DILocation(column: 1, scope: !47)
!49 = !DILocation(line: 5, column: 1, scope: !25)
!50 = !DILocation(line: 6, column: 1, scope: !25)
!51 = !DILocation(line: 10, column: 1, scope: !33)
!52 = !DILocation(line: 13, column: 1, scope: !35)
!53 = !DILocation(line: 12, column: 1, scope: !35)
!54 = !{ !54, !55, !56 }
!55 = !{ !"llvm.loop.unroll.count", i32 1 }
!56 = !{ !"llvm.loop.vectorize.enable", i1 0 }
!57 = !{ !57, !58 }
!58 = !{ !"llvm.loop.vectorize.width", i32 1 }
!59 = !DILocation(line: 15, column: 1, scope: !33)
!60 = !DILocation(line: 16, column: 1, scope: !33)
!61 = !DILocation(line: 17, column: 1, scope: !31)
!62 = !DILocation(line: 18, column: 1, scope: !27)
!63 = !DILocation(line: 19, column: 1, scope: !25)
!64 = !{ !"PGI C[++] TBAA" }
!65 = !{ !"omnipotent char", !64, i64 0 }
!66 = !{ !65, !65, i64 0 }
!67 = !{ !"long", !65, i64 0 }
!68 = !{ !67, !67, i64 0 }
!69 = !{ !"long long", !65, i64 0 }
!70 = !{ !69, !69, i64 0 }
!71 = !{ !"<T>*", !65, i64 0 }
!72 = !{ !"float", !65, i64 0 }
!73 = !{ !72, !72, i64 0 }
!74 = !DIFile(filename: "mm_cpu.h", directory: "/home/u22741/notebooks/pd08_mm")
; !75 = !DIFile(tag: DW_TAG_file_type, pair: !74)
!75 = !{ i32 41, !74 }
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, size: 64, align: 64, baseType: !12)
!77 = !{ !18, !76, !13, !13 }
!78 = !DISubroutineType(types: !77)
!79 = !{  }
!80 = distinct !DISubprogram(file: !74, scope: !10, name: "_ZN6matrixclEll", line: 43, type: !78, spFlags: 8, unit: !10, scopeLine: 43)
!81 = !DILocation(line: 43, column: 1, scope: !80)
!82 = !DILexicalBlock(file: !74, scope: !80, line: 43, column: 1)
!83 = !DILocation(line: 43, column: 1, scope: !82)
!84 = !DILocation(line: 50, column: 1, scope: !82)
!85 = !DILocation(line: 51, column: 1, scope: !82)
