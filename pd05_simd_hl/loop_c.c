/* inner loop, with a compile-time constant trip count */
void loop_c(float a, float * x, float b, long n) {
  n = (n / 16) * 16;
  asm volatile("# ========== loop begins ==========");
#pragma omp simd
  for (long i = 0; i < n; i++) {
    for (long k = 0; k < 10; k++) {
      x[i] = a * x[i] + b;
    }
  }
  asm volatile("# ---------- loop ends ----------");
}
