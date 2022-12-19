#include <stdio.h>
#include <omp.h>

int main() {
  printf("hello\n");
#pragma omp parallel
{
  int t = omp_get_thread_num(); // id
  int nt = omp_get_num_threads(); // number of threads
  printf("%d/%d world\n", t, nt);
}
  
  printf("good bye\n");
  return 0;
}
