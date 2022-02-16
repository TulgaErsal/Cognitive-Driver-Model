/*
 * LIDAR_initialize.c
 *
 * Code generation for function 'LIDAR_initialize'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "LIDAR.h"
#include "LIDAR_initialize.h"
#include "LIDAR_data.h"

/* Function Definitions */
void LIDAR_initialize(emlrtContext *aContext)
{
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, aContext, NULL, 1);
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, FALSE, 0U, 0);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (LIDAR_initialize.c) */
