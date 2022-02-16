/*
 * mod.c
 *
 * Code generation for function 'mod'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "LIDAR.h"
#include "mod.h"

/* Function Definitions */
real_T b_mod(real_T x)
{
  real_T r;
  r = x / 6.2831853071795862;
  if (muDoubleScalarAbs(r - muDoubleScalarRound(r)) <= 2.2204460492503131E-16 *
      muDoubleScalarAbs(r)) {
    r = 0.0;
  } else {
    r = (r - muDoubleScalarFloor(r)) * 6.2831853071795862;
  }

  return r;
}

/* End of code generation (mod.c) */
