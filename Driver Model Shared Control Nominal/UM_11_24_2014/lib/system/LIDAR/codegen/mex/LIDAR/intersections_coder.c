/*
 * intersections_coder.c
 *
 * Code generation for function 'intersections_coder'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "LIDAR.h"
#include "intersections_coder.h"
#include "mldivide.h"
#include "lu.h"
#include "LIDAR_emxutil.h"
#include "repmat.h"
#include "diff.h"
#include "LIDAR_mexutil.h"
#include "LIDAR_data.h"

/* Variable Definitions */
static emlrtRSInfo k_emlrtRSI = { 99, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo l_emlrtRSI = { 115, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo m_emlrtRSI = { 120, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo n_emlrtRSI = { 122, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo o_emlrtRSI = { 124, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo p_emlrtRSI = { 126, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo q_emlrtRSI = { 137, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo r_emlrtRSI = { 138, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo s_emlrtRSI = { 168, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo t_emlrtRSI = { 169, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo u_emlrtRSI = { 175, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo v_emlrtRSI = { 176, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRSInfo w_emlrtRSI = { 16, "error",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/lang/error.m" };

static emlrtRSInfo eb_emlrtRSI = { 16, "max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/datafun/max.m" };

static emlrtRSInfo gb_emlrtRSI = { 59, "eml_min_or_max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };

static emlrtRSInfo hb_emlrtRSI = { 117, "eml_min_or_max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };

static emlrtRSInfo ib_emlrtRSI = { 17, "eml_scalexp_alloc",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_scalexp_alloc.m"
};

static emlrtRSInfo kb_emlrtRSI = { 37, "find",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/find.m" };

static emlrtRSInfo mb_emlrtRSI = { 168, "find",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/find.m" };

static emlrtRSInfo nb_emlrtRSI = { 20, "eml_error",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_error.m" };

static emlrtRSInfo ob_emlrtRSI = { 66, "reshape",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/reshape.m" };

static emlrtRSInfo pb_emlrtRSI = { 61, "reshape",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/reshape.m" };

static emlrtRSInfo kc_emlrtRSI = { 14, "eml_li_find",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_li_find.m" };

static emlrtMCInfo e_emlrtMCI = { 16, 1, "error",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/lang/error.m" };

static emlrtMCInfo l_emlrtMCI = { 21, 17, "eml_scalexp_alloc",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_scalexp_alloc.m"
};

static emlrtMCInfo m_emlrtMCI = { 18, 17, "eml_scalexp_alloc",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_scalexp_alloc.m"
};

static emlrtMCInfo o_emlrtMCI = { 168, 9, "find",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/find.m" };

static emlrtMCInfo q_emlrtMCI = { 67, 5, "reshape",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/reshape.m" };

static emlrtMCInfo r_emlrtMCI = { 66, 15, "reshape",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/reshape.m" };

static emlrtMCInfo u_emlrtMCI = { 14, 5, "eml_li_find",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_li_find.m" };

static emlrtRTEInfo g_emlrtRTEI = { 1, 20, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRTEInfo h_emlrtRTEI = { 127, 5, "find",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/find.m" };

static emlrtRTEInfo i_emlrtRTEI = { 129, 5, "find",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/find.m" };

static emlrtRTEInfo j_emlrtRTEI = { 65, 1, "reshape",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/elmat/reshape.m" };

static emlrtRTEInfo k_emlrtRTEI = { 115, 1, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRTEInfo l_emlrtRTEI = { 159, 1, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRTEInfo m_emlrtRTEI = { 160, 1, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRTEInfo n_emlrtRTEI = { 165, 1, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRTEInfo o_emlrtRTEI = { 174, 1, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRTEInfo p_emlrtRTEI = { 120, 2, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRTEInfo q_emlrtRTEI = { 120, 4, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtRTEInfo x_emlrtRTEI = { 20, 9, "eml_li_find",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_li_find.m" };

static emlrtECInfo emlrtECI = { 1, 113, 7, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtBCInfo s_emlrtBCI = { -1, -1, 121, 13, "x2", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtECInfo b_emlrtECI = { -1, 121, 13, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtBCInfo t_emlrtBCI = { -1, -1, 121, 25, "x2", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtECInfo c_emlrtECI = { -1, 121, 25, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo d_emlrtECI = { -1, 120, 14, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtBCInfo u_emlrtBCI = { -1, -1, 123, 13, "x2", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtECInfo e_emlrtECI = { -1, 123, 13, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtBCInfo v_emlrtBCI = { -1, -1, 123, 25, "x2", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtECInfo f_emlrtECI = { -1, 123, 25, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo g_emlrtECI = { -1, 122, 2, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtBCInfo w_emlrtBCI = { -1, -1, 125, 13, "y2", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtECInfo h_emlrtECI = { -1, 125, 13, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtBCInfo x_emlrtBCI = { -1, -1, 125, 25, "y2", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtECInfo i_emlrtECI = { -1, 125, 25, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo j_emlrtECI = { -1, 124, 2, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtBCInfo y_emlrtBCI = { -1, -1, 127, 13, "y2", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtECInfo k_emlrtECI = { -1, 127, 13, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtBCInfo ab_emlrtBCI = { -1, -1, 127, 25, "y2", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtECInfo l_emlrtECI = { -1, 127, 25, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo m_emlrtECI = { -1, 126, 2, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo n_emlrtECI = { -1, 165, 7, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo o_emlrtECI = { -1, 165, 13, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo p_emlrtECI = { -1, 165, 19, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo q_emlrtECI = { -1, 165, 25, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo r_emlrtECI = { 1, 165, 6, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo s_emlrtECI = { -1, 163, 1, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo t_emlrtECI = { -1, 164, 1, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtBCInfo bb_emlrtBCI = { -1, -1, 168, 23, "AA", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtBCInfo cb_emlrtBCI = { -1, -1, 169, 23, "B", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtBCInfo db_emlrtBCI = { -1, -1, 169, 9, "T", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtECInfo u_emlrtECI = { -1, 169, 5, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtECInfo v_emlrtECI = { 2, 174, 13, "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m" };

static emlrtBCInfo eb_emlrtBCI = { -1, -1, 164, 22, "dxy2",
  "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtBCInfo fb_emlrtBCI = { -1, -1, 165, 13, "x2", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtBCInfo gb_emlrtBCI = { -1, -1, 165, 25, "y2", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtBCInfo hb_emlrtBCI = { -1, -1, 175, 10, "T", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtBCInfo ib_emlrtBCI = { -1, -1, 176, 10, "T", "intersections_coder",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/intersections_coder.m", 0 };

static emlrtRTEInfo ab_emlrtRTEI = { 20, 5, "eml_error",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_error.m" };

/* Function Declarations */
static void eml_error(void);
static void eml_li_find(const emxArray_boolean_T *x, emxArray_int32_T *y);
static void eml_scalexp_alloc(const emxArray_real_T *varargin_1, const
  emxArray_real_T *varargin_2, emxArray_real_T *z);

/* Function Definitions */
static void eml_error(void)
{
  emlrtPushRtStackR2012b(&nb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtErrorWithMessageIdR2012b(emlrtRootTLSGlobal, &ab_emlrtRTEI,
    "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  emlrtPopRtStackR2012b(&nb_emlrtRSI, emlrtRootTLSGlobal);
}

static void eml_li_find(const emxArray_boolean_T *x, emxArray_int32_T *y)
{
  int32_T k;
  int32_T i;
  const mxArray *b_y;
  const mxArray *m7;
  int32_T j;
  k = 0;
  for (i = 1; i <= x->size[0]; i++) {
    if (x->data[i - 1]) {
      k++;
    }
  }

  if (k <= x->size[0]) {
  } else {
    emlrtPushRtStackR2012b(&kc_emlrtRSI, emlrtRootTLSGlobal);
    b_y = NULL;
    m7 = mxCreateString("Assertion failed.");
    emlrtAssign(&b_y, m7);
    error(b_y, &u_emlrtMCI);
    emlrtPopRtStackR2012b(&kc_emlrtRSI, emlrtRootTLSGlobal);
  }

  j = y->size[0];
  y->size[0] = k;
  emxEnsureCapacity((emxArray__common *)y, j, (int32_T)sizeof(int32_T),
                    &x_emlrtRTEI);
  j = 0;
  for (i = 1; i <= x->size[0]; i++) {
    if (x->data[i - 1]) {
      y->data[j] = i;
      j++;
    }
  }
}

static void eml_scalexp_alloc(const emxArray_real_T *varargin_1, const
  emxArray_real_T *varargin_2, emxArray_real_T *z)
{
  uint32_T unnamed_idx_0;
  int32_T i;
  boolean_T p;
  boolean_T b_p;
  boolean_T exitg1;
  int32_T b_varargin_2[2];
  int32_T iv20[2];
  const mxArray *y;
  static const int32_T iv21[2] = { 1, 15 };

  const mxArray *m5;
  char_T cv20[15];
  static const char_T cv21[15] = { 'M', 'A', 'T', 'L', 'A', 'B', ':', 'd', 'i',
    'm', 'a', 'g', 'r', 'e', 'e' };

  unnamed_idx_0 = (uint32_T)varargin_1->size[0];
  i = z->size[0];
  z->size[0] = (int32_T)unnamed_idx_0;
  emxEnsureCapacity((emxArray__common *)z, i, (int32_T)sizeof(real_T),
                    &c_emlrtRTEI);
  p = FALSE;
  b_p = TRUE;
  i = 0;
  exitg1 = FALSE;
  while ((exitg1 == FALSE) && (i < 2)) {
    b_varargin_2[0] = varargin_2->size[0];
    b_varargin_2[1] = 1;
    iv20[0] = (int32_T)unnamed_idx_0;
    iv20[1] = 1;
    if (!(b_varargin_2[i] == iv20[i])) {
      b_p = FALSE;
      exitg1 = TRUE;
    } else {
      i++;
    }
  }

  if (!b_p) {
  } else {
    p = TRUE;
  }

  if (p) {
  } else {
    emlrtPushRtStackR2012b(&ib_emlrtRSI, emlrtRootTLSGlobal);
    y = NULL;
    m5 = mxCreateCharArray(2, iv21);
    for (i = 0; i < 15; i++) {
      cv20[i] = cv21[i];
    }

    emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 15, m5, cv20);
    emlrtAssign(&y, m5);
    error(message(y, &l_emlrtMCI), &m_emlrtMCI);
    emlrtPopRtStackR2012b(&ib_emlrtRSI, emlrtRootTLSGlobal);
  }
}

void intersections_coder(real_T x1[2], real_T b_y1[2], emxArray_real_T *x2,
  emxArray_real_T *y2, emxArray_real_T *x0, emxArray_real_T *b_y0)
{
  int32_T i;
  boolean_T guard1 = FALSE;
  int32_T jj;
  const mxArray *y;
  static const int32_T iv8[2] = { 1, 60 };

  const mxArray *m2;
  char_T cv10[60];
  static const char_T cv11[60] = { 'X', '2', ' ', 'a', 'n', 'd', ' ', 'Y', '2',
    ' ', 'm', 'u', 's', 't', ' ', 'b', 'e', ' ', 'e', 'q', 'u', 'a', 'l', '-',
    'l', 'e', 'n', 'g', 't', 'h', ' ', 'v', 'e', 'c', 't', 'o', 'r', 's', ' ',
    'o', 'f', ' ', 'a', 't', ' ', 'l', 'e', 'a', 's', 't', ' ', '2', ' ', 'p',
    'o', 'i', 'n', 't', 's', '.' };

  int32_T i1;
  real_T b_x1[4];
  emxArray_real_T *b_x2;
  real_T dxy1[2];
  emxArray_real_T *dxy2;
  int32_T loop_ub;
  int32_T idx;
  emxArray_real_T *b_i;
  emxArray_real_T *r0;
  emxArray_real_T *c_x2;
  emxArray_real_T *d_x2;
  emxArray_real_T *maxval;
  emxArray_real_T *b_maxval;
  emxArray_real_T *r1;
  emxArray_real_T *r2;
  emxArray_real_T *e_x2;
  emxArray_real_T *f_x2;
  emxArray_real_T *c_maxval;
  emxArray_boolean_T *x;
  emxArray_boolean_T *in_range;
  emxArray_real_T *b_y2;
  emxArray_real_T *c_y2;
  emxArray_real_T *d_maxval;
  emxArray_real_T *d_y2;
  emxArray_real_T *e_y2;
  emxArray_real_T *e_maxval;
  emxArray_int32_T *ii;
  emxArray_int32_T *b_jj;
  boolean_T exitg1;
  boolean_T b_guard1 = FALSE;
  const mxArray *b_y;
  emxArray_int32_T *b_ii;
  emxArray_int32_T *c_jj;
  emxArray_real_T *d_jj;
  emxArray_real_T *e_jj;
  emxArray_real_T *j;
  emxArray_real_T *c_ii;
  emxArray_real_T *d_ii;
  uint32_T varargin_1[2];
  emxArray_real_T *c_i;
  const mxArray *c_y;
  static const int32_T iv9[2] = { 1, 40 };

  char_T cv12[40];
  static const char_T cv13[40] = { 'C', 'o', 'd', 'e', 'r', ':', 'M', 'A', 'T',
    'L', 'A', 'B', ':', 'g', 'e', 't', 'R', 'e', 's', 'h', 'a', 'p', 'e', 'D',
    'i', 'm', 's', '_', 'n', 'o', 't', 'S', 'a', 'm', 'e', 'N', 'u', 'm', 'e',
    'l' };

  emxArray_real_T *b_j;
  const mxArray *d_y;
  static const int32_T iv10[2] = { 1, 40 };

  int32_T n;
  emxArray_real_T *T;
  emxArray_real_T *AA;
  emxArray_real_T *b_dxy1;
  int32_T iv11[3];
  int32_T c_dxy1[2];
  emxArray_real_T *d_dxy1;
  emxArray_real_T *c_j;
  emxArray_real_T *r3;
  int32_T iv12[3];
  static const int32_T iv13[1] = { 2 };

  emxArray_real_T *c_x1;
  emxArray_real_T *B;
  real_T b_AA[16];
  real_T U[16];
  real_T L[16];
  int32_T tmp_size[1];
  static const int32_T iv14[1] = { 4 };

  emxArray_boolean_T *r4;
  emxArray_boolean_T *r5;
  int32_T iv15[2];
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);

  /* INTERSECTIONS Intersections of curves. */
  /*    Computes the (x,y) locations where two curves intersect.  The curves */
  /*    can be broken with NaNs or have vertical segments. */
  /*  */
  /*  Example: */
  /*    [X0,Y0] = intersections(X1,Y1,X2,Y2,ROBUST); */
  /*  */
  /*  where X1 and Y1 are equal-length vectors of at least two points and */
  /*  represent curve 1.  Similarly, X2 and Y2 represent curve 2. */
  /*  X0 and Y0 are column vectors containing the points at which the two */
  /*  curves intersect. */
  /*  */
  /*  ROBUST (optional) set to 1 or true means to use a slight variation of the */
  /*  algorithm that might return duplicates of some intersection points, and */
  /*  then remove those duplicates.  The default is true, but since the */
  /*  algorithm is slightly slower you can set it to false if you know that */
  /*  your curves don't intersect at any segment boundaries.  Also, the robust */
  /*  version properly handles parallel and overlapping segments. */
  /*  */
  /*  The algorithm can return two additional vectors that indicate which */
  /*  segment pairs contain intersections and where they are: */
  /*  */
  /*    [X0,Y0,I,J] = intersections(X1,Y1,X2,Y2,ROBUST); */
  /*  */
  /*  For each element of the vector I, I(k) = (segment number of (X1,Y1)) + */
  /*  (how far along this segment the intersection is).  For example, if I(k) = */
  /*  45.25 then the intersection lies a quarter of the way between the line */
  /*  segment connecting (X1(45),Y1(45)) and (X1(46),Y1(46)).  Similarly for */
  /*  the vector J and the segments in (X2,Y2). */
  /*  */
  /*  You can also get intersections of a curve with itself.  Simply pass in */
  /*  only one curve, i.e., */
  /*  */
  /*    [X0,Y0] = intersections(X1,Y1,ROBUST); */
  /*  */
  /*  where, as before, ROBUST is optional. */
  /*  Version: 1.12, 27 January 2010 */
  /*  Author:  Douglas M. Schwarz */
  /*  Email:   dmschwarz=ieee*org, dmschwarz=urgrad*rochester*edu */
  /*  Real_email = regexprep(Email,{'=','*'},{'@','.'}) */
  /*  Theory of operation: */
  /*  */
  /*  Given two line segments, L1 and L2, */
  /*  */
  /*    L1 endpoints:  (x1(1),y1(1)) and (x1(2),y1(2)) */
  /*    L2 endpoints:  (x2(1),y2(1)) and (x2(2),y2(2)) */
  /*  */
  /*  we can write four equations with four unknowns and then solve them.  The */
  /*  four unknowns are t1, t2, x0 and y0, where (x0,y0) is the intersection of */
  /*  L1 and L2, t1 is the distance from the starting point of L1 to the */
  /*  intersection relative to the length of L1 and t2 is the distance from the */
  /*  starting point of L2 to the intersection relative to the length of L2. */
  /*  */
  /*  So, the four equations are */
  /*  */
  /*     (x1(2) - x1(1))*t1 = x0 - x1(1) */
  /*     (x2(2) - x2(1))*t2 = x0 - x2(1) */
  /*     (y1(2) - y1(1))*t1 = y0 - y1(1) */
  /*     (y2(2) - y2(1))*t2 = y0 - y2(1) */
  /*  */
  /*  Rearranging and writing in matrix form, */
  /*  */
  /*   [x1(2)-x1(1)       0       -1   0;      [t1;      [-x1(1); */
  /*         0       x2(2)-x2(1)  -1   0;   *   t2;   =   -x2(1); */
  /*    y1(2)-y1(1)       0        0  -1;       x0;       -y1(1); */
  /*         0       y2(2)-y2(1)   0  -1]       y0]       -y2(1)] */
  /*  */
  /*  Let's call that A*T = B.  We can solve for T with T = A\B. */
  /*  */
  /*  Once we have our solution we just have to look at t1 and t2 to determine */
  /*  whether L1 and L2 intersect.  If 0 <= t1 < 1 and 0 <= t2 < 1 then the two */
  /*  line segments cross and we can include (x0,y0) in the output. */
  /*  */
  /*  In principle, we have to perform this computation on every pair of line */
  /*  segments in the input data.  This can be quite a large number of pairs so */
  /*  we will reduce it by doing a simple preliminary check to eliminate line */
  /*  segment pairs that could not possibly cross.  The check is to look at the */
  /*  smallest enclosing rectangles (with sides parallel to the axes) for each */
  /*  line segment pair and see if they overlap.  If they do then we have to */
  /*  compute t1 and t2 (via the A\B computation) to see if the line segments */
  /*  cross, but if they don't then the line segments cannot cross.  In a */
  /*  typical application, this technique will eliminate most of the potential */
  /*  line segment pairs. */
  /*  self_intersect = false; */
  /*  x1 and y1 must be vectors with same number of points (at least 2). */
  /*  x2 and y2 must be vectors with same number of points (at least 2). */
  i = x2->size[0];
  guard1 = FALSE;
  if ((i > 1) != 1) {
    guard1 = TRUE;
  } else {
    jj = y2->size[0];
    if (((jj > 1) != 1) || (x2->size[0] != y2->size[0])) {
      guard1 = TRUE;
    }
  }

  if (guard1 == TRUE) {
    emlrtPushRtStackR2012b(&k_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&w_emlrtRSI, emlrtRootTLSGlobal);
    y = NULL;
    m2 = mxCreateCharArray(2, iv8);
    for (i = 0; i < 60; i++) {
      cv10[i] = cv11[i];
    }

    emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 60, m2, cv10);
    emlrtAssign(&y, m2);
    error(y, &e_emlrtMCI);
    emlrtPopRtStackR2012b(&w_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPopRtStackR2012b(&k_emlrtRSI, emlrtRootTLSGlobal);
  }

  /*  Force all inputs to be column vectors. */
  i = x2->size[0];
  i1 = x2->size[0];
  x2->size[0] = i;
  emxEnsureCapacity((emxArray__common *)x2, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i = y2->size[0];
  i1 = y2->size[0];
  y2->size[0] = i;
  emxEnsureCapacity((emxArray__common *)y2, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);

  /*  Compute number of line segments in each curve and some differences we'll */
  /*  need later. */
  i = x2->size[0];
  jj = y2->size[0];
  emlrtDimSizeEqCheckFastR2012b(i, jj, &emlrtECI, emlrtRootTLSGlobal);
  for (i1 = 0; i1 < 2; i1++) {
    b_x1[i1] = x1[i1];
    b_x1[2 + i1] = b_y1[i1];
  }

  emxInit_real_T(&b_x2, 2, &g_emlrtRTEI, TRUE);
  diff(b_x1, dxy1);
  emlrtPushRtStackR2012b(&l_emlrtRSI, emlrtRootTLSGlobal);
  i = x2->size[0];
  jj = y2->size[0];
  i1 = b_x2->size[0] * b_x2->size[1];
  b_x2->size[0] = i;
  b_x2->size[1] = 2;
  emxEnsureCapacity((emxArray__common *)b_x2, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i1 = 0;
  while (i1 <= 0) {
    for (i1 = 0; i1 < i; i1++) {
      b_x2->data[i1] = x2->data[i1];
    }

    i1 = 1;
  }

  i1 = 0;
  while (i1 <= 0) {
    for (i1 = 0; i1 < jj; i1++) {
      b_x2->data[i1 + b_x2->size[0]] = y2->data[i1];
    }

    i1 = 1;
  }

  emxInit_real_T(&dxy2, 2, &k_emlrtRTEI, TRUE);
  b_diff(b_x2, dxy2);
  emlrtPopRtStackR2012b(&l_emlrtRSI, emlrtRootTLSGlobal);

  /*  Determine the combinations of i and j where the rectangle enclosing the */
  /*  i'th line segment of curve 1 overlaps with the rectangle enclosing the */
  /*  j'th line segment of curve 2. */
  emxFree_real_T(&b_x2);
  if (1 > x2->size[0] - 1) {
    loop_ub = 0;
  } else {
    i1 = x2->size[0];
    emlrtDynamicBoundsCheckFastR2012b(1, 1, i1, &s_emlrtBCI, emlrtRootTLSGlobal);
    i1 = x2->size[0];
    idx = x2->size[0] - 1;
    loop_ub = emlrtDynamicBoundsCheckFastR2012b(idx, 1, i1, &s_emlrtBCI,
      emlrtRootTLSGlobal);
  }

  emlrtVectorVectorIndexCheckR2012b(x2->size[0], 1, 1, loop_ub, &b_emlrtECI,
    emlrtRootTLSGlobal);
  if (2 > x2->size[0]) {
    i1 = 0;
    idx = 1;
  } else {
    i1 = 1;
    idx = x2->size[0];
    jj = x2->size[0];
    idx = emlrtDynamicBoundsCheckFastR2012b(jj, 1, idx, &t_emlrtBCI,
      emlrtRootTLSGlobal) + 1;
  }

  emxInit_real_T(&b_i, 2, &p_emlrtRTEI, TRUE);
  b_emxInit_real_T(&r0, 1, &g_emlrtRTEI, TRUE);
  emlrtVectorVectorIndexCheckR2012b(x2->size[0], 1, 1, (idx - i1) - 1,
    &c_emlrtECI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&m_emlrtRSI, emlrtRootTLSGlobal);
  repmat(muDoubleScalarMin(x1[0], x1[1]), (real_T)x2->size[0] - 1.0, b_i);
  jj = r0->size[0];
  r0->size[0] = b_i->size[1];
  emxEnsureCapacity((emxArray__common *)r0, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i = b_i->size[1];
  for (jj = 0; jj < i; jj++) {
    r0->data[jj] = b_i->data[jj];
  }

  b_emxInit_real_T(&c_x2, 1, &g_emlrtRTEI, TRUE);
  emlrtPopRtStackR2012b(&m_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&m_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&eb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&fb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&gb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&hb_emlrtRSI, emlrtRootTLSGlobal);
  jj = c_x2->size[0];
  c_x2->size[0] = loop_ub;
  emxEnsureCapacity((emxArray__common *)c_x2, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  for (jj = 0; jj < loop_ub; jj++) {
    c_x2->data[jj] = x2->data[jj];
  }

  b_emxInit_real_T(&d_x2, 1, &g_emlrtRTEI, TRUE);
  jj = d_x2->size[0];
  d_x2->size[0] = (idx - i1) - 1;
  emxEnsureCapacity((emxArray__common *)d_x2, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = idx - i1;
  for (idx = 0; idx <= loop_ub - 2; idx++) {
    d_x2->data[idx] = x2->data[i1 + idx];
  }

  b_emxInit_real_T(&maxval, 1, &g_emlrtRTEI, TRUE);
  eml_scalexp_alloc(c_x2, d_x2, maxval);
  emlrtPopRtStackR2012b(&hb_emlrtRSI, emlrtRootTLSGlobal);
  idx = maxval->size[0];
  i = 0;
  emxFree_real_T(&d_x2);
  emxFree_real_T(&c_x2);
  while (i + 1 <= idx) {
    maxval->data[i] = muDoubleScalarMax(x2->data[i], x2->data[i1 + i]);
    i++;
  }

  emxInit_real_T(&b_maxval, 2, &g_emlrtRTEI, TRUE);
  emlrtPopRtStackR2012b(&gb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&fb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&eb_emlrtRSI, emlrtRootTLSGlobal);
  i1 = b_maxval->size[0] * b_maxval->size[1];
  b_maxval->size[0] = 1;
  emxEnsureCapacity((emxArray__common *)b_maxval, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i = maxval->size[0];
  i1 = b_maxval->size[0] * b_maxval->size[1];
  b_maxval->size[1] = i;
  emxEnsureCapacity((emxArray__common *)b_maxval, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = maxval->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    b_maxval->data[i1] = maxval->data[i1];
  }

  b_emxInit_real_T(&r1, 1, &g_emlrtRTEI, TRUE);
  b_repmat(b_maxval, b_i);
  i1 = r1->size[0];
  r1->size[0] = b_i->size[1];
  emxEnsureCapacity((emxArray__common *)r1, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = b_i->size[1];
  emxFree_real_T(&b_maxval);
  for (i1 = 0; i1 < loop_ub; i1++) {
    r1->data[i1] = b_i->data[i1];
  }

  emlrtPopRtStackR2012b(&m_emlrtRSI, emlrtRootTLSGlobal);
  i1 = r0->size[0];
  idx = r1->size[0];
  emlrtSizeEqCheck1DFastR2012b(i1, idx, &d_emlrtECI, emlrtRootTLSGlobal);
  if (1 > x2->size[0] - 1) {
    loop_ub = 0;
  } else {
    i1 = x2->size[0];
    emlrtDynamicBoundsCheckFastR2012b(1, 1, i1, &u_emlrtBCI, emlrtRootTLSGlobal);
    i1 = x2->size[0];
    idx = x2->size[0] - 1;
    loop_ub = emlrtDynamicBoundsCheckFastR2012b(idx, 1, i1, &u_emlrtBCI,
      emlrtRootTLSGlobal);
  }

  emlrtVectorVectorIndexCheckR2012b(x2->size[0], 1, 1, loop_ub, &e_emlrtECI,
    emlrtRootTLSGlobal);
  if (2 > x2->size[0]) {
    i1 = 0;
    idx = 1;
  } else {
    i1 = 1;
    idx = x2->size[0];
    jj = x2->size[0];
    idx = emlrtDynamicBoundsCheckFastR2012b(jj, 1, idx, &v_emlrtBCI,
      emlrtRootTLSGlobal) + 1;
  }

  b_emxInit_real_T(&r2, 1, &g_emlrtRTEI, TRUE);
  emlrtVectorVectorIndexCheckR2012b(x2->size[0], 1, 1, (idx - i1) - 1,
    &f_emlrtECI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&n_emlrtRSI, emlrtRootTLSGlobal);
  repmat(muDoubleScalarMax(x1[0], x1[1]), (real_T)x2->size[0] - 1.0, b_i);
  jj = r2->size[0];
  r2->size[0] = b_i->size[1];
  emxEnsureCapacity((emxArray__common *)r2, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i = b_i->size[1];
  for (jj = 0; jj < i; jj++) {
    r2->data[jj] = b_i->data[jj];
  }

  b_emxInit_real_T(&e_x2, 1, &g_emlrtRTEI, TRUE);
  emlrtPopRtStackR2012b(&n_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&n_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&jb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&fb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&gb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&hb_emlrtRSI, emlrtRootTLSGlobal);
  jj = e_x2->size[0];
  e_x2->size[0] = loop_ub;
  emxEnsureCapacity((emxArray__common *)e_x2, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  for (jj = 0; jj < loop_ub; jj++) {
    e_x2->data[jj] = x2->data[jj];
  }

  b_emxInit_real_T(&f_x2, 1, &g_emlrtRTEI, TRUE);
  jj = f_x2->size[0];
  f_x2->size[0] = (idx - i1) - 1;
  emxEnsureCapacity((emxArray__common *)f_x2, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = idx - i1;
  for (idx = 0; idx <= loop_ub - 2; idx++) {
    f_x2->data[idx] = x2->data[i1 + idx];
  }

  eml_scalexp_alloc(e_x2, f_x2, maxval);
  emlrtPopRtStackR2012b(&hb_emlrtRSI, emlrtRootTLSGlobal);
  idx = maxval->size[0];
  i = 0;
  emxFree_real_T(&f_x2);
  emxFree_real_T(&e_x2);
  while (i + 1 <= idx) {
    maxval->data[i] = muDoubleScalarMin(x2->data[i], x2->data[i1 + i]);
    i++;
  }

  emxInit_real_T(&c_maxval, 2, &g_emlrtRTEI, TRUE);
  emlrtPopRtStackR2012b(&gb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&fb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&jb_emlrtRSI, emlrtRootTLSGlobal);
  i1 = c_maxval->size[0] * c_maxval->size[1];
  c_maxval->size[0] = 1;
  emxEnsureCapacity((emxArray__common *)c_maxval, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i = maxval->size[0];
  i1 = c_maxval->size[0] * c_maxval->size[1];
  c_maxval->size[1] = i;
  emxEnsureCapacity((emxArray__common *)c_maxval, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = maxval->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    c_maxval->data[i1] = maxval->data[i1];
  }

  b_repmat(c_maxval, b_i);
  i1 = maxval->size[0];
  maxval->size[0] = b_i->size[1];
  emxEnsureCapacity((emxArray__common *)maxval, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = b_i->size[1];
  emxFree_real_T(&c_maxval);
  for (i1 = 0; i1 < loop_ub; i1++) {
    maxval->data[i1] = b_i->data[i1];
  }

  emxInit_boolean_T(&x, 1, &g_emlrtRTEI, TRUE);
  emlrtPopRtStackR2012b(&n_emlrtRSI, emlrtRootTLSGlobal);
  i1 = r2->size[0];
  idx = maxval->size[0];
  emlrtSizeEqCheck1DFastR2012b(i1, idx, &g_emlrtECI, emlrtRootTLSGlobal);
  i1 = x->size[0];
  x->size[0] = r0->size[0];
  emxEnsureCapacity((emxArray__common *)x, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  loop_ub = r0->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    x->data[i1] = (r0->data[i1] <= r1->data[i1]);
  }

  emxInit_boolean_T(&in_range, 1, &o_emlrtRTEI, TRUE);
  i1 = in_range->size[0];
  in_range->size[0] = r2->size[0];
  emxEnsureCapacity((emxArray__common *)in_range, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  loop_ub = r2->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    in_range->data[i1] = (r2->data[i1] >= maxval->data[i1]);
  }

  emxFree_real_T(&r2);
  i1 = x->size[0];
  idx = in_range->size[0];
  emlrtSizeEqCheck1DFastR2012b(i1, idx, &d_emlrtECI, emlrtRootTLSGlobal);
  if (1 > y2->size[0] - 1) {
    loop_ub = 0;
  } else {
    i1 = y2->size[0];
    emlrtDynamicBoundsCheckFastR2012b(1, 1, i1, &w_emlrtBCI, emlrtRootTLSGlobal);
    i1 = y2->size[0];
    idx = y2->size[0] - 1;
    loop_ub = emlrtDynamicBoundsCheckFastR2012b(idx, 1, i1, &w_emlrtBCI,
      emlrtRootTLSGlobal);
  }

  emlrtVectorVectorIndexCheckR2012b(y2->size[0], 1, 1, loop_ub, &h_emlrtECI,
    emlrtRootTLSGlobal);
  if (2 > y2->size[0]) {
    i1 = 0;
    idx = 1;
  } else {
    i1 = 1;
    idx = y2->size[0];
    jj = y2->size[0];
    idx = emlrtDynamicBoundsCheckFastR2012b(jj, 1, idx, &x_emlrtBCI,
      emlrtRootTLSGlobal) + 1;
  }

  emlrtVectorVectorIndexCheckR2012b(y2->size[0], 1, 1, (idx - i1) - 1,
    &i_emlrtECI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&o_emlrtRSI, emlrtRootTLSGlobal);
  repmat(muDoubleScalarMin(b_y1[0], b_y1[1]), (real_T)x2->size[0] - 1.0, b_i);
  jj = r0->size[0];
  r0->size[0] = b_i->size[1];
  emxEnsureCapacity((emxArray__common *)r0, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i = b_i->size[1];
  for (jj = 0; jj < i; jj++) {
    r0->data[jj] = b_i->data[jj];
  }

  b_emxInit_real_T(&b_y2, 1, &g_emlrtRTEI, TRUE);
  emlrtPopRtStackR2012b(&o_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&o_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&eb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&fb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&gb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&hb_emlrtRSI, emlrtRootTLSGlobal);
  jj = b_y2->size[0];
  b_y2->size[0] = loop_ub;
  emxEnsureCapacity((emxArray__common *)b_y2, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  for (jj = 0; jj < loop_ub; jj++) {
    b_y2->data[jj] = y2->data[jj];
  }

  b_emxInit_real_T(&c_y2, 1, &g_emlrtRTEI, TRUE);
  jj = c_y2->size[0];
  c_y2->size[0] = (idx - i1) - 1;
  emxEnsureCapacity((emxArray__common *)c_y2, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = idx - i1;
  for (idx = 0; idx <= loop_ub - 2; idx++) {
    c_y2->data[idx] = y2->data[i1 + idx];
  }

  eml_scalexp_alloc(b_y2, c_y2, maxval);
  emlrtPopRtStackR2012b(&hb_emlrtRSI, emlrtRootTLSGlobal);
  idx = maxval->size[0];
  i = 0;
  emxFree_real_T(&c_y2);
  emxFree_real_T(&b_y2);
  while (i + 1 <= idx) {
    maxval->data[i] = muDoubleScalarMax(y2->data[i], y2->data[i1 + i]);
    i++;
  }

  emxInit_real_T(&d_maxval, 2, &g_emlrtRTEI, TRUE);
  emlrtPopRtStackR2012b(&gb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&fb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&eb_emlrtRSI, emlrtRootTLSGlobal);
  i1 = d_maxval->size[0] * d_maxval->size[1];
  d_maxval->size[0] = 1;
  emxEnsureCapacity((emxArray__common *)d_maxval, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i = maxval->size[0];
  i1 = d_maxval->size[0] * d_maxval->size[1];
  d_maxval->size[1] = i;
  emxEnsureCapacity((emxArray__common *)d_maxval, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = maxval->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    d_maxval->data[i1] = maxval->data[i1];
  }

  b_repmat(d_maxval, b_i);
  i1 = r1->size[0];
  r1->size[0] = b_i->size[1];
  emxEnsureCapacity((emxArray__common *)r1, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = b_i->size[1];
  emxFree_real_T(&d_maxval);
  for (i1 = 0; i1 < loop_ub; i1++) {
    r1->data[i1] = b_i->data[i1];
  }

  emlrtPopRtStackR2012b(&o_emlrtRSI, emlrtRootTLSGlobal);
  i1 = r0->size[0];
  idx = r1->size[0];
  emlrtSizeEqCheck1DFastR2012b(i1, idx, &j_emlrtECI, emlrtRootTLSGlobal);
  i1 = x->size[0];
  emxEnsureCapacity((emxArray__common *)x, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  loop_ub = x->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    x->data[i1] = (x->data[i1] && in_range->data[i1]);
  }

  i1 = in_range->size[0];
  in_range->size[0] = r0->size[0];
  emxEnsureCapacity((emxArray__common *)in_range, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  loop_ub = r0->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    in_range->data[i1] = (r0->data[i1] <= r1->data[i1]);
  }

  i1 = x->size[0];
  idx = in_range->size[0];
  emlrtSizeEqCheck1DFastR2012b(i1, idx, &d_emlrtECI, emlrtRootTLSGlobal);
  if (1 > y2->size[0] - 1) {
    loop_ub = 0;
  } else {
    i1 = y2->size[0];
    emlrtDynamicBoundsCheckFastR2012b(1, 1, i1, &y_emlrtBCI, emlrtRootTLSGlobal);
    i1 = y2->size[0];
    idx = y2->size[0] - 1;
    loop_ub = emlrtDynamicBoundsCheckFastR2012b(idx, 1, i1, &y_emlrtBCI,
      emlrtRootTLSGlobal);
  }

  emlrtVectorVectorIndexCheckR2012b(y2->size[0], 1, 1, loop_ub, &k_emlrtECI,
    emlrtRootTLSGlobal);
  if (2 > y2->size[0]) {
    i1 = 0;
    idx = 1;
  } else {
    i1 = 1;
    idx = y2->size[0];
    jj = y2->size[0];
    idx = emlrtDynamicBoundsCheckFastR2012b(jj, 1, idx, &ab_emlrtBCI,
      emlrtRootTLSGlobal) + 1;
  }

  emlrtVectorVectorIndexCheckR2012b(y2->size[0], 1, 1, (idx - i1) - 1,
    &l_emlrtECI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&p_emlrtRSI, emlrtRootTLSGlobal);
  repmat(muDoubleScalarMax(b_y1[0], b_y1[1]), (real_T)x2->size[0] - 1.0, b_i);
  jj = r0->size[0];
  r0->size[0] = b_i->size[1];
  emxEnsureCapacity((emxArray__common *)r0, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i = b_i->size[1];
  for (jj = 0; jj < i; jj++) {
    r0->data[jj] = b_i->data[jj];
  }

  b_emxInit_real_T(&d_y2, 1, &g_emlrtRTEI, TRUE);
  emlrtPopRtStackR2012b(&p_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&p_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&jb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&fb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&gb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&hb_emlrtRSI, emlrtRootTLSGlobal);
  jj = d_y2->size[0];
  d_y2->size[0] = loop_ub;
  emxEnsureCapacity((emxArray__common *)d_y2, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  for (jj = 0; jj < loop_ub; jj++) {
    d_y2->data[jj] = y2->data[jj];
  }

  b_emxInit_real_T(&e_y2, 1, &g_emlrtRTEI, TRUE);
  jj = e_y2->size[0];
  e_y2->size[0] = (idx - i1) - 1;
  emxEnsureCapacity((emxArray__common *)e_y2, jj, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = idx - i1;
  for (idx = 0; idx <= loop_ub - 2; idx++) {
    e_y2->data[idx] = y2->data[i1 + idx];
  }

  eml_scalexp_alloc(d_y2, e_y2, maxval);
  emlrtPopRtStackR2012b(&hb_emlrtRSI, emlrtRootTLSGlobal);
  idx = maxval->size[0];
  i = 0;
  emxFree_real_T(&e_y2);
  emxFree_real_T(&d_y2);
  while (i + 1 <= idx) {
    maxval->data[i] = muDoubleScalarMin(y2->data[i], y2->data[i1 + i]);
    i++;
  }

  emxInit_real_T(&e_maxval, 2, &g_emlrtRTEI, TRUE);
  emlrtPopRtStackR2012b(&gb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&fb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&jb_emlrtRSI, emlrtRootTLSGlobal);
  i1 = e_maxval->size[0] * e_maxval->size[1];
  e_maxval->size[0] = 1;
  emxEnsureCapacity((emxArray__common *)e_maxval, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i = maxval->size[0];
  i1 = e_maxval->size[0] * e_maxval->size[1];
  e_maxval->size[1] = i;
  emxEnsureCapacity((emxArray__common *)e_maxval, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = maxval->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    e_maxval->data[i1] = maxval->data[i1];
  }

  emxFree_real_T(&maxval);
  b_repmat(e_maxval, b_i);
  i1 = r1->size[0];
  r1->size[0] = b_i->size[1];
  emxEnsureCapacity((emxArray__common *)r1, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = b_i->size[1];
  emxFree_real_T(&e_maxval);
  for (i1 = 0; i1 < loop_ub; i1++) {
    r1->data[i1] = b_i->data[i1];
  }

  emlrtPopRtStackR2012b(&p_emlrtRSI, emlrtRootTLSGlobal);
  i1 = r0->size[0];
  idx = r1->size[0];
  emlrtSizeEqCheck1DFastR2012b(i1, idx, &m_emlrtECI, emlrtRootTLSGlobal);
  i1 = x->size[0];
  emxEnsureCapacity((emxArray__common *)x, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  loop_ub = x->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    x->data[i1] = (x->data[i1] && in_range->data[i1]);
  }

  i1 = in_range->size[0];
  in_range->size[0] = r0->size[0];
  emxEnsureCapacity((emxArray__common *)in_range, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  loop_ub = r0->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    in_range->data[i1] = (r0->data[i1] >= r1->data[i1]);
  }

  emxFree_real_T(&r1);
  emxFree_real_T(&r0);
  i1 = x->size[0];
  idx = in_range->size[0];
  emlrtSizeEqCheck1DFastR2012b(i1, idx, &d_emlrtECI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&m_emlrtRSI, emlrtRootTLSGlobal);
  i1 = x->size[0];
  emxEnsureCapacity((emxArray__common *)x, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  loop_ub = x->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    x->data[i1] = (x->data[i1] && in_range->data[i1]);
  }

  emxInit_int32_T(&ii, 1, &g_emlrtRTEI, TRUE);
  emxInit_int32_T(&b_jj, 1, &g_emlrtRTEI, TRUE);
  emlrtPushRtStackR2012b(&kb_emlrtRSI, emlrtRootTLSGlobal);
  idx = 0;
  i1 = ii->size[0];
  ii->size[0] = x->size[0];
  emxEnsureCapacity((emxArray__common *)ii, i1, (int32_T)sizeof(int32_T),
                    &h_emlrtRTEI);
  i1 = b_jj->size[0];
  b_jj->size[0] = x->size[0];
  emxEnsureCapacity((emxArray__common *)b_jj, i1, (int32_T)sizeof(int32_T),
                    &i_emlrtRTEI);
  if (x->size[0] == 0) {
    i1 = ii->size[0];
    ii->size[0] = 0;
    emxEnsureCapacity((emxArray__common *)ii, i1, (int32_T)sizeof(int32_T),
                      &g_emlrtRTEI);
    i1 = b_jj->size[0];
    b_jj->size[0] = 0;
    emxEnsureCapacity((emxArray__common *)b_jj, i1, (int32_T)sizeof(int32_T),
                      &g_emlrtRTEI);
  } else {
    i = 1;
    jj = 1;
    exitg1 = FALSE;
    while ((exitg1 == FALSE) && (jj <= 1)) {
      b_guard1 = FALSE;
      if (x->data[i - 1]) {
        idx++;
        ii->data[idx - 1] = i;
        b_jj->data[idx - 1] = 1;
        if (idx >= x->size[0]) {
          exitg1 = TRUE;
        } else {
          b_guard1 = TRUE;
        }
      } else {
        b_guard1 = TRUE;
      }

      if (b_guard1 == TRUE) {
        i++;
        if (i > x->size[0]) {
          i = 1;
          jj = 2;
        }
      }
    }

    if (idx <= x->size[0]) {
    } else {
      emlrtPushRtStackR2012b(&mb_emlrtRSI, emlrtRootTLSGlobal);
      b_y = NULL;
      m2 = mxCreateString("Assertion failed.");
      emlrtAssign(&b_y, m2);
      error(b_y, &o_emlrtMCI);
      emlrtPopRtStackR2012b(&mb_emlrtRSI, emlrtRootTLSGlobal);
    }

    if (x->size[0] == 1) {
      if (idx == 0) {
        i1 = ii->size[0];
        ii->size[0] = 0;
        emxEnsureCapacity((emxArray__common *)ii, i1, (int32_T)sizeof(int32_T),
                          &g_emlrtRTEI);
        i1 = b_jj->size[0];
        b_jj->size[0] = 0;
        emxEnsureCapacity((emxArray__common *)b_jj, i1, (int32_T)sizeof(int32_T),
                          &g_emlrtRTEI);
      }
    } else {
      if (1 > idx) {
        loop_ub = 0;
      } else {
        loop_ub = idx;
      }

      emxInit_int32_T(&b_ii, 1, &g_emlrtRTEI, TRUE);
      i1 = b_ii->size[0];
      b_ii->size[0] = loop_ub;
      emxEnsureCapacity((emxArray__common *)b_ii, i1, (int32_T)sizeof(int32_T),
                        &g_emlrtRTEI);
      for (i1 = 0; i1 < loop_ub; i1++) {
        b_ii->data[i1] = ii->data[i1];
      }

      i1 = ii->size[0];
      ii->size[0] = b_ii->size[0];
      emxEnsureCapacity((emxArray__common *)ii, i1, (int32_T)sizeof(int32_T),
                        &g_emlrtRTEI);
      loop_ub = b_ii->size[0];
      for (i1 = 0; i1 < loop_ub; i1++) {
        ii->data[i1] = b_ii->data[i1];
      }

      emxFree_int32_T(&b_ii);
      if (1 > idx) {
        loop_ub = 0;
      } else {
        loop_ub = idx;
      }

      emxInit_int32_T(&c_jj, 1, &g_emlrtRTEI, TRUE);
      i1 = c_jj->size[0];
      c_jj->size[0] = loop_ub;
      emxEnsureCapacity((emxArray__common *)c_jj, i1, (int32_T)sizeof(int32_T),
                        &g_emlrtRTEI);
      for (i1 = 0; i1 < loop_ub; i1++) {
        c_jj->data[i1] = b_jj->data[i1];
      }

      i1 = b_jj->size[0];
      b_jj->size[0] = c_jj->size[0];
      emxEnsureCapacity((emxArray__common *)b_jj, i1, (int32_T)sizeof(int32_T),
                        &g_emlrtRTEI);
      loop_ub = c_jj->size[0];
      for (i1 = 0; i1 < loop_ub; i1++) {
        b_jj->data[i1] = c_jj->data[i1];
      }

      emxFree_int32_T(&c_jj);
    }
  }

  emxFree_boolean_T(&x);
  b_emxInit_real_T(&d_jj, 1, &g_emlrtRTEI, TRUE);
  emlrtPopRtStackR2012b(&kb_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&m_emlrtRSI, emlrtRootTLSGlobal);
  i1 = b_i->size[0] * b_i->size[1];
  b_i->size[0] = 1;
  emxEnsureCapacity((emxArray__common *)b_i, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i1 = d_jj->size[0];
  d_jj->size[0] = b_jj->size[0];
  emxEnsureCapacity((emxArray__common *)d_jj, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = b_jj->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    d_jj->data[i1] = b_jj->data[i1];
  }

  b_emxInit_real_T(&e_jj, 1, &g_emlrtRTEI, TRUE);
  i = d_jj->size[0];
  i1 = b_i->size[0] * b_i->size[1];
  b_i->size[1] = i;
  emxEnsureCapacity((emxArray__common *)b_i, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i1 = e_jj->size[0];
  e_jj->size[0] = b_jj->size[0];
  emxEnsureCapacity((emxArray__common *)e_jj, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = b_jj->size[0];
  emxFree_real_T(&d_jj);
  for (i1 = 0; i1 < loop_ub; i1++) {
    e_jj->data[i1] = b_jj->data[i1];
  }

  loop_ub = e_jj->size[0];
  emxFree_real_T(&e_jj);
  for (i1 = 0; i1 < loop_ub; i1++) {
    b_i->data[i1] = b_jj->data[i1];
  }

  emxFree_int32_T(&b_jj);
  emxInit_real_T(&j, 2, &q_emlrtRTEI, TRUE);
  b_emxInit_real_T(&c_ii, 1, &g_emlrtRTEI, TRUE);
  i1 = j->size[0] * j->size[1];
  j->size[0] = 1;
  emxEnsureCapacity((emxArray__common *)j, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i1 = c_ii->size[0];
  c_ii->size[0] = ii->size[0];
  emxEnsureCapacity((emxArray__common *)c_ii, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = ii->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    c_ii->data[i1] = ii->data[i1];
  }

  b_emxInit_real_T(&d_ii, 1, &g_emlrtRTEI, TRUE);
  i = c_ii->size[0];
  i1 = j->size[0] * j->size[1];
  j->size[1] = i;
  emxEnsureCapacity((emxArray__common *)j, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i1 = d_ii->size[0];
  d_ii->size[0] = ii->size[0];
  emxEnsureCapacity((emxArray__common *)d_ii, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = ii->size[0];
  emxFree_real_T(&c_ii);
  for (i1 = 0; i1 < loop_ub; i1++) {
    d_ii->data[i1] = ii->data[i1];
  }

  loop_ub = d_ii->size[0];
  emxFree_real_T(&d_ii);
  for (i1 = 0; i1 < loop_ub; i1++) {
    j->data[i1] = ii->data[i1];
  }

  /*  Force i and j to be column vectors, even when their length is zero, i.e., */
  /*  we want them to be 0-by-1 instead of 0-by-0. */
  emlrtPushRtStackR2012b(&q_emlrtRSI, emlrtRootTLSGlobal);
  jj = b_i->size[1];
  for (i1 = 0; i1 < 2; i1++) {
    varargin_1[i1] = (uint32_T)b_i->size[i1];
  }

  i = 1;
  if (varargin_1[1] > 1U) {
    i = (int32_T)varargin_1[1];
  }

  if (b_i->size[1] < i) {
  } else {
    i = b_i->size[1];
  }

  if (jj > i) {
    emlrtPushRtStackR2012b(&pb_emlrtRSI, emlrtRootTLSGlobal);
    eml_error();
    emlrtPopRtStackR2012b(&pb_emlrtRSI, emlrtRootTLSGlobal);
  }

  if (1 > i) {
    emlrtPushRtStackR2012b(&pb_emlrtRSI, emlrtRootTLSGlobal);
    eml_error();
    emlrtPopRtStackR2012b(&pb_emlrtRSI, emlrtRootTLSGlobal);
  }

  emxInit_real_T(&c_i, 2, &p_emlrtRTEI, TRUE);
  i1 = c_i->size[0] * c_i->size[1];
  c_i->size[0] = b_i->size[1];
  c_i->size[1] = 1;
  emxEnsureCapacity((emxArray__common *)c_i, i1, (int32_T)sizeof(real_T),
                    &j_emlrtRTEI);
  i = b_i->size[1];
  if (b_i->size[1] == i) {
  } else {
    emlrtPushRtStackR2012b(&ob_emlrtRSI, emlrtRootTLSGlobal);
    c_y = NULL;
    m2 = mxCreateCharArray(2, iv9);
    for (i = 0; i < 40; i++) {
      cv12[i] = cv13[i];
    }

    emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 40, m2, cv12);
    emlrtAssign(&c_y, m2);
    error(message(c_y, &q_emlrtMCI), &r_emlrtMCI);
    emlrtPopRtStackR2012b(&ob_emlrtRSI, emlrtRootTLSGlobal);
  }

  for (i = 1; i <= b_i->size[1]; i++) {
    c_i->data[i - 1] = 1.0;
  }

  emxFree_real_T(&b_i);
  emlrtPopRtStackR2012b(&q_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&r_emlrtRSI, emlrtRootTLSGlobal);
  jj = j->size[1];
  for (i1 = 0; i1 < 2; i1++) {
    varargin_1[i1] = (uint32_T)j->size[i1];
  }

  i = 1;
  if (varargin_1[1] > 1U) {
    i = (int32_T)varargin_1[1];
  }

  if (j->size[1] < i) {
  } else {
    i = j->size[1];
  }

  if (jj > i) {
    emlrtPushRtStackR2012b(&pb_emlrtRSI, emlrtRootTLSGlobal);
    eml_error();
    emlrtPopRtStackR2012b(&pb_emlrtRSI, emlrtRootTLSGlobal);
  }

  if (1 > i) {
    emlrtPushRtStackR2012b(&pb_emlrtRSI, emlrtRootTLSGlobal);
    eml_error();
    emlrtPopRtStackR2012b(&pb_emlrtRSI, emlrtRootTLSGlobal);
  }

  emxInit_real_T(&b_j, 2, &q_emlrtRTEI, TRUE);
  i1 = b_j->size[0] * b_j->size[1];
  b_j->size[0] = j->size[1];
  b_j->size[1] = 1;
  emxEnsureCapacity((emxArray__common *)b_j, i1, (int32_T)sizeof(real_T),
                    &j_emlrtRTEI);
  i = j->size[1];
  if (j->size[1] == i) {
  } else {
    emlrtPushRtStackR2012b(&ob_emlrtRSI, emlrtRootTLSGlobal);
    d_y = NULL;
    m2 = mxCreateCharArray(2, iv10);
    for (i = 0; i < 40; i++) {
      cv12[i] = cv13[i];
    }

    emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 40, m2, cv12);
    emlrtAssign(&d_y, m2);
    error(message(d_y, &q_emlrtMCI), &r_emlrtMCI);
    emlrtPopRtStackR2012b(&ob_emlrtRSI, emlrtRootTLSGlobal);
  }

  for (i = 0; i + 1 <= j->size[1]; i++) {
    b_j->data[i] = j->data[i];
  }

  emxFree_real_T(&j);
  emlrtPopRtStackR2012b(&r_emlrtRSI, emlrtRootTLSGlobal);

  /*  Find segments pairs which have at least one vertex = NaN and remove them. */
  /*  This line is a fast way of finding such segment pairs.  We take */
  /*  advantage of the fact that NaNs propagate through calculations, in */
  /*  particular subtraction (in the calculation of dxy1 and dxy2, which we */
  /*  need anyway) and addition. */
  /*  At the same time we can remove redundant combinations of i and j in the */
  /*  case of finding intersections of a line with itself. */
  /*  if self_intersect */
  /*  	remove = isnan(sum(dxy1(i,:) + dxy2(j,:),2)) | j <= i + 1; */
  /*  else */
  /*  	remove = isnan(sum(dxy1(i,:) + dxy2(j,:),2)); */
  /*  end */
  /*  i(remove) = []; */
  /*  j(remove) = []; */
  /*  Initialize matrices.  We'll put the T's and B's in matrices and use them */
  /*  one column at a time.  AA is a 3-D extension of A where we'll use one */
  /*  plane at a time. */
  if (0 == c_i->size[0]) {
    n = 0;
  } else if (c_i->size[0] > 1) {
    n = c_i->size[0];
  } else {
    n = 1;
  }

  emxInit_real_T(&T, 2, &l_emlrtRTEI, TRUE);
  i1 = T->size[0] * T->size[1];
  T->size[0] = 4;
  T->size[1] = n;
  emxEnsureCapacity((emxArray__common *)T, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = n << 2;
  for (i1 = 0; i1 < loop_ub; i1++) {
    T->data[i1] = 0.0;
  }

  c_emxInit_real_T(&AA, 3, &m_emlrtRTEI, TRUE);
  i1 = AA->size[0] * AA->size[1] * AA->size[2];
  AA->size[0] = 4;
  AA->size[1] = 4;
  AA->size[2] = n;
  emxEnsureCapacity((emxArray__common *)AA, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = 16 * n;
  for (i1 = 0; i1 < loop_ub; i1++) {
    AA->data[i1] = 0.0;
  }

  for (i1 = 0; i1 < n; i1++) {
    for (idx = 0; idx < 2; idx++) {
      AA->data[(idx + (AA->size[0] << 1)) + AA->size[0] * AA->size[1] * i1] =
        -1.0;
    }
  }

  loop_ub = AA->size[2];
  for (i1 = 0; i1 < loop_ub; i1++) {
    for (idx = 0; idx < 2; idx++) {
      AA->data[((idx + AA->size[0] * 3) + AA->size[0] * AA->size[1] * i1) + 2] =
        -1.0;
    }
  }

  loop_ub = AA->size[2];
  i1 = ii->size[0];
  ii->size[0] = loop_ub;
  emxEnsureCapacity((emxArray__common *)ii, i1, (int32_T)sizeof(int32_T),
                    &g_emlrtRTEI);
  for (i1 = 0; i1 < loop_ub; i1++) {
    ii->data[i1] = i1;
  }

  emxInit_real_T(&b_dxy1, 2, &g_emlrtRTEI, TRUE);
  iv11[0] = 2;
  iv11[1] = 1;
  iv11[2] = ii->size[0];
  i = c_i->size[0];
  i1 = b_dxy1->size[0] * b_dxy1->size[1];
  b_dxy1->size[0] = 2;
  b_dxy1->size[1] = i;
  emxEnsureCapacity((emxArray__common *)b_dxy1, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  for (i1 = 0; i1 < i; i1++) {
    for (idx = 0; idx < 2; idx++) {
      b_dxy1->data[idx + b_dxy1->size[0] * i1] = dxy1[(idx + (int32_T)c_i->
        data[i1]) - 1];
    }
  }

  for (i1 = 0; i1 < 2; i1++) {
    c_dxy1[i1] = b_dxy1->size[i1];
  }

  emxFree_real_T(&b_dxy1);
  emxInit_real_T(&d_dxy1, 2, &g_emlrtRTEI, TRUE);
  emlrtSubAssignSizeCheckR2012b(iv11, 3, c_dxy1, 2, &s_emlrtECI,
    emlrtRootTLSGlobal);
  i = c_i->size[0];
  i1 = d_dxy1->size[0] * d_dxy1->size[1];
  d_dxy1->size[0] = 2;
  d_dxy1->size[1] = i;
  emxEnsureCapacity((emxArray__common *)d_dxy1, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  for (i1 = 0; i1 < i; i1++) {
    for (idx = 0; idx < 2; idx++) {
      d_dxy1->data[idx + d_dxy1->size[0] * i1] = dxy1[(idx + (int32_T)c_i->
        data[i1]) - 1];
    }
  }

  i = ii->size[0];
  for (i1 = 0; i1 < i; i1++) {
    idx = 0;
    while (idx <= 0) {
      for (idx = 0; idx < 2; idx++) {
        AA->data[(idx << 1) + AA->size[0] * AA->size[1] * ii->data[i1]] =
          d_dxy1->data[idx + 2 * i1];
      }

      idx = 1;
    }
  }

  emxFree_real_T(&d_dxy1);
  loop_ub = AA->size[2];
  i1 = ii->size[0];
  ii->size[0] = loop_ub;
  emxEnsureCapacity((emxArray__common *)ii, i1, (int32_T)sizeof(int32_T),
                    &g_emlrtRTEI);
  for (i1 = 0; i1 < loop_ub; i1++) {
    ii->data[i1] = i1;
  }

  emxInit_real_T(&c_j, 2, &g_emlrtRTEI, TRUE);
  loop_ub = dxy2->size[1];
  i1 = c_j->size[0] * c_j->size[1];
  c_j->size[0] = b_j->size[0];
  c_j->size[1] = 1;
  emxEnsureCapacity((emxArray__common *)c_j, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  i = b_j->size[0];
  for (i1 = 0; i1 < i; i1++) {
    idx = dxy2->size[0];
    jj = (int32_T)b_j->data[i1];
    c_j->data[i1] = emlrtDynamicBoundsCheckFastR2012b(jj, 1, idx, &eb_emlrtBCI,
      emlrtRootTLSGlobal);
  }

  emxInit_real_T(&r3, 2, &g_emlrtRTEI, TRUE);
  i = b_j->size[0];
  i1 = r3->size[0] * r3->size[1];
  r3->size[0] = loop_ub;
  r3->size[1] = i;
  emxEnsureCapacity((emxArray__common *)r3, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  for (i1 = 0; i1 < i; i1++) {
    for (idx = 0; idx < loop_ub; idx++) {
      r3->data[idx + r3->size[0] * i1] = dxy2->data[((int32_T)c_j->data[i1] +
        dxy2->size[0] * idx) - 1];
    }
  }

  emxFree_real_T(&c_j);
  emxFree_real_T(&dxy2);
  iv12[0] = 2;
  iv12[1] = 1;
  iv12[2] = ii->size[0];
  emlrtSubAssignSizeCheckR2012b(iv12, 3, *(int32_T (*)[2])r3->size, 2,
    &t_emlrtECI, emlrtRootTLSGlobal);
  i = ii->size[0];
  for (i1 = 0; i1 < i; i1++) {
    idx = 0;
    while (idx <= 0) {
      for (idx = 0; idx < 2; idx++) {
        AA->data[(((idx << 1) + AA->size[0]) + AA->size[0] * AA->size[1] *
                  ii->data[i1]) + 1] = r3->data[idx + 2 * i1];
      }

      idx = 1;
    }
  }

  emxFree_real_T(&r3);
  emlrtMatrixMatrixIndexCheckR2012b(iv13, 1, *(int32_T (*)[2])c_i->size, 2,
    &n_emlrtECI, emlrtRootTLSGlobal);
  emlrtMatrixMatrixIndexCheckR2012b(*(int32_T (*)[1])x2->size, 1, *(int32_T (*)
    [2])b_j->size, 2, &o_emlrtECI, emlrtRootTLSGlobal);
  emlrtMatrixMatrixIndexCheckR2012b(iv13, 1, *(int32_T (*)[2])c_i->size, 2,
    &p_emlrtECI, emlrtRootTLSGlobal);
  emlrtMatrixMatrixIndexCheckR2012b(*(int32_T (*)[1])y2->size, 1, *(int32_T (*)
    [2])b_j->size, 2, &q_emlrtECI, emlrtRootTLSGlobal);
  loop_ub = b_j->size[0] * b_j->size[1];
  for (i1 = 0; i1 < loop_ub; i1++) {
    idx = x2->size[0];
    jj = (int32_T)b_j->data[i1];
    emlrtDynamicBoundsCheckFastR2012b(jj, 1, idx, &fb_emlrtBCI,
      emlrtRootTLSGlobal);
  }

  i1 = c_i->size[0];
  idx = b_j->size[0];
  emlrtDimSizeEqCheckFastR2012b(i1, idx, &r_emlrtECI, emlrtRootTLSGlobal);
  i1 = c_i->size[0];
  idx = c_i->size[0];
  emlrtDimSizeEqCheckFastR2012b(i1, idx, &r_emlrtECI, emlrtRootTLSGlobal);
  loop_ub = b_j->size[0] * b_j->size[1];
  for (i1 = 0; i1 < loop_ub; i1++) {
    idx = y2->size[0];
    jj = (int32_T)b_j->data[i1];
    emlrtDynamicBoundsCheckFastR2012b(jj, 1, idx, &gb_emlrtBCI,
      emlrtRootTLSGlobal);
  }

  emxInit_real_T(&c_x1, 2, &g_emlrtRTEI, TRUE);
  i1 = c_i->size[0];
  idx = b_j->size[0];
  emlrtDimSizeEqCheckFastR2012b(i1, idx, &r_emlrtECI, emlrtRootTLSGlobal);
  i1 = c_x1->size[0] * c_x1->size[1];
  c_x1->size[0] = 4;
  c_x1->size[1] = c_i->size[0];
  emxEnsureCapacity((emxArray__common *)c_x1, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = c_i->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    c_x1->data[c_x1->size[0] * i1] = x1[(int32_T)c_i->data[i1] - 1];
  }

  loop_ub = b_j->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    c_x1->data[1 + c_x1->size[0] * i1] = x2->data[(int32_T)b_j->data[i1] - 1];
  }

  loop_ub = c_i->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    c_x1->data[2 + c_x1->size[0] * i1] = b_y1[(int32_T)c_i->data[i1] - 1];
  }

  emxFree_real_T(&c_i);
  loop_ub = b_j->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    c_x1->data[3 + c_x1->size[0] * i1] = y2->data[(int32_T)b_j->data[i1] - 1];
  }

  emxFree_real_T(&b_j);
  emxInit_real_T(&B, 2, &n_emlrtRTEI, TRUE);
  i1 = B->size[0] * B->size[1];
  B->size[0] = 4;
  B->size[1] = c_x1->size[1];
  emxEnsureCapacity((emxArray__common *)B, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = c_x1->size[1];
  for (i1 = 0; i1 < loop_ub; i1++) {
    for (idx = 0; idx < 4; idx++) {
      B->data[idx + B->size[0] * i1] = -c_x1->data[idx + c_x1->size[0] * i1];
    }
  }

  emxFree_real_T(&c_x1);
  i = 0;
  while (i <= n - 1) {
    emlrtPushRtStackR2012b(&s_emlrtRSI, emlrtRootTLSGlobal);
    i1 = AA->size[2];
    idx = 1 + i;
    i1 = emlrtDynamicBoundsCheckFastR2012b(idx, 1, i1, &bb_emlrtBCI,
      emlrtRootTLSGlobal);
    for (idx = 0; idx < 4; idx++) {
      for (jj = 0; jj < 4; jj++) {
        b_AA[jj + (idx << 2)] = AA->data[(jj + AA->size[0] * idx) + AA->size[0] *
          AA->size[1] * (i1 - 1)];
      }
    }

    lu(b_AA, L, U);
    emlrtPopRtStackR2012b(&s_emlrtRSI, emlrtRootTLSGlobal);
    i1 = T->size[1];
    idx = (int32_T)(1.0 + (real_T)i);
    emlrtDynamicBoundsCheckFastR2012b(idx, 1, i1, &db_emlrtBCI,
      emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&t_emlrtRSI, emlrtRootTLSGlobal);
    i1 = B->size[1];
    idx = 1 + i;
    i1 = emlrtDynamicBoundsCheckFastR2012b(idx, 1, i1, &cb_emlrtBCI,
      emlrtRootTLSGlobal);
    tmp_size[0] = 4;
    for (idx = 0; idx < 4; idx++) {
      b_x1[idx] = B->data[idx + B->size[0] * (i1 - 1)];
    }

    mldivide(L, b_x1);
    mldivide(U, b_x1);
    emlrtPopRtStackR2012b(&t_emlrtRSI, emlrtRootTLSGlobal);
    emlrtSubAssignSizeCheckR2012b(iv14, 1, tmp_size, 1, &u_emlrtECI,
      emlrtRootTLSGlobal);
    for (i1 = 0; i1 < 4; i1++) {
      T->data[i1 + T->size[0] * i] = b_x1[i1];
    }

    i++;
    emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar, emlrtRootTLSGlobal);
  }

  emxFree_real_T(&B);
  emxFree_real_T(&AA);
  b_emxInit_boolean_T(&r4, 2, &g_emlrtRTEI, TRUE);

  /*  Find where t1 and t2 are between 0 and 1 and return the corresponding */
  /*  x0 and y0 values. */
  loop_ub = T->size[1];
  i1 = r4->size[0] * r4->size[1];
  r4->size[0] = 1;
  r4->size[1] = loop_ub;
  emxEnsureCapacity((emxArray__common *)r4, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  for (i1 = 0; i1 < loop_ub; i1++) {
    r4->data[r4->size[0] * i1] = (T->data[T->size[0] * i1] >= 0.0);
  }

  b_emxInit_boolean_T(&r5, 2, &g_emlrtRTEI, TRUE);
  loop_ub = T->size[1];
  i1 = r5->size[0] * r5->size[1];
  r5->size[0] = 1;
  r5->size[1] = loop_ub;
  emxEnsureCapacity((emxArray__common *)r5, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  for (i1 = 0; i1 < loop_ub; i1++) {
    r5->data[r5->size[0] * i1] = (T->data[1 + T->size[0] * i1] >= 0.0);
  }

  for (i1 = 0; i1 < 2; i1++) {
    c_dxy1[i1] = r4->size[i1];
  }

  for (i1 = 0; i1 < 2; i1++) {
    iv15[i1] = r5->size[i1];
  }

  emlrtSizeEqCheck2DFastR2012b(c_dxy1, iv15, &v_emlrtECI, emlrtRootTLSGlobal);
  i1 = r4->size[0] * r4->size[1];
  r4->size[0] = 1;
  emxEnsureCapacity((emxArray__common *)r4, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  i1 = r4->size[0];
  idx = r4->size[1];
  loop_ub = i1 * idx;
  for (i1 = 0; i1 < loop_ub; i1++) {
    r4->data[i1] = (r4->data[i1] && r5->data[i1]);
  }

  loop_ub = T->size[1];
  i1 = r5->size[0] * r5->size[1];
  r5->size[0] = 1;
  r5->size[1] = loop_ub;
  emxEnsureCapacity((emxArray__common *)r5, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  for (i1 = 0; i1 < loop_ub; i1++) {
    r5->data[r5->size[0] * i1] = (T->data[T->size[0] * i1] < 1.0);
  }

  for (i1 = 0; i1 < 2; i1++) {
    c_dxy1[i1] = r4->size[i1];
  }

  for (i1 = 0; i1 < 2; i1++) {
    iv15[i1] = r5->size[i1];
  }

  emlrtSizeEqCheck2DFastR2012b(c_dxy1, iv15, &v_emlrtECI, emlrtRootTLSGlobal);
  i1 = r4->size[0] * r4->size[1];
  r4->size[0] = 1;
  emxEnsureCapacity((emxArray__common *)r4, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  i1 = r4->size[0];
  idx = r4->size[1];
  loop_ub = i1 * idx;
  for (i1 = 0; i1 < loop_ub; i1++) {
    r4->data[i1] = (r4->data[i1] && r5->data[i1]);
  }

  loop_ub = T->size[1];
  i1 = r5->size[0] * r5->size[1];
  r5->size[0] = 1;
  r5->size[1] = loop_ub;
  emxEnsureCapacity((emxArray__common *)r5, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  for (i1 = 0; i1 < loop_ub; i1++) {
    r5->data[r5->size[0] * i1] = (T->data[1 + T->size[0] * i1] < 1.0);
  }

  for (i1 = 0; i1 < 2; i1++) {
    c_dxy1[i1] = r4->size[i1];
  }

  for (i1 = 0; i1 < 2; i1++) {
    iv15[i1] = r5->size[i1];
  }

  emlrtSizeEqCheck2DFastR2012b(c_dxy1, iv15, &v_emlrtECI, emlrtRootTLSGlobal);
  i1 = in_range->size[0];
  in_range->size[0] = r4->size[1];
  emxEnsureCapacity((emxArray__common *)in_range, i1, (int32_T)sizeof(boolean_T),
                    &g_emlrtRTEI);
  loop_ub = r4->size[1];
  for (i1 = 0; i1 < loop_ub; i1++) {
    in_range->data[i1] = (r4->data[i1] && r5->data[i1]);
  }

  emxFree_boolean_T(&r5);
  emxFree_boolean_T(&r4);
  emlrtPushRtStackR2012b(&u_emlrtRSI, emlrtRootTLSGlobal);
  eml_li_find(in_range, ii);
  i1 = x0->size[0];
  x0->size[0] = ii->size[0];
  emxEnsureCapacity((emxArray__common *)x0, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = ii->size[0];
  for (i1 = 0; i1 < loop_ub; i1++) {
    idx = T->size[1];
    jj = ii->data[i1];
    x0->data[i1] = T->data[2 + T->size[0] * (emlrtDynamicBoundsCheckFastR2012b
      (jj, 1, idx, &hb_emlrtBCI, emlrtRootTLSGlobal) - 1)];
  }

  emlrtPopRtStackR2012b(&u_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&v_emlrtRSI, emlrtRootTLSGlobal);
  eml_li_find(in_range, ii);
  i1 = b_y0->size[0];
  b_y0->size[0] = ii->size[0];
  emxEnsureCapacity((emxArray__common *)b_y0, i1, (int32_T)sizeof(real_T),
                    &g_emlrtRTEI);
  loop_ub = ii->size[0];
  emxFree_boolean_T(&in_range);
  for (i1 = 0; i1 < loop_ub; i1++) {
    idx = T->size[1];
    jj = ii->data[i1];
    b_y0->data[i1] = T->data[3 + T->size[0] * (emlrtDynamicBoundsCheckFastR2012b
      (jj, 1, idx, &ib_emlrtBCI, emlrtRootTLSGlobal) - 1)];
  }

  emxFree_int32_T(&ii);
  emxFree_real_T(&T);
  emlrtPopRtStackR2012b(&v_emlrtRSI, emlrtRootTLSGlobal);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (intersections_coder.c) */
