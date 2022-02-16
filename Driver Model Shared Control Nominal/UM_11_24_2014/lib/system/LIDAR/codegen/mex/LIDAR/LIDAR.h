/*
 * LIDAR.h
 *
 * Code generation for function 'LIDAR'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

#ifndef __LIDAR_H__
#define __LIDAR_H__
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
extern void LIDAR(const real_T VP[2], real_T HA, real_T LASER_RANGE, real_T ANGULAR_RES, const b_struct_T *MAP, emxArray_real_T *ANGLE_OUT, emxArray_real_T *RANGE_OUT);
#endif
/* End of code generation (LIDAR.h) */
