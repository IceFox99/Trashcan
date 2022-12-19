#include <assert.h>
#include <stdio.h>

#include "cuda_util.h"

__global__ void cuda_thread_fun(unsigned long long * p, int n) {
  int i        = blockDim.x * blockIdx.x + threadIdx.x;
  if (i < n) {
    *p = *p + 1;
  }
}

int main(int argc, char ** argv) {
  int n               = (argc > 1 ? atoi(argv[1]) : 1000);
  int thread_block_sz = (argc > 2 ? atoi(argv[2]) : 64);
  int n_thread_blocks = (n + thread_block_sz - 1) / thread_block_sz;

  unsigned long long c;
  unsigned long long * c_dev;
  printf("%d %d\n", n_thread_blocks, thread_block_sz);
  check_api_error(cudaMalloc(&c_dev, sizeof(unsigned long long)));
  check_launch_error((cuda_thread_fun<<<n_thread_blocks,thread_block_sz>>>(c_dev, n)));
  check_api_error(cudaDeviceSynchronize());
  check_api_error(cudaMemcpy(&c, c_dev, sizeof(unsigned long long), cudaMemcpyDeviceToHost));
  check_api_error(cudaFree(c_dev));
  printf("c = %llu\n", c);
  return 0;
}
