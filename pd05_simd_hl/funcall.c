float f(float a, float x, float b);
void funcall(float a, float * x, float b, long n) {
  n = (n / 16) * 16;
  asm volatile("# ========== loop begins ==========");
#pragma omp simd
  for (long i = 0; i < n; i++) {
    x[i] = f(a, x[i], b);
  }
  asm volatile("# ---------- loop ends ----------");
}
