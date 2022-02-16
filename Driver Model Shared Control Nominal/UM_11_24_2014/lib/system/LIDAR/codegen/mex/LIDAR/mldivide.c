/*
 * mldivide.c
 *
 * Code generation for function 'mldivide'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "LIDAR.h"
#include "mldivide.h"
#include "LIDAR_mexutil.h"
#include "LIDAR_data.h"

/* Variable Definitions */
static emlrtRSInfo j_emlrtRSI = { 51, "eml_int_forloop_overflow_check",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_int_forloop_overflow_check.m"
};

static emlrtRSInfo ec_emlrtRSI = { 1, "mldivide",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/ops/mldivide.p" };

static emlrtRSInfo fc_emlrtRSI = { 20, "eml_lusolve",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_lusolve.m" };

static emlrtRSInfo gc_emlrtRSI = { 70, "eml_lusolve",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_lusolve.m" };

static emlrtRSInfo hc_emlrtRSI = { 68, "eml_lusolve",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_lusolve.m" };

static emlrtRSInfo ic_emlrtRSI = { 54, "eml_lusolve",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_lusolve.m" };

static emlrtRSInfo jc_emlrtRSI = { 16, "eml_warning",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_warning.m" };

static emlrtMCInfo c_emlrtMCI = { 52, 9, "eml_int_forloop_overflow_check",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_int_forloop_overflow_check.m"
};

static emlrtMCInfo d_emlrtMCI = { 51, 15, "eml_int_forloop_overflow_check",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_int_forloop_overflow_check.m"
};

static emlrtMCInfo s_emlrtMCI = { 16, 13, "eml_warning",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_warning.m" };

static emlrtMCInfo t_emlrtMCI = { 16, 5, "eml_warning",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_warning.m" };

/* Function Declarations */
static const mxArray *b_message(const mxArray *b, const mxArray *c, emlrtMCInfo *
  location);
static void eml_warning(void);
static void warning(const mxArray *b, emlrtMCInfo *location);

/* Function Definitions */
static const mxArray *b_message(const mxArray *b, const mxArray *c, emlrtMCInfo *
  location)
{
  const mxArray *pArrays[2];
  const mxArray *m11;
  pArrays[0] = b;
  pArrays[1] = c;
  return emlrtCallMATLABR2012b(emlrtRootTLSGlobal, 1, &m11, 2, pArrays,
    "message", TRUE, location);
}

static void eml_warning(void)
{
  const mxArray *y;
  static const int32_T iv22[2] = { 1, 27 };

  const mxArray *m6;
  char_T cv22[27];
  int32_T i;
  static const char_T cv23[27] = { 'C', 'o', 'd', 'e', 'r', ':', 'M', 'A', 'T',
    'L', 'A', 'B', ':', 's', 'i', 'n', 'g', 'u', 'l', 'a', 'r', 'M', 'a', 't',
    'r', 'i', 'x' };

  emlrtPushRtStackR2012b(&jc_emlrtRSI, emlrtRootTLSGlobal);
  y = NULL;
  m6 = mxCreateCharArray(2, iv22);
  for (i = 0; i < 27; i++) {
    cv22[i] = cv23[i];
  }

  emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 27, m6, cv22);
  emlrtAssign(&y, m6);
  warning(message(y, &s_emlrtMCI), &t_emlrtMCI);
  emlrtPopRtStackR2012b(&jc_emlrtRSI, emlrtRootTLSGlobal);
}

static void warning(const mxArray *b, emlrtMCInfo *location)
{
  const mxArray *pArray;
  pArray = b;
  emlrtCallMATLABR2012b(emlrtRootTLSGlobal, 0, NULL, 1, &pArray, "warning", TRUE,
                        location);
}

void check_forloop_overflow_error(void)
{
  const mxArray *y;
  static const int32_T iv6[2] = { 1, 34 };

  const mxArray *m1;
  char_T cv6[34];
  int32_T i;
  static const char_T cv7[34] = { 'C', 'o', 'd', 'e', 'r', ':', 't', 'o', 'o',
    'l', 'b', 'o', 'x', ':', 'i', 'n', 't', '_', 'f', 'o', 'r', 'l', 'o', 'o',
    'p', '_', 'o', 'v', 'e', 'r', 'f', 'l', 'o', 'w' };

  const mxArray *b_y;
  static const int32_T iv7[2] = { 1, 23 };

  char_T cv8[23];
  static const char_T cv9[23] = { 'c', 'o', 'd', 'e', 'r', '.', 'i', 'n', 't',
    'e', 'r', 'n', 'a', 'l', '.', 'i', 'n', 'd', 'e', 'x', 'I', 'n', 't' };

  emlrtPushRtStackR2012b(&j_emlrtRSI, emlrtRootTLSGlobal);
  y = NULL;
  m1 = mxCreateCharArray(2, iv6);
  for (i = 0; i < 34; i++) {
    cv6[i] = cv7[i];
  }

  emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 34, m1, cv6);
  emlrtAssign(&y, m1);
  b_y = NULL;
  m1 = mxCreateCharArray(2, iv7);
  for (i = 0; i < 23; i++) {
    cv8[i] = cv9[i];
  }

  emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 23, m1, cv8);
  emlrtAssign(&b_y, m1);
  error(b_message(y, b_y, &c_emlrtMCI), &d_emlrtMCI);
  emlrtPopRtStackR2012b(&j_emlrtRSI, emlrtRootTLSGlobal);
}

void mldivide(const real_T A[16], real_T B_data[4])
{
  real_T b_A[16];
  int8_T ipiv[4];
  int32_T iy;
  int32_T info;
  int32_T j;
  int32_T c;
  int32_T ix;
  real_T temp;
  int32_T jy;
  real_T s;
  int32_T b;
  int32_T b_j;
  boolean_T b_iy;
  int32_T ijA;
  emlrtPushRtStackR2012b(&ec_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&fc_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&hc_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&ub_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&vb_emlrtRSI, emlrtRootTLSGlobal);
  memcpy(&b_A[0], &A[0], sizeof(real_T) << 4);
  for (iy = 0; iy < 4; iy++) {
    ipiv[iy] = (int8_T)(1 + iy);
  }

  info = 0;
  for (j = 0; j < 3; j++) {
    c = j * 5;
    iy = 0;
    ix = c;
    temp = muDoubleScalarAbs(b_A[c]);
    for (jy = 2; jy <= 4 - j; jy++) {
      ix++;
      s = muDoubleScalarAbs(b_A[ix]);
      if (s > temp) {
        iy = jy - 1;
        temp = s;
      }
    }

    if (b_A[c + iy] != 0.0) {
      if (iy != 0) {
        ipiv[j] = (int8_T)((j + iy) + 1);
        ix = j;
        iy += j;
        for (jy = 0; jy < 4; jy++) {
          temp = b_A[ix];
          b_A[ix] = b_A[iy];
          b_A[iy] = temp;
          ix += 4;
          iy += 4;
        }
      }

      b = (c - j) + 4;
      emlrtPushRtStackR2012b(&wb_emlrtRSI, emlrtRootTLSGlobal);
      emlrtPopRtStackR2012b(&wb_emlrtRSI, emlrtRootTLSGlobal);
      for (iy = c + 1; iy + 1 <= b; iy++) {
        b_A[iy] /= b_A[c];
      }
    } else {
      info = j + 1;
    }

    emlrtPushRtStackR2012b(&xb_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&yb_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&ac_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&bc_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&cc_emlrtRSI, emlrtRootTLSGlobal);
    iy = c;
    jy = c + 4;
    for (b_j = 1; b_j <= 3 - j; b_j++) {
      temp = b_A[jy];
      if (b_A[jy] != 0.0) {
        ix = c + 1;
        b = (iy - j) + 8;
        emlrtPushRtStackR2012b(&dc_emlrtRSI, emlrtRootTLSGlobal);
        if (iy + 6 > b) {
          b_iy = FALSE;
        } else {
          b_iy = (b > 2147483646);
        }

        if (b_iy) {
          emlrtPushRtStackR2012b(&ab_emlrtRSI, emlrtRootTLSGlobal);
          check_forloop_overflow_error();
          emlrtPopRtStackR2012b(&ab_emlrtRSI, emlrtRootTLSGlobal);
        }

        emlrtPopRtStackR2012b(&dc_emlrtRSI, emlrtRootTLSGlobal);
        for (ijA = iy + 5; ijA + 1 <= b; ijA++) {
          b_A[ijA] += b_A[ix] * -temp;
          ix++;
        }
      }

      jy += 4;
      iy += 4;
    }

    emlrtPopRtStackR2012b(&cc_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPopRtStackR2012b(&bc_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPopRtStackR2012b(&ac_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPopRtStackR2012b(&yb_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPopRtStackR2012b(&xb_emlrtRSI, emlrtRootTLSGlobal);
  }

  if ((info == 0) && (!(b_A[15] != 0.0))) {
    info = 4;
  }

  emlrtPopRtStackR2012b(&vb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&ub_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&hc_emlrtRSI, emlrtRootTLSGlobal);
  if (info > 0) {
    emlrtPushRtStackR2012b(&gc_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&ic_emlrtRSI, emlrtRootTLSGlobal);
    eml_warning();
    emlrtPopRtStackR2012b(&ic_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPopRtStackR2012b(&gc_emlrtRSI, emlrtRootTLSGlobal);
  }

  for (iy = 0; iy < 4; iy++) {
    if (ipiv[iy] != iy + 1) {
      temp = B_data[iy];
      B_data[iy] = B_data[ipiv[iy] - 1];
      B_data[ipiv[iy] - 1] = temp;
    }
  }

  for (jy = 0; jy < 4; jy++) {
    c = jy << 2;
    if (B_data[jy] != 0.0) {
      for (iy = jy + 2; iy < 5; iy++) {
        B_data[iy - 1] -= B_data[jy] * b_A[(iy + c) - 1];
      }
    }
  }

  for (jy = 3; jy > -1; jy += -1) {
    c = jy << 2;
    if (B_data[jy] != 0.0) {
      B_data[jy] /= b_A[jy + c];
      for (iy = 0; iy + 1 <= jy; iy++) {
        B_data[iy] -= B_data[jy] * b_A[iy + c];
      }
    }
  }

  emlrtPopRtStackR2012b(&fc_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&ec_emlrtRSI, emlrtRootTLSGlobal);
}

/* End of code generation (mldivide.c) */
