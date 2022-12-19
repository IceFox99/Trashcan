#include <assert.h>
#include <stdio.h>

#include "cuda_util.h"

__global__ void cuda_thread_fun(int n) {
  int i        = blockDim.x * blockIdx.x + threadIdx.x;
  int nthreads = gridDim.x * blockDim.x;
  if (i < n) {
    printf("hello I am CUDA thread %d out of %d\n", i, nthreads);
  }
}

/* First argument is the number of threads, second argument is the number of threads per block */
int main(int argc, char ** argv) {
  int n               = (argc > 1 ? atoi(argv[1]) : 100); // number of threads
  int thread_block_sz = (argc > 2 ? atoi(argv[2]) : 64); // number of threads per block
  int n_thread_blocks = (n + thread_block_sz - 1) / thread_block_sz; // number of blocks
  printf("%d threads/block * %d blocks\n", thread_block_sz, n_thread_blocks);

  check_launch_error((cuda_thread_fun<<<n_thread_blocks,thread_block_sz>>>(n))); // <<<number of blocks, number of threads per block>>>
  check_api_error(cudaDeviceSynchronize());
  return 0;
}
