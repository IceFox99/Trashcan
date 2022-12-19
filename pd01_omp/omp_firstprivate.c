#include <stdio.h>
#include <unistd.h>
#include <omp.h>

int main() {
  int x = 123;
  printf("before : x = %d\n", x);
  /* add private(x)/firstprivate(x) clause and see the difference */
#pragma omp parallel firstprivate(x)
  {
    int id = omp_get_thread_num();
    x++;
    printf("thread %d : x = %d\n", id, x);
  }
  printf("after : x = %d\n", x);
  return 0;
}
