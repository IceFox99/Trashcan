void stride_store(float a, float * x, float b, float * y, long n) {
  n = (n / 16) * 16;
  asm volatile("# ========== loop begins ==========");
#pragma omp simd
  for (long i = 0; i < n; i++) {
    y[i * 2] = a * x[i] + b;
  }
  asm volatile("# ---------- loop ends ----------");
}
