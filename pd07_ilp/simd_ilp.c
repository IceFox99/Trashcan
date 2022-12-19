// record of execution
typedef long long int llint;
typedef double doublev __attribute__((vector_size(64), __may_alias__, aligned(sizeof(double))));
enum { L = sizeof(doublev) / sizeof(double) };

#ifndef C
#define C 2
#endif
enum { K = C * L };

typedef struct {
  double x[K];                     // a (meaningless) answer
  int vcore0; // a virtual core on which a thread got started
  int vcore1; // a virtual core on which a thread ended
} record_t;

#include "ilp_rec_main.h"
#include "perf.h"

llint get_clock(perf_event_counter_t pc) {
#if CLOCK_IS_CORE_CLOCK
  /* get core clock */
  return perf_event_counter_get(pc);
#else
  /* read timestamp counter instruction (reference clock) */
  return _rdtsc();
#endif
}

#define V(x) (*((doublev*)&x))
/* this thread repeats x = a x + b (N * M) times.
   it records the clock N times (every M iterations of x = a x + b)
   to array T.
   final result of x = a x + b, as well as SM each thread was executed
   on are recorded to R. */
void thread_fun(double a, double b, record_t * R,
                llint * T, llint n, llint m) {
  int idx = omp_get_thread_num();
  // initial value (not important)
  double x[K];
  for (long i = 0; i < K; i++) {
    x[i] = idx * K + i;
  }
  
  // where clocks are recorded
  T = &T[idx * n];
  // record starting SM
  R[idx].vcore0 = sched_getcpu();
  // main thing. repeat a x + b many times,
  // occasionally recording the clock
  perf_event_counter_t pc = mk_perf_event_counter();
  for (long i = 0; i < n; i++) {
    T[i] = get_clock(pc);
    asm volatile("# begin loop");
    for (long j = 0; j < m; j++) {
      for (long k = 0; k < K; k += L) {
        V(x[k]) = a * V(x[k]) + b;
      }
    }
    asm volatile("# end loop");
  }
  perf_event_counter_destroy(pc);
  // record ending SM (must be = sm0)
  R[idx].vcore1 = sched_getcpu();
  // record result, just so that the computation is not
  // eliminated by the compiler
  for (int i = 0; i < K; i++) {
    R[idx].x[i] = x[i];
  }
}
