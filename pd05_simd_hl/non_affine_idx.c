void non_affine_idx(float a, float * x, float b, float * y, long n) {
  n = (n / 16) * 16;
  asm volatile("# ========== loop begins ==========");
  for (long i = 0; i < n; i++) {
    y[i] = a * x[i * i % n] + b;
  }
  asm volatile("# ---------- loop ends ----------");
}
