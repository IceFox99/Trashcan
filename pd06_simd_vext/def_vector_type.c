#if defined(__AVX512F__)
#warning "__AVX512F__ defined. SIMD width = 64 bytes"
enum { simd_width = 64 };
#elif defined(__AVX2__) || defined(__AVX__)
#warning "__AVX__ defined. SIMD width = 32 bytes"
enum { simd_width = 32 };
#elif defined(__SSE2__) || defined(__SSE__)
#warning "__SSE__ defined. SIMD width = 16 bytes"
enum { simd_width = 16 };
#else
#error "sorry, you must have one of __SSE__, __SSE2__, __AVX__, __AVX2__, or __AVX512F__"
#endif

typedef float floatv __attribute__((vector_size(simd_width),__may_alias__,aligned(sizeof(float))));
const int n_float_lanes = sizeof(floatv) / sizeof(float);

floatv distv(floatv x, floatv y) {
  return x * x + y * y;
}
