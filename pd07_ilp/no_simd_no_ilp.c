// record of execution
typedef long long int llint;

enum { K = 1 };

typedef struct {
  double x[1];
  int vcore0; // a virtual core on which a thread got started
  int vcore1; // a virtual core on which a thread ended
} record_t;

#include "ilp_rec_main.h"

llint get_clock() {
  return _rdtsc();
}

/* this thread repeats x = a x + b (N * M) times.
   it records the clock N times (every M iterations of x = a x + b)
   to array T.
   final result of x = a x + b, as well as SM each thread was executed
   on are recorded to R. */
void thread_fun(double a, double b, record_t * R,
                llint * T, llint n, llint m) {
  int idx = omp_get_thread_num();
  // initial value (not important)
  double x = idx;
  
  // where clocks are recorded
  T = &T[idx * n];
  // record starting SM
  R[idx].vcore0 = sched_getcpu();
  // main thing. repeat a x + b many times,
  // occasionally recording the clock
  for (long i = 0; i < n; i++) {
    T[i] = get_clock();
    asm volatile("# begin loop");
    for (long j = 0; j < m; j++) {
      x = a * x + b;
    }
    asm volatile("# end loop");
  }
  // record ending SM (must be = sm0)
  R[idx].vcore1 = sched_getcpu();
  // record result, just so that the computation is not
  // eliminated by the compiler
  R[idx].x[0] = x;
}
