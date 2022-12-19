#include <assert.h>
#include <stdio.h>
#include <math.h>
#include <time.h>

#include "cuda_util.h"

__global__ void cuda_double_integral(double * p, long long seg, int n) {
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    if (id < n) {
        double interval = 1.0 / seg;

        for (long long i = 0; i < seg; i++) {
            for (long long j = id; j < seg; j += n) {
                if (seg * seg - i * i > j * j) {
                    atomicAdd(p, interval * interval * interval * sqrt((double)seg * seg - i * i - j * j));
                }
            }
        }
    }
}

int main(int argc, char ** argv)
{   
    struct timespec start, end;
    int n               = (argc > 1 ? atoi(argv[1]) : 1000);
    int thread_block_sz = (argc > 2 ? atoi(argv[2]) : 64);
    int n_thread_blocks = (n + thread_block_sz - 1) / thread_block_sz;

    /* ------------------------------REGULAR PROGRAMMING START------------------------------ */
    // Clock start
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);

    // Calculation
    long long n0 = 20000;
    double interval0 = 1.0 / n0;
    double result0 = 0.0;
    for (long long i = 0; i < n0; i++) {
        for (long long j = 0; j < n0; j++) {
            if (n0 * n0 - i * i > j * j)
                result0 += interval0 * interval0 * interval0 * \
                            sqrtl(n0 * n0 - i * i - j * j);
        }
    }
    
    // Clock end
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);
    double time0 = (double)(end.tv_sec - start.tv_sec) + (double)(end.tv_nsec - start.tv_nsec) / 1000000000;
    printf("regular programming (interval = %f): ans = %.8f in %f sec.\n", interval0, result0, time0);
    /* ------------------------------REGULAR PROGRAMMING END------------------------------ */
    
    /* ------------------------------atomicAdd START------------------------------ */
    // Clock start
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);

    // Calculation
    long long seg1 = 20000;
    double result1;
    double * res1_dev;
    check_api_error(cudaMalloc(&res1_dev, sizeof(double)));
    check_launch_error((cuda_double_integral<<<n_thread_blocks,thread_block_sz>>>(res1_dev, seg1, n)));
    check_api_error(cudaDeviceSynchronize());
    check_api_error(cudaMemcpy(&result1, res1_dev, sizeof(double), cudaMemcpyDeviceToHost));
    check_api_error(cudaFree(res1_dev));

    // Clock end
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);
    double time1 = (double)(end.tv_sec - start.tv_sec) + (double)(end.tv_nsec - start.tv_nsec) / 1000000000;
    printf("atomicAdd (interval = %f): ans = %.8f in %f sec.\n", 1.0 / seg1, result1, time1);

    // ANOTHER SEGMENTATION
    // Clock start
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);

    // Calculation
    long long seg2 = 50000;
    double result2;
    double * res2_dev;
    check_api_error(cudaMalloc(&res2_dev, sizeof(double)));
    check_launch_error((cuda_double_integral<<<n_thread_blocks,thread_block_sz>>>(res2_dev, seg2, n)));
    check_api_error(cudaDeviceSynchronize());
    check_api_error(cudaMemcpy(&result2, res2_dev, sizeof(double), cudaMemcpyDeviceToHost));
    check_api_error(cudaFree(res2_dev));

    // Clock end
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);
    double time2 = (double)(end.tv_sec - start.tv_sec) + (double)(end.tv_nsec - start.tv_nsec) / 1000000000;
    printf("atomicAdd (interval = %f): ans = %.8f in %f sec.\n", 1.0 / seg2, result2, time2);
    /* ------------------------------atomicAdd END------------------------------ */
    
    return 0;
}
