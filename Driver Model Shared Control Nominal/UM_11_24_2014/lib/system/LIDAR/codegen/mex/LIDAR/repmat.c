/*
 * repmat.c
 *
 * Code generation for function 'repmat'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "LIDAR.h"
#include "repmat.h"
#include "LIDAR_emxutil.h"
#include "mldivide.h"
#include "LIDAR_mexutil.h"

/* Variable Definitions */
static emlrtRSInfo bb_emlrtRSI = { 19, "repmat",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/repmat.m" };

static emlrtRSInfo cb_emlrtRSI = { 48, "eml_assert_valid_size_arg",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_assert_valid_size_arg.m"
};

static emlrtRSInfo db_emlrtRSI = { 52, "eml_assert_valid_size_arg",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_assert_valid_size_arg.m"
};

static emlrtMCInfo h_emlrtMCI = { 49, 13, "eml_assert_valid_size_arg",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_assert_valid_size_arg.m"
};

static emlrtMCInfo i_emlrtMCI = { 48, 23, "eml_assert_valid_size_arg",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_assert_valid_size_arg.m"
};

static emlrtMCInfo j_emlrtMCI = { 53, 5, "eml_assert_valid_size_arg",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_assert_valid_size_arg.m"
};

static emlrtMCInfo k_emlrtMCI = { 52, 15, "eml_assert_valid_size_arg",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_assert_valid_size_arg.m"
};

static emlrtRTEInfo u_emlrtRTEI = { 1, 14, "repmat",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/repmat.m" };

static emlrtRTEInfo v_emlrtRTEI = { 45, 1, "repmat",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/repmat.m" };

/* Function Definitions */
void b_repmat(const emxArray_real_T *a, emxArray_real_T *b)
{
  int32_T outsize[2];
  int32_T ib;
  int32_T iacol;
  int32_T jcol;
  for (ib = 0; ib < 2; ib++) {
    outsize[ib] = a->size[ib];
  }

  ib = b->size[0] * b->size[1];
  b->size[0] = 1;
  b->size[1] = outsize[1];
  emxEnsureCapacity((emxArray__common *)b, ib, (int32_T)sizeof(real_T),
                    &v_emlrtRTEI);
  if (outsize[1] == 0) {
  } else {
    ib = 0;
    iacol = 0;
    for (jcol = 1; jcol <= a->size[1]; jcol++) {
      b->data[ib] = a->data[iacol];
      ib++;
      iacol++;
    }
  }
}

void repmat(real_T a, real_T n, emxArray_real_T *b)
{
  boolean_T p;
  const mxArray *y;
  static const int32_T iv17[2] = { 1, 28 };

  const mxArray *m4;
  char_T cv16[28];
  int32_T i;
  static const char_T cv17[28] = { 'C', 'o', 'd', 'e', 'r', ':', 'M', 'A', 'T',
    'L', 'A', 'B', ':', 'N', 'o', 'n', 'I', 'n', 't', 'e', 'g', 'e', 'r', 'I',
    'n', 'p', 'u', 't' };

  real_T b_n;
  const mxArray *b_y;
  static const int32_T iv18[2] = { 1, 21 };

  char_T cv18[21];
  static const char_T cv19[21] = { 'C', 'o', 'd', 'e', 'r', ':', 'M', 'A', 'T',
    'L', 'A', 'B', ':', 'p', 'm', 'a', 'x', 's', 'i', 'z', 'e' };

  int32_T iv19[2];
  int32_T outsize[2];
  int32_T loop_ub;
  emlrtPushRtStackR2012b(&bb_emlrtRSI, emlrtRootTLSGlobal);
  if ((n != n) || muDoubleScalarIsInf(n)) {
    p = FALSE;
  } else {
    p = TRUE;
  }

  if (p) {
  } else {
    emlrtPushRtStackR2012b(&cb_emlrtRSI, emlrtRootTLSGlobal);
    y = NULL;
    m4 = mxCreateCharArray(2, iv17);
    for (i = 0; i < 28; i++) {
      cv16[i] = cv17[i];
    }

    emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 28, m4, cv16);
    emlrtAssign(&y, m4);
    error(message(y, &h_emlrtMCI), &i_emlrtMCI);
    emlrtPopRtStackR2012b(&cb_emlrtRSI, emlrtRootTLSGlobal);
  }

  if (n <= 0.0) {
    b_n = 0.0;
  } else {
    b_n = n;
  }

  if (2.147483647E+9 >= b_n) {
  } else {
    emlrtPushRtStackR2012b(&db_emlrtRSI, emlrtRootTLSGlobal);
    b_y = NULL;
    m4 = mxCreateCharArray(2, iv18);
    for (i = 0; i < 21; i++) {
      cv18[i] = cv19[i];
    }

    emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 21, m4, cv18);
    emlrtAssign(&b_y, m4);
    error(message(b_y, &j_emlrtMCI), &k_emlrtMCI);
    emlrtPopRtStackR2012b(&db_emlrtRSI, emlrtRootTLSGlobal);
  }

  emlrtPopRtStackR2012b(&bb_emlrtRSI, emlrtRootTLSGlobal);
  iv19[0] = 1;
  iv19[1] = (int32_T)n;
  for (i = 0; i < 2; i++) {
    outsize[i] = iv19[i];
  }

  i = b->size[0] * b->size[1];
  b->size[0] = 1;
  emxEnsureCapacity((emxArray__common *)b, i, (int32_T)sizeof(real_T),
                    &u_emlrtRTEI);
  i = b->size[0] * b->size[1];
  b->size[1] = outsize[1];
  emxEnsureCapacity((emxArray__common *)b, i, (int32_T)sizeof(real_T),
                    &u_emlrtRTEI);
  loop_ub = outsize[1];
  for (i = 0; i < loop_ub; i++) {
    b->data[i] = a;
  }
}

/* End of code generation (repmat.c) */
