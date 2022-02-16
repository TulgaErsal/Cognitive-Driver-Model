/*
 * mldivide.h
 *
 * Code generation for function 'mldivide'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

#ifndef __MLDIVIDE_H__
#define __MLDIVIDE_H__
/* Include files */
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "mwmathutil.h"

#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "blas.h"
#include "rtwtypes.h"
#include "LIDAR_types.h"

/* Function Declarations */
extern void check_forloop_overflow_error(void);
extern void mldivide(const real_T A[16], real_T B_data[4]);
#endif
/* End of code generation (mldivide.h) */
