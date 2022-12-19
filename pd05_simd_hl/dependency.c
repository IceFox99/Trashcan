void dependency(float a, float * x, float b, long n) {
  asm volatile("# ========== loop begins ==========");
  for (long i = 0; i < n - 1; i++) {
    x[i+1] = a * x[i] + b;
  }
  asm volatile("# ---------- loop ends ----------");
}
