/*
 * diff.h
 *
 * Code generation for function 'diff'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

#ifndef __DIFF_H__
#define __DIFF_H__
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
extern void b_diff(const emxArray_real_T *x, emxArray_real_T *y);
extern void diff(const real_T x[4], real_T y[2]);
#endif
/* End of code generation (diff.h) */
