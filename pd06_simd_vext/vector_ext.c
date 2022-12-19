typedef float float_4 __attribute__((vector_size(16),__may_alias__,aligned(sizeof(float))));
typedef float float_8 __attribute__((vector_size(32),__may_alias__,aligned(sizeof(float))));
typedef float float_16 __attribute__((vector_size(64),__may_alias__,aligned(sizeof(float))));

float_4 dist_4(float_4 x, float_4 y) {
  return x * x + y * y;
}
float_8 dist_8(float_8 x, float_8 y) {
  return x * x + y * y;
}
float_16 dist_16(float_16 x, float_16 y) {
  return x * x + y * y;
}
