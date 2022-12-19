typedef struct {
  float x;
  float y;
} point_t;
void struct_load(float a, point_t * p, float b, point_t * q, long n) {
  n = (n / 16) * 16;
  asm volatile("# ========== loop begins ==========");
#pragma omp simd
  for (long i = 0; i < n; i++) {
    q[i].x = a * p[i].x + b;
  }
  asm volatile("# ---------- loop ends ----------");
}
