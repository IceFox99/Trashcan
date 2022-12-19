#include <stdio.h>
#include <x86intrin.h>
int main(int argc, char ** argv) {
  int i = 1;
  float a = (argc > i ? atof(argv[i]) : 1.23); i++;
  float b = (argc > i ? atof(argv[i]) : 1.23); i++;
  __m512 v = _mm512_set1_ps(b);
  __m512 c = a * v;
  printf("OK: c[0] = %f\n", c[0]);
  return 0;
}
