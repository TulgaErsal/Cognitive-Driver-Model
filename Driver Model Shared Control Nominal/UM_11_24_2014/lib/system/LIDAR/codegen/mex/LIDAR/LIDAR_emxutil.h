/*
 * LIDAR_emxutil.h
 *
 * Code generation for function 'LIDAR_emxutil'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

#ifndef __LIDAR_EMXUTIL_H__
#define __LIDAR_EMXUTIL_H__
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
extern void b_emxFreeStruct_struct_T(b_struct_T *pStruct);
extern void b_emxInitStruct_struct_T(struct_T *pStruct, const emlrtRTEInfo *srcLocation, boolean_T doPush);
extern void b_emxInit_boolean_T(emxArray_boolean_T **pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T doPush);
extern void b_emxInit_real_T(emxArray_real_T **pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T doPush);
extern void c_emxInit_real_T(emxArray_real_T **pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T doPush);
extern void emxCopyStruct_struct_T(struct_T *dst, const struct_T *src, const emlrtRTEInfo *srcLocation);
extern void emxEnsureCapacity(emxArray__common *emxArray, int32_T oldNumel, int32_T elementSize, const emlrtRTEInfo *srcLocation);
extern void emxEnsureCapacity_struct_T(emxArray_struct_T *emxArray, int32_T oldNumel, const emlrtRTEInfo *srcLocation);
extern void emxFreeStruct_struct_T(struct_T *pStruct);
extern void emxFree_boolean_T(emxArray_boolean_T **pEmxArray);
extern void emxFree_int32_T(emxArray_int32_T **pEmxArray);
extern void emxFree_real_T(emxArray_real_T **pEmxArray);
extern void emxInitStruct_struct_T(b_struct_T *pStruct, const emlrtRTEInfo *srcLocation, boolean_T doPush);
extern void emxInit_boolean_T(emxArray_boolean_T **pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T doPush);
extern void emxInit_int32_T(emxArray_int32_T **pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T doPush);
extern void emxInit_real_T(emxArray_real_T **pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T doPush);
#endif
/* End of code generation (LIDAR_emxutil.h) */
