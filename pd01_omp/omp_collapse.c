//% file: omp_collapse_1.c
//% cmd: gcc -Wall -Wextra -fopenmp -fopenmp-simd -O3 -I. -o omp_collapse_1 omp_collapse_1.c -lm

#include <stdio.h>
#include <unistd.h>
#include <omp.h>

int main() {
  double t0 = omp_get_wtime();
  /* apply collapse and schedule */
#pragma omp parallel for schedule(runtime) collapse(2)
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      usleep(100 * 1000 * (i + j));
      printf("iteration (%d, %d) executed by thread %d\n", i, j, omp_get_thread_num());
      fflush(stdout);
    }
  }
  double t1 = omp_get_wtime();
  printf("%f sec\n", t1 - t0);
  return 0;
}

