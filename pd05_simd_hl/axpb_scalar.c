void axpb_scalar(float a, float * x, float b, long n) {
  asm volatile("# ========== loop begins ==========");
  for (long i = 0; i < n; i++) {
    x[i] = a * x[i] + b;
  }
  asm volatile("# ---------- loop ends ----------");
}
