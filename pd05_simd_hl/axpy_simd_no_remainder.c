void axpb_simd_no_remainder(float a, float * x, float b, long n) {
  n = (n / 16) * 16;    /* just so that there are no scalar iterations */
  asm volatile("# ========== loop begins ==========");
  for (long i = 0; i < n; i++) {
    x[i] = a * x[i] + b;
  }
  asm volatile("# ---------- loop ends ----------");
}
