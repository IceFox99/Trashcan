float sum(float * x, long n) {
  n = (n / 16) * 16;
  float s = 0.0;
  asm volatile("# ========== loop begins ==========");
#pragma omp simd reduction(+:s)
  for (long i = 0; i < n; i++) {
    s += x[i];
  }
  asm volatile("# ---------- loop ends ----------");
  return s;
}
