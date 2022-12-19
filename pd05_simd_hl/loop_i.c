/* inner loop, with a loop-invariant trip count */
void loop_i(float a, float * x, float b, long n, long m) {
  n = (n / 16) * 16;
  asm volatile("# ========== loop begins ==========");
#pragma omp simd
  for (long i = 0; i < n; i++) {
    for (int k = 0; k < m; k++) {
      x[i] = a * x[i] + b;
    }
  }
  asm volatile("# ---------- loop ends ----------");
}
