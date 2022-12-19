#include <assert.h>
#include <stdio.h>

#include "cuda_util.h"

__global__ void cuda_thread_fun(int n) {
  // gridDim.x/gridDim.y is the number of x/y BLOCKS, which is a constant
  // blockDim.x/blockDim.y is the number of THREADS per x/y BLOCK, which is a constant
  // blockIdx.x/blockIdx.y is the id of x/y BLOCKS
  // threadIdx.x/threadIdx.y is the id of x/y THREADS
  int x          = blockDim.x * blockIdx.x + threadIdx.x; // x coordinate
  int y          = blockDim.y * blockIdx.y + threadIdx.y; // y coordinate
  int nthreads_x = gridDim.x * blockDim.x; // upper limit of x
  int nthreads_y = gridDim.y * blockDim.y; // upper limit of y
  int g          = x + nthreads_x * y; // sequential id of all THREADS
  if (g < n) {
    printf("hello I am CUDA thread (%d,%d) of (%d,%d), my id is %d\n",
           x, y, nthreads_x, nthreads_y, g);
  }
}

int isqrt(int n) {
  int i;
  for (i = 0; i * i < n; i++) ;
  return i;
}

int main(int argc, char ** argv) {
  int n                 = (argc > 1 ? atoi(argv[1]) : 40); // number of total threads
  int nx                = isqrt(n);
  int ny                = (n + nx - 1) / nx;
  int thread_block_sz_x = (argc > 2 ? atoi(argv[2]) : 2); // number of x threads
  int thread_block_sz_y = (argc > 3 ? atoi(argv[3]) : 3); // number of y threads
  int n_thread_blocks_x = (nx + thread_block_sz_x - 1) / thread_block_sz_x; // number of x blocks
  int n_thread_blocks_y = (ny + thread_block_sz_y - 1) / thread_block_sz_y; // number of y blocks
  printf("nx is %d, ny is %d\n", nx, ny);
  printf("(%d * %d) threads/block * (%d * %d) blocks\n",
         thread_block_sz_x, thread_block_sz_y,
         n_thread_blocks_x, n_thread_blocks_y);

  dim3 nb(n_thread_blocks_x, n_thread_blocks_y);
  dim3 tpb(thread_block_sz_x, thread_block_sz_y);
  check_launch_error((cuda_thread_fun<<<nb,tpb>>>(n)));
  check_api_error(cudaDeviceSynchronize());
  return 0;
}
