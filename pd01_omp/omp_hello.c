#include <omp.h>
#include <stdio.h>

int main() {
  printf("hello\n");
#pragma omp parallel
{
  printf("world\n");
  printf("good bye\n");
}
  return 0;
}
