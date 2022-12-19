void indirect_idx(float a, float * x, long * idx, float b, float * y, long n) {
  n = (n / 16) * 16;
  asm volatile("# ========== loop begins ==========");
  for (long i = 0; i < n; i++) {
    y[i] = a * x[idx[i]] + b;
  }
  asm volatile("# ---------- loop ends ----------");
}
