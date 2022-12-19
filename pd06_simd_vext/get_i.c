#if defined(__AVX512F__)
enum { simd_width = 64 };
#else
#error "you must have __AVX512F__ (forgot to give -mavx512f -mfma??)"
#endif

typedef float floatv __attribute__((vector_size(simd_width),__may_alias__,aligned(sizeof(float))));
const int n_float_lanes = sizeof(floatv) / sizeof(float);

float get_i(floatv v, int i) {
  return v[i];
}
