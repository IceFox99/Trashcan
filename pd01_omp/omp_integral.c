#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include <omp.h>

int main()
{
    /*
    // No parallel programming
    long long n0 = 20000;
    double interval0 = 1.0 / n0;
    double result0 = 0.0;
    double t0_beg = omp_get_wtime();
    for (long long i = 0; i < n0; i++) {
        for (long long j = 0; j < n0; j++) {
            if (n0 * n0 - i * i > j * j)
                result0 += interval0 * interval0 * interval0 * \
                            sqrtl(n0 * n0 - i * i - j * j);
        }
    }
    double t0_end = omp_get_wtime();
    printf("regular programming (interval = %f): ans = %.8f in %f sec.\n", interval0, result0, t0_end - t0_beg);

    // Reduction
    long long n1 = 20000;
    double interval1 = 1.0 / n1;
    double result1 = 0.0;
    double t1_beg = omp_get_wtime();
    for (long long i = 0; i < n1; i++) {
#pragma omp parallel for reduction(+ : result1)
        for (long long j = 0; j < n1; j++) {
            if (n1 * n1 - i * i > j * j)
                result1 += interval1 * interval1 * interval1 * \
                            sqrtl(n1 * n1 - i * i - j * j);
        }
    }
    double t1_end = omp_get_wtime();
    printf("reduction (interval = %f): ans = %.8f in %f sec.\n", interval1, result1, t1_end - t1_beg);

    // Reduction
    long long n2 = 100000;
    double interval2 = 1.0 / n2;
    double result2 = 0.0;
    double t2_beg = omp_get_wtime();
    for (long long i = 0; i < n2; i++) {
#pragma omp parallel for reduction(+ : result2)
        for (long long j = 0; j < n2; j++) {
            if (n2 * n2 - i * i > j * j)
                result2 += interval2 * interval2 * interval2 * \
                            sqrtl(n2 * n2 - i * i - j * j);
        }
    }
    double t2_end = omp_get_wtime();
    printf("reduction (interval = %f): ans = %.8f in %f sec.\n", interval2, result2, t2_end - t2_beg);

    */
    return 0;
}
