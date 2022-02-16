/*
 * diff.c
 *
 * Code generation for function 'diff'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "LIDAR.h"
#include "diff.h"
#include "LIDAR_emxutil.h"
#include "mldivide.h"
#include "LIDAR_mexutil.h"
#include "LIDAR_data.h"

/* Variable Definitions */
static emlrtRSInfo x_emlrtRSI = { 98, "diff",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/datafun/diff.m" };

static emlrtRSInfo y_emlrtRSI = { 44, "diff",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/datafun/diff.m" };

static emlrtMCInfo f_emlrtMCI = { 45, 9, "diff",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/datafun/diff.m" };

static emlrtMCInfo g_emlrtMCI = { 44, 19, "diff",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/datafun/diff.m" };

static emlrtRTEInfo r_emlrtRTEI = { 1, 14, "diff",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/datafun/diff.m" };

static emlrtRTEInfo t_emlrtRTEI = { 71, 1, "diff",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/datafun/diff.m" };

/* Function Definitions */
void b_diff(const emxArray_real_T *x, emxArray_real_T *y)
{
  int32_T i;
  boolean_T overflow;
  const mxArray *b_y;
  static const int32_T iv16[2] = { 1, 36 };

  const mxArray *m3;
  char_T cv14[36];
  static const char_T cv15[36] = { 'C', 'o', 'd', 'e', 'r', ':', 't', 'o', 'o',
    'l', 'b', 'o', 'x', ':', 'a', 'u', 't', 'o', 'D', 'i', 'm', 'I', 'n', 'c',
    'o', 'm', 'p', 'a', 't', 'i', 'b', 'i', 'l', 'i', 't', 'y' };

  emxArray_real_T *b_y1;
  int32_T iyStart;
  int32_T r;
  int32_T ixLead;
  int32_T iyLead;
  real_T work_data_idx_0;
  int32_T m;
  real_T tmp1;
  real_T tmp2;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  if (x->size[0] == 0) {
    i = y->size[0] * y->size[1];
    y->size[0] = 0;
    y->size[1] = 2;
    emxEnsureCapacity((emxArray__common *)y, i, (int32_T)sizeof(real_T),
                      &r_emlrtRTEI);
  } else if (muIntScalarMin_sint32(x->size[0] - 1, 1) < 1) {
    i = y->size[0] * y->size[1];
    y->size[0] = 0;
    y->size[1] = 0;
    emxEnsureCapacity((emxArray__common *)y, i, (int32_T)sizeof(real_T),
                      &r_emlrtRTEI);
  } else {
    overflow = (x->size[0] != 1);
    if (overflow) {
    } else {
      emlrtPushRtStackR2012b(&y_emlrtRSI, emlrtRootTLSGlobal);
      b_y = NULL;
      m3 = mxCreateCharArray(2, iv16);
      for (i = 0; i < 36; i++) {
        cv14[i] = cv15[i];
      }

      emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 36, m3, cv14);
      emlrtAssign(&b_y, m3);
      error(message(b_y, &f_emlrtMCI), &g_emlrtMCI);
      emlrtPopRtStackR2012b(&y_emlrtRSI, emlrtRootTLSGlobal);
    }

    emxInit_real_T(&b_y1, 2, &t_emlrtRTEI, TRUE);
    i = b_y1->size[0] * b_y1->size[1];
    b_y1->size[0] = x->size[0] - 1;
    b_y1->size[1] = 2;
    emxEnsureCapacity((emxArray__common *)b_y1, i, (int32_T)sizeof(real_T),
                      &t_emlrtRTEI);
    i = 1;
    iyStart = 1;
    for (r = 0; r < 2; r++) {
      ixLead = i;
      iyLead = iyStart;
      work_data_idx_0 = x->data[i - 1];
      emlrtPushRtStackR2012b(&x_emlrtRSI, emlrtRootTLSGlobal);
      if (2 > x->size[0]) {
        overflow = FALSE;
      } else {
        overflow = (x->size[0] > 2147483646);
      }

      if (overflow) {
        emlrtPushRtStackR2012b(&ab_emlrtRSI, emlrtRootTLSGlobal);
        check_forloop_overflow_error();
        emlrtPopRtStackR2012b(&ab_emlrtRSI, emlrtRootTLSGlobal);
      }

      emlrtPopRtStackR2012b(&x_emlrtRSI, emlrtRootTLSGlobal);
      for (m = 2; m <= x->size[0]; m++) {
        tmp1 = x->data[ixLead];
        tmp2 = work_data_idx_0;
        work_data_idx_0 = tmp1;
        tmp1 -= tmp2;
        ixLead++;
        b_y1->data[iyLead - 1] = tmp1;
        iyLead++;
      }

      i += x->size[0];
      iyStart = (iyStart + x->size[0]) - 1;
    }

    i = y->size[0] * y->size[1];
    y->size[0] = b_y1->size[0];
    y->size[1] = 2;
    emxEnsureCapacity((emxArray__common *)y, i, (int32_T)sizeof(real_T),
                      &r_emlrtRTEI);
    iyStart = b_y1->size[0] * b_y1->size[1];
    for (i = 0; i < iyStart; i++) {
      y->data[i] = b_y1->data[i];
    }

    emxFree_real_T(&b_y1);
  }

  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
}

void diff(const real_T x[4], real_T y[2])
{
  int32_T ixStart;
  int32_T iyStart;
  int32_T r;
  ixStart = 1;
  iyStart = 0;
  for (r = 0; r < 2; r++) {
    y[iyStart] = x[ixStart] - x[ixStart - 1];
    ixStart += 2;
    iyStart++;
  }
}

/* End of code generation (diff.c) */
