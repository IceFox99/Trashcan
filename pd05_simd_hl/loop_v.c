/* inner loop, with a variable trip count */
void loop_v(float a, float * x, float b, long n) {
  n = (n / 16) * 16;
  asm volatile("# ========== loop begins ==========");
#pragma omp simd
  for (long i = 0; i < n; i++) {
    for (int k = 0; k < i; k++) {
      x[i] = a * x[i] + b;
    }
  }
  asm volatile("# ---------- loop ends ----------");
}
