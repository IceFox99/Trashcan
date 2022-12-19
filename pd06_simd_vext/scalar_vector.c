typedef float float_16 __attribute__((vector_size(64),__may_alias__,aligned(sizeof(float))));

float_16 axpb_16(float a, float_16 x) {
  return a * x + 3.0;
}
