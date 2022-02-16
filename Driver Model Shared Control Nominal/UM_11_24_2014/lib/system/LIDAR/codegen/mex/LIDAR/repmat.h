/*
 * repmat.h
 *
 * Code generation for function 'repmat'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

#ifndef __REPMAT_H__
#define __REPMAT_H__
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
extern void b_repmat(const emxArray_real_T *a, emxArray_real_T *b);
extern void repmat(real_T a, real_T n, emxArray_real_T *b);
#endif
/* End of code generation (repmat.h) */
