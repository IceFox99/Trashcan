#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* scalar version */
double int_sqrt_one_minus_x2_y2(long n) {
  double h = 1.0 / n;
  double s = 0.0;
  for (long i = 0; i < n; i++) {
    for (long j = 0; j < n; j++) {
      double x = i * h ;
      double y = j * h;
      double z = 1 - x * x - y * y;
      if (z > 0.0) {
        s += sqrt(z);
      } else {
        break;
      }
    }
  }
  return s * h * h;
}

// wall clock time
double get_wtime() {
  struct timespec ts[1];
  clock_gettime(CLOCK_REALTIME, ts);
  return ts->tv_sec + ts->tv_nsec * 1.0e-9;
}

int main(int argc, char ** argv) {
  int i = 1;
  long n      = (argc > i ? atof(argv[i]) : 30L * 1000L); i++;
  long repeat = (argc > i ? atof(argv[i]) : 5);           i++;
  n += 15;
  n = (n / 16) * 16;
  double n_sqrts = (M_PI / 4) * n * n;
  for (long r = 0; r < repeat; r++) {
    printf("===== repeat %ld =====\n", r);
    fflush(stdout);
    double t0 = get_wtime();
    double s = int_sqrt_one_minus_x2_y2(n);
    double t1 = get_wtime();
    double dt = t1 - t0;
    printf("s = %.9f (err = |s - pi/6| = %e)\n", s, fabs(s - M_PI/6));
    printf("%f sec\n", dt);
    printf("%f points/sec\n", n_sqrts / dt);
    fflush(stdout);
  }
  return 0;
}
