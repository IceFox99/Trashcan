#if defined(__AVX512F__)
enum { simd_width = 64 };
#else
#error "you must have __AVX512F__ (forgot to give -mavx512f -mfma??)"
#endif

typedef float floatv __attribute__((vector_size(simd_width),__may_alias__,aligned(sizeof(float))));
const int n_float_lanes = sizeof(floatv) / sizeof(float);

floatv make_vector(float a0, float a1, float a2, float a3,
                   float a4, float a5, float a6, float a7,
                   float a8, float a9, float a10, float a11,
                   float a12, float a13, float a14, float a15
                   ) {
  float a[16] = { a0, a1, a2, a3, a4, a5, a6, a7,
    a8, a9, a10, a11, a12, a13, a14, a15
  };
  return *((floatv *)a);
}
