#pragma omp declare simd uniform(a, b) notinbranch
float fundef_decl_simd(float a, float x, float b) {
  return a * x + b;
}
