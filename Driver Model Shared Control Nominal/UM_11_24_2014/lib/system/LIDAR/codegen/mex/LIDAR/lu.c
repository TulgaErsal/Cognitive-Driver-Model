/*
 * lu.c
 *
 * Code generation for function 'lu'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "LIDAR.h"
#include "lu.h"
#include "mldivide.h"
#include "LIDAR_data.h"

/* Variable Definitions */
static emlrtRSInfo rb_emlrtRSI = { 24, "lu",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/matfun/lu.m" };

/* Function Definitions */
void lu(const real_T A[16], real_T L[16], real_T U[16])
{
  real_T b_A[16];
  int8_T ipiv[4];
  int32_T pipk;
  int32_T j;
  int32_T c;
  int32_T ix;
  real_T smax;
  int32_T jy;
  real_T s;
  int32_T b;
  int32_T b_j;
  boolean_T b_pipk;
  int32_T ijA;
  int8_T perm[4];
  emlrtPushRtStackR2012b(&rb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&ub_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&vb_emlrtRSI, emlrtRootTLSGlobal);
  memcpy(&b_A[0], &A[0], sizeof(real_T) << 4);
  for (pipk = 0; pipk < 4; pipk++) {
    ipiv[pipk] = (int8_T)(1 + pipk);
  }

  for (j = 0; j < 3; j++) {
    c = j * 5;
    pipk = 0;
    ix = c;
    smax = muDoubleScalarAbs(b_A[c]);
    for (jy = 2; jy <= 4 - j; jy++) {
      ix++;
      s = muDoubleScalarAbs(b_A[ix]);
      if (s > smax) {
        pipk = jy - 1;
        smax = s;
      }
    }

    if (b_A[c + pipk] != 0.0) {
      if (pipk != 0) {
        ipiv[j] = (int8_T)((j + pipk) + 1);
        ix = j;
        pipk += j;
        for (jy = 0; jy < 4; jy++) {
          smax = b_A[ix];
          b_A[ix] = b_A[pipk];
          b_A[pipk] = smax;
          ix += 4;
          pipk += 4;
        }
      }

      b = (c - j) + 4;
      emlrtPushRtStackR2012b(&wb_emlrtRSI, emlrtRootTLSGlobal);
      emlrtPopRtStackR2012b(&wb_emlrtRSI, emlrtRootTLSGlobal);
      for (jy = c + 1; jy + 1 <= b; jy++) {
        b_A[jy] /= b_A[c];
      }
    }

    emlrtPushRtStackR2012b(&xb_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&yb_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&ac_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&bc_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&cc_emlrtRSI, emlrtRootTLSGlobal);
    pipk = c;
    jy = c + 4;
    for (b_j = 1; b_j <= 3 - j; b_j++) {
      smax = b_A[jy];
      if (b_A[jy] != 0.0) {
        ix = c + 1;
        b = (pipk - j) + 8;
        emlrtPushRtStackR2012b(&dc_emlrtRSI, emlrtRootTLSGlobal);
        if (pipk + 6 > b) {
          b_pipk = FALSE;
        } else {
          b_pipk = (b > 2147483646);
        }

        if (b_pipk) {
          emlrtPushRtStackR2012b(&ab_emlrtRSI, emlrtRootTLSGlobal);
          check_forloop_overflow_error();
          emlrtPopRtStackR2012b(&ab_emlrtRSI, emlrtRootTLSGlobal);
        }

        emlrtPopRtStackR2012b(&dc_emlrtRSI, emlrtRootTLSGlobal);
        for (ijA = pipk + 5; ijA + 1 <= b; ijA++) {
          b_A[ijA] += b_A[ix] * -smax;
          ix++;
        }
      }

      jy += 4;
      pipk += 4;
    }

    emlrtPopRtStackR2012b(&cc_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPopRtStackR2012b(&bc_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPopRtStackR2012b(&ac_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPopRtStackR2012b(&yb_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPopRtStackR2012b(&xb_emlrtRSI, emlrtRootTLSGlobal);
  }

  emlrtPopRtStackR2012b(&vb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&ub_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&rb_emlrtRSI, emlrtRootTLSGlobal);
  for (pipk = 0; pipk < 4; pipk++) {
    perm[pipk] = (int8_T)(1 + pipk);
  }

  for (jy = 0; jy < 3; jy++) {
    if (ipiv[jy] > 1 + jy) {
      pipk = perm[ipiv[jy] - 1];
      perm[ipiv[jy] - 1] = perm[jy];
      perm[jy] = (int8_T)pipk;
    }
  }

  for (pipk = 0; pipk < 16; pipk++) {
    L[pipk] = 0.0;
    U[pipk] = 0.0;
  }

  for (j = 0; j < 4; j++) {
    for (jy = 0; jy <= j; jy++) {
      U[jy + (j << 2)] = b_A[jy + (j << 2)];
    }
  }

  for (j = 0; j < 4; j++) {
    L[(perm[j] + (j << 2)) - 1] = 1.0;
    for (jy = 0; jy <= 2 - j; jy++) {
      pipk = (j + jy) + 1;
      L[(perm[pipk] + (j << 2)) - 1] = b_A[pipk + (j << 2)];
    }
  }
}

/* End of code generation (lu.c) */
