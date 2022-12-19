#include <stdio.h>
#include <unistd.h>
#include <omp.h>

int main() {
  printf("-------------- STATIC START--------------\n");
  double t0 = omp_get_wtime();
  /* ----- add schedule clause below ----- */
#pragma omp parallel for schedule(static)
  for (int i = 0; i < 24; i++) {
    usleep(100 * 1000 * i);     /* sleep 100 x i milliseconds */
    printf("iteration %d executed by thread %d\n", i, omp_get_thread_num());
    fflush(stdout);
  }
  double t1 = omp_get_wtime();
  printf("%f sec\n", t1 - t0);
  printf("-------------- STATIC END--------------\n\n");

  printf("-------------- DYNAMIC START--------------\n");
  double t2 = omp_get_wtime();
  /* ----- add schedule clause below ----- */
#pragma omp parallel for schedule(dynamic)
  for (int i = 0; i < 24; i++) {
    printf("iteration %d start executing by thread %d\n", i, omp_get_thread_num());
    usleep(100 * 1000 * i);     /* sleep 100 x i milliseconds */
    printf("iteration %d executed by thread %d\n", i, omp_get_thread_num());
    fflush(stdout);
  }
  double t3 = omp_get_wtime();
  printf("%f sec\n", t3 - t2);
  printf("-------------- DYNAMIC END--------------\n");

  return 0;
}
