/*
 * LIDAR.c
 *
 * Code generation for function 'LIDAR'
 *
 * C source code generated on: Mon May 18 16:01:38 2015
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "LIDAR.h"
#include "intersections_coder.h"
#include "LIDAR_emxutil.h"
#include "norm.h"
#include "mldivide.h"
#include "mod.h"
#include "LIDAR_mexutil.h"
#include "LIDAR_data.h"

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 13, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m" };

static emlrtRSInfo b_emlrtRSI = { 27, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m" };

static emlrtRSInfo c_emlrtRSI = { 38, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m" };

static emlrtRSInfo d_emlrtRSI = { 59, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m" };

static emlrtRSInfo e_emlrtRSI = { 78, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m" };

static emlrtRSInfo f_emlrtRSI = { 82, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m" };

static emlrtRSInfo g_emlrtRSI = { 79, "colon",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/ops/colon.m" };

static emlrtRSInfo h_emlrtRSI = { 280, "colon",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/ops/colon.m" };

static emlrtRSInfo i_emlrtRSI = { 401, "colon",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/ops/colon.m" };

static emlrtRSInfo lc_emlrtRSI = { 38, "eml_min_or_max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };

static emlrtRSInfo mc_emlrtRSI = { 73, "eml_min_or_max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };

static emlrtRSInfo nc_emlrtRSI = { 88, "eml_min_or_max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };

static emlrtRSInfo oc_emlrtRSI = { 219, "eml_min_or_max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };

static emlrtRSInfo pc_emlrtRSI = { 192, "eml_min_or_max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };

static emlrtMCInfo emlrtMCI = { 402, 5, "colon",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/ops/colon.m" };

static emlrtMCInfo b_emlrtMCI = { 401, 15, "colon",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/ops/colon.m" };

static emlrtMCInfo v_emlrtMCI = { 41, 9, "eml_min_or_max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };

static emlrtMCInfo w_emlrtMCI = { 38, 19, "eml_min_or_max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };

static emlrtMCInfo x_emlrtMCI = { 74, 9, "eml_min_or_max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };

static emlrtMCInfo y_emlrtMCI = { 73, 19, "eml_min_or_max",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };

static emlrtRTEInfo emlrtRTEI = { 281, 1, "colon",
  "C:/Program Files/MATLAB/R2013a/toolbox/eml/lib/matlab/ops/colon.m" };

static emlrtRTEInfo b_emlrtRTEI = { 1, 34, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m" };

static emlrtRTEInfo d_emlrtRTEI = { 13, 1, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m" };

static emlrtRTEInfo e_emlrtRTEI = { 14, 1, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m" };

static emlrtRTEInfo f_emlrtRTEI = { 78, 5, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m" };

static emlrtBCInfo emlrtBCI = { -1, -1, 17, 41, "ANGLE", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo b_emlrtBCI = { -1, -1, 18, 41, "ANGLE", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo c_emlrtBCI = { -1, -1, 35, 17, "MAP.OBS", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo d_emlrtBCI = { -1, -1, 38, 58, "MAP.OBS", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo e_emlrtBCI = { -1, -1, 38, 80, "MAP.OBS", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo f_emlrtBCI = { -1, -1, 84, 19, "RANGE", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtDCInfo emlrtDCI = { 84, 19, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 1 };

static emlrtBCInfo g_emlrtBCI = { -1, -1, 80, 19, "RANGE", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtDCInfo b_emlrtDCI = { 80, 19, "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 1 };

static emlrtBCInfo h_emlrtBCI = { -1, -1, 61, 9, "RANGE", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo i_emlrtBCI = { -1, -1, 59, 9, "RANGE", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo j_emlrtBCI = { -1, -1, 56, 29, "X_ITS", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo k_emlrtBCI = { -1, -1, 56, 47, "Y_ITS", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo l_emlrtBCI = { -1, -1, 56, 13, "DIST", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo m_emlrtBCI = { 1, 100, 42, 17, "X_ITS", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo n_emlrtBCI = { -1, -1, 42, 30, "XI", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo o_emlrtBCI = { -1, -1, 43, 30, "YI", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo p_emlrtBCI = { 1, 100, 31, 9, "X_ITS", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo q_emlrtBCI = { -1, -1, 31, 22, "XI", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

static emlrtBCInfo r_emlrtBCI = { -1, -1, 32, 22, "YI", "LIDAR",
  "D:/COG_Model/UM_11_24_2014/lib/system/LIDAR/LIDAR.m", 0 };

/* Function Definitions */
void LIDAR(const real_T VP[2], real_T HA, real_T LASER_RANGE, real_T ANGULAR_RES,
           const b_struct_T *MAP, emxArray_real_T *ANGLE_OUT, emxArray_real_T
           *RANGE_OUT)
{
  int32_T CNT;
  real_T anew;
  real_T IDX_180;
  boolean_T n_too_large;
  real_T ndbl;
  real_T cdiff;
  const mxArray *y;
  static const int32_T iv0[2] = { 1, 21 };

  const mxArray *m0;
  char_T cv0[21];
  int32_T i;
  static const char_T cv1[21] = { 'C', 'o', 'd', 'e', 'r', ':', 'M', 'A', 'T',
    'L', 'A', 'B', ':', 'p', 'm', 'a', 'x', 's', 'i', 'z', 'e' };

  emxArray_real_T *ANGLE;
  int32_T i0;
  int32_T nm1d2;
  int32_T k;
  real_T kd;
  uint32_T uv0[2];
  emxArray_real_T *RANGE;
  emxArray_real_T *XI;
  emxArray_real_T *YI;
  emxArray_real_T *b_MAP;
  emxArray_real_T *c_MAP;
  emxArray_real_T *d_MAP;
  emxArray_real_T *e_MAP;
  real_T dv0[2];
  real_T X_RAY[2];
  real_T dv1[2];
  real_T Y_RAY[2];
  real_T X_ITS[100];
  real_T Y_ITS[100];
  real_T b_X_RAY[2];
  real_T b_Y_RAY[2];
  int32_T j;
  real_T DIST_data[100];
  real_T b_X_ITS[2];
  const mxArray *b_y;
  static const int32_T iv1[2] = { 1, 36 };

  char_T cv2[36];
  static const char_T cv3[36] = { 'C', 'o', 'd', 'e', 'r', ':', 't', 'o', 'o',
    'l', 'b', 'o', 'x', ':', 'a', 'u', 't', 'o', 'D', 'i', 'm', 'I', 'n', 'c',
    'o', 'm', 'p', 'a', 't', 'i', 'b', 'i', 'l', 'i', 't', 'y' };

  const mxArray *c_y;
  static const int32_T iv2[2] = { 1, 39 };

  char_T cv4[39];
  static const char_T cv5[39] = { 'C', 'o', 'd', 'e', 'r', ':', 't', 'o', 'o',
    'l', 'b', 'o', 'x', ':', 'e', 'm', 'l', '_', 'm', 'i', 'n', '_', 'o', 'r',
    '_', 'm', 'a', 'x', '_', 'v', 'a', 'r', 'D', 'i', 'm', 'Z', 'e', 'r', 'o' };

  boolean_T exitg1;
  real_T x;
  real_T IDX_360;
  emxArray_real_T *IDX_OUT;
  emxArray_real_T *d_y;
  real_T absa;
  real_T absb;
  real_T b_absa;
  const mxArray *e_y;
  static const int32_T iv3[2] = { 1, 21 };

  real_T c_absa;
  const mxArray *f_y;
  static const int32_T iv4[2] = { 1, 21 };

  const mxArray *g_y;
  static const int32_T iv5[2] = { 1, 21 };

  emxArray_real_T *b_x;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);

  /*  Simulated LIDAR */
  /*  make sure the position of VP is feasible before calling this function */
  /*  VP: vehicle position */
  /*  HA: vehicle heading angle */
  /*  ANGULAR_RES Unit: Degree */
  /*  ANGLE       Unit: Radian */
  ANGULAR_RES = ANGULAR_RES * 3.1415926535897931 / 180.0;
  emlrtPushRtStackR2012b(&emlrtRSI, emlrtRootTLSGlobal);
  emlrtPushRtStackR2012b(&g_emlrtRSI, emlrtRootTLSGlobal);
  if (muDoubleScalarIsNaN(ANGULAR_RES) || muDoubleScalarIsNaN(6.2831853071795862
       - ANGULAR_RES)) {
    CNT = 0;
    anew = rtNaN;
    IDX_180 = 6.2831853071795862 - ANGULAR_RES;
    n_too_large = FALSE;
  } else if ((ANGULAR_RES == 0.0) || ((0.0 < 6.2831853071795862 - ANGULAR_RES) &&
              (ANGULAR_RES < 0.0)) || ((6.2831853071795862 - ANGULAR_RES < 0.0) &&
              (ANGULAR_RES > 0.0))) {
    CNT = -1;
    anew = 0.0;
    IDX_180 = 6.2831853071795862 - ANGULAR_RES;
    n_too_large = FALSE;
  } else if (muDoubleScalarIsInf(6.2831853071795862 - ANGULAR_RES)) {
    CNT = 0;
    anew = rtNaN;
    IDX_180 = 6.2831853071795862 - ANGULAR_RES;
    if (muDoubleScalarIsInf(ANGULAR_RES) || (0.0 == 6.2831853071795862 -
         ANGULAR_RES)) {
      n_too_large = TRUE;
    } else {
      n_too_large = FALSE;
    }

    n_too_large = !n_too_large;
  } else if (muDoubleScalarIsInf(ANGULAR_RES)) {
    CNT = 0;
    anew = 0.0;
    IDX_180 = 6.2831853071795862 - ANGULAR_RES;
    n_too_large = FALSE;
  } else {
    anew = 0.0;
    ndbl = muDoubleScalarFloor((6.2831853071795862 - ANGULAR_RES) / ANGULAR_RES
      + 0.5);
    IDX_180 = ndbl * ANGULAR_RES;
    if (ANGULAR_RES > 0.0) {
      cdiff = IDX_180 - (6.2831853071795862 - ANGULAR_RES);
    } else {
      cdiff = (6.2831853071795862 - ANGULAR_RES) - IDX_180;
    }

    if (muDoubleScalarAbs(cdiff) < 4.4408920985006262E-16 * muDoubleScalarAbs
        (6.2831853071795862 - ANGULAR_RES)) {
      ndbl++;
      IDX_180 = 6.2831853071795862 - ANGULAR_RES;
    } else if (cdiff > 0.0) {
      IDX_180 = (ndbl - 1.0) * ANGULAR_RES;
    } else {
      ndbl++;
    }

    n_too_large = (2.147483647E+9 < ndbl);
    if (ndbl >= 0.0) {
      CNT = (int32_T)ndbl - 1;
    } else {
      CNT = -1;
    }
  }

  emlrtPushRtStackR2012b(&h_emlrtRSI, emlrtRootTLSGlobal);
  if (!n_too_large) {
  } else {
    emlrtPushRtStackR2012b(&i_emlrtRSI, emlrtRootTLSGlobal);
    y = NULL;
    m0 = mxCreateCharArray(2, iv0);
    for (i = 0; i < 21; i++) {
      cv0[i] = cv1[i];
    }

    emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 21, m0, cv0);
    emlrtAssign(&y, m0);
    error(message(y, &emlrtMCI), &b_emlrtMCI);
    emlrtPopRtStackR2012b(&i_emlrtRSI, emlrtRootTLSGlobal);
  }

  emxInit_real_T(&ANGLE, 2, &d_emlrtRTEI, TRUE);
  emlrtPopRtStackR2012b(&h_emlrtRSI, emlrtRootTLSGlobal);
  i0 = ANGLE->size[0] * ANGLE->size[1];
  ANGLE->size[0] = 1;
  ANGLE->size[1] = CNT + 1;
  emxEnsureCapacity((emxArray__common *)ANGLE, i0, (int32_T)sizeof(real_T),
                    &emlrtRTEI);
  if (CNT + 1 > 0) {
    ANGLE->data[0] = anew;
    if (CNT + 1 > 1) {
      ANGLE->data[CNT] = IDX_180;
      i0 = CNT + (CNT < 0);
      if (i0 >= 0) {
        nm1d2 = (int32_T)((uint32_T)i0 >> 1);
      } else {
        nm1d2 = ~(int32_T)((uint32_T)~i0 >> 1);
      }

      for (k = 1; k < nm1d2; k++) {
        kd = (real_T)k * ANGULAR_RES;
        ANGLE->data[k] = anew + kd;
        ANGLE->data[CNT - k] = IDX_180 - kd;
      }

      if (nm1d2 << 1 == CNT) {
        ANGLE->data[nm1d2] = (anew + IDX_180) / 2.0;
      } else {
        kd = (real_T)nm1d2 * ANGULAR_RES;
        ANGLE->data[nm1d2] = anew + kd;
        ANGLE->data[nm1d2 + 1] = IDX_180 - kd;
      }
    }
  }

  emlrtPopRtStackR2012b(&g_emlrtRSI, emlrtRootTLSGlobal);
  emlrtPopRtStackR2012b(&emlrtRSI, emlrtRootTLSGlobal);
  for (i0 = 0; i0 < 2; i0++) {
    uv0[i0] = (uint32_T)ANGLE->size[i0];
  }

  emxInit_real_T(&RANGE, 2, &e_emlrtRTEI, TRUE);
  i0 = RANGE->size[0] * RANGE->size[1];
  RANGE->size[0] = 1;
  emxEnsureCapacity((emxArray__common *)RANGE, i0, (int32_T)sizeof(real_T),
                    &b_emlrtRTEI);
  i0 = RANGE->size[0] * RANGE->size[1];
  RANGE->size[1] = (int32_T)uv0[1];
  emxEnsureCapacity((emxArray__common *)RANGE, i0, (int32_T)sizeof(real_T),
                    &b_emlrtRTEI);
  k = (int32_T)uv0[1];
  for (i0 = 0; i0 < k; i0++) {
    RANGE->data[i0] = 0.0;
  }

  i = 0;
  b_emxInit_real_T(&XI, 1, &b_emlrtRTEI, TRUE);
  b_emxInit_real_T(&YI, 1, &b_emlrtRTEI, TRUE);
  b_emxInit_real_T(&b_MAP, 1, &b_emlrtRTEI, TRUE);
  b_emxInit_real_T(&c_MAP, 1, &b_emlrtRTEI, TRUE);
  b_emxInit_real_T(&d_MAP, 1, &b_emlrtRTEI, TRUE);
  b_emxInit_real_T(&e_MAP, 1, &b_emlrtRTEI, TRUE);
  while (i <= ANGLE->size[1] - 1) {
    i0 = ANGLE->size[1];
    nm1d2 = (int32_T)(1.0 + (real_T)i);
    emlrtDynamicBoundsCheckFastR2012b(nm1d2, 1, i0, &emlrtBCI,
      emlrtRootTLSGlobal);
    dv0[0] = 0.0;
    dv0[1] = LASER_RANGE * muDoubleScalarCos(ANGLE->data[i]);
    for (i0 = 0; i0 < 2; i0++) {
      X_RAY[i0] = VP[0] + dv0[i0];
    }

    i0 = ANGLE->size[1];
    nm1d2 = (int32_T)(1.0 + (real_T)i);
    emlrtDynamicBoundsCheckFastR2012b(nm1d2, 1, i0, &b_emlrtBCI,
      emlrtRootTLSGlobal);
    dv1[0] = 0.0;
    dv1[1] = LASER_RANGE * muDoubleScalarSin(ANGLE->data[i]);
    for (i0 = 0; i0 < 2; i0++) {
      Y_RAY[i0] = VP[1] + dv1[i0];
    }

    /*  intersection points */
    /* #THLD# maximum number of intersection points */
    for (nm1d2 = 0; nm1d2 < 100; nm1d2++) {
      X_ITS[nm1d2] = rtNaN;
      Y_ITS[nm1d2] = rtNaN;
    }

    CNT = 0;

    /*  [XI, YI] = intersections(X_RAY, Y_RAY, MAP.BDY(:, 1), MAP.BDY(:, 2)); */
    emlrtPushRtStackR2012b(&b_emlrtRSI, emlrtRootTLSGlobal);
    for (nm1d2 = 0; nm1d2 < 2; nm1d2++) {
      b_X_RAY[nm1d2] = X_RAY[nm1d2];
      b_Y_RAY[nm1d2] = Y_RAY[nm1d2];
    }

    k = MAP->BDY->size[0];
    i0 = b_MAP->size[0];
    b_MAP->size[0] = k;
    emxEnsureCapacity((emxArray__common *)b_MAP, i0, (int32_T)sizeof(real_T),
                      &b_emlrtRTEI);
    for (i0 = 0; i0 < k; i0++) {
      b_MAP->data[i0] = MAP->BDY->data[i0];
    }

    k = MAP->BDY->size[0];
    i0 = c_MAP->size[0];
    c_MAP->size[0] = k;
    emxEnsureCapacity((emxArray__common *)c_MAP, i0, (int32_T)sizeof(real_T),
                      &b_emlrtRTEI);
    for (i0 = 0; i0 < k; i0++) {
      c_MAP->data[i0] = MAP->BDY->data[i0 + MAP->BDY->size[0]];
    }

    intersections_coder(b_X_RAY, b_Y_RAY, b_MAP, c_MAP, XI, YI);
    emlrtPopRtStackR2012b(&b_emlrtRSI, emlrtRootTLSGlobal);
    k = 0;
    while (k <= XI->size[0] - 1) {
      CNT++;
      i0 = XI->size[0];
      nm1d2 = (int32_T)(1.0 + (real_T)k);
      X_ITS[emlrtDynamicBoundsCheckFastR2012b(CNT, 1, 100, &p_emlrtBCI,
        emlrtRootTLSGlobal) - 1] = XI->data[emlrtDynamicBoundsCheckFastR2012b
        (nm1d2, 1, i0, &q_emlrtBCI, emlrtRootTLSGlobal) - 1];
      i0 = YI->size[0];
      nm1d2 = (int32_T)(1.0 + (real_T)k);
      Y_ITS[CNT - 1] = YI->data[emlrtDynamicBoundsCheckFastR2012b(nm1d2, 1, i0,
        &r_emlrtBCI, emlrtRootTLSGlobal) - 1];
      k++;
      emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar, emlrtRootTLSGlobal);
    }

    i0 = MAP->OBS->size[1];
    emlrtDynamicBoundsCheckFastR2012b(1, 1, i0, &c_emlrtBCI, emlrtRootTLSGlobal);
    if (!(MAP->OBS->data[0].PTS->size[0] == 0)) {
      j = 0;
      while (j <= MAP->OBS->size[1] - 1) {
        /*  [XI, YI] = intersections(X_RAY, Y_RAY, MAP.OBS(j).PTS(:, 1), MAP.OBS(j).PTS(:, 2)); */
        i0 = MAP->OBS->size[1];
        nm1d2 = (int32_T)(1.0 + (real_T)j);
        emlrtDynamicBoundsCheckFastR2012b(nm1d2, 1, i0, &d_emlrtBCI,
          emlrtRootTLSGlobal);
        i0 = MAP->OBS->size[1];
        nm1d2 = (int32_T)(1.0 + (real_T)j);
        emlrtDynamicBoundsCheckFastR2012b(nm1d2, 1, i0, &e_emlrtBCI,
          emlrtRootTLSGlobal);
        emlrtPushRtStackR2012b(&c_emlrtRSI, emlrtRootTLSGlobal);
        for (nm1d2 = 0; nm1d2 < 2; nm1d2++) {
          b_X_RAY[nm1d2] = X_RAY[nm1d2];
          b_Y_RAY[nm1d2] = Y_RAY[nm1d2];
        }

        k = MAP->OBS->data[j].PTS->size[0];
        i0 = d_MAP->size[0];
        d_MAP->size[0] = k;
        emxEnsureCapacity((emxArray__common *)d_MAP, i0, (int32_T)sizeof(real_T),
                          &b_emlrtRTEI);
        for (i0 = 0; i0 < k; i0++) {
          d_MAP->data[i0] = MAP->OBS->data[j].PTS->data[i0];
        }

        k = MAP->OBS->data[j].PTS->size[0];
        i0 = e_MAP->size[0];
        e_MAP->size[0] = k;
        emxEnsureCapacity((emxArray__common *)e_MAP, i0, (int32_T)sizeof(real_T),
                          &b_emlrtRTEI);
        for (i0 = 0; i0 < k; i0++) {
          e_MAP->data[i0] = MAP->OBS->data[j].PTS->data[i0 + MAP->OBS->data[j].
            PTS->size[0]];
        }

        intersections_coder(b_X_RAY, b_Y_RAY, d_MAP, e_MAP, XI, YI);
        emlrtPopRtStackR2012b(&c_emlrtRSI, emlrtRootTLSGlobal);
        k = 0;
        while (k <= XI->size[0] - 1) {
          CNT++;
          i0 = XI->size[0];
          nm1d2 = (int32_T)(1.0 + (real_T)k);
          X_ITS[emlrtDynamicBoundsCheckFastR2012b(CNT, 1, 100, &m_emlrtBCI,
            emlrtRootTLSGlobal) - 1] = XI->
            data[emlrtDynamicBoundsCheckFastR2012b(nm1d2, 1, i0, &n_emlrtBCI,
            emlrtRootTLSGlobal) - 1];
          i0 = YI->size[0];
          nm1d2 = (int32_T)(1.0 + (real_T)k);
          Y_ITS[CNT - 1] = YI->data[emlrtDynamicBoundsCheckFastR2012b(nm1d2, 1,
            i0, &o_emlrtBCI, emlrtRootTLSGlobal) - 1];
          k++;
          emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar,
            emlrtRootTLSGlobal);
        }

        j++;
        emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar,
          emlrtRootTLSGlobal);
      }
    }

    if (1 > CNT) {
      k = 0;
    } else {
      k = CNT;
    }

    if (1 > CNT) {
      i0 = 0;
    } else {
      i0 = CNT;
    }

    if (CNT > 0) {
      for (nm1d2 = 0; nm1d2 < k; nm1d2++) {
        DIST_data[nm1d2] = 0.0;
      }

      j = 1;
      while (j - 1 <= k - 1) {
        b_X_ITS[0] = X_ITS[emlrtDynamicBoundsCheckFastR2012b(j, 1, k,
          &j_emlrtBCI, emlrtRootTLSGlobal) - 1] - VP[0];
        b_X_ITS[1] = Y_ITS[emlrtDynamicBoundsCheckFastR2012b(j, 1, i0,
          &k_emlrtBCI, emlrtRootTLSGlobal) - 1] - VP[1];
        DIST_data[emlrtDynamicBoundsCheckFastR2012b(j, 1, k, &l_emlrtBCI,
          emlrtRootTLSGlobal) - 1] = norm(b_X_ITS);
        j++;
        emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar,
          emlrtRootTLSGlobal);
      }

      emlrtPushRtStackR2012b(&d_emlrtRSI, emlrtRootTLSGlobal);
      emlrtPushRtStackR2012b(&jb_emlrtRSI, emlrtRootTLSGlobal);
      emlrtPushRtStackR2012b(&fb_emlrtRSI, emlrtRootTLSGlobal);
      if ((k == 1) || (k != 1)) {
        n_too_large = TRUE;
      } else {
        n_too_large = FALSE;
      }

      if (n_too_large) {
      } else {
        emlrtPushRtStackR2012b(&lc_emlrtRSI, emlrtRootTLSGlobal);
        b_y = NULL;
        m0 = mxCreateCharArray(2, iv1);
        for (nm1d2 = 0; nm1d2 < 36; nm1d2++) {
          cv2[nm1d2] = cv3[nm1d2];
        }

        emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 36, m0, cv2);
        emlrtAssign(&b_y, m0);
        error(message(b_y, &v_emlrtMCI), &w_emlrtMCI);
        emlrtPopRtStackR2012b(&lc_emlrtRSI, emlrtRootTLSGlobal);
      }

      if (k > 0) {
      } else {
        emlrtPushRtStackR2012b(&mc_emlrtRSI, emlrtRootTLSGlobal);
        c_y = NULL;
        m0 = mxCreateCharArray(2, iv2);
        for (nm1d2 = 0; nm1d2 < 39; nm1d2++) {
          cv4[nm1d2] = cv5[nm1d2];
        }

        emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 39, m0, cv4);
        emlrtAssign(&c_y, m0);
        error(message(c_y, &x_emlrtMCI), &y_emlrtMCI);
        emlrtPopRtStackR2012b(&mc_emlrtRSI, emlrtRootTLSGlobal);
      }

      emlrtPushRtStackR2012b(&nc_emlrtRSI, emlrtRootTLSGlobal);
      CNT = 1;
      kd = DIST_data[0];
      if (k > 1) {
        if (muDoubleScalarIsNaN(DIST_data[0])) {
          emlrtPushRtStackR2012b(&pc_emlrtRSI, emlrtRootTLSGlobal);
          emlrtPopRtStackR2012b(&pc_emlrtRSI, emlrtRootTLSGlobal);
          nm1d2 = 2;
          exitg1 = FALSE;
          while ((exitg1 == FALSE) && (nm1d2 <= k)) {
            CNT = nm1d2;
            if (!muDoubleScalarIsNaN(DIST_data[nm1d2 - 1])) {
              kd = DIST_data[nm1d2 - 1];
              exitg1 = TRUE;
            } else {
              nm1d2++;
            }
          }
        }

        if (CNT < k) {
          emlrtPushRtStackR2012b(&oc_emlrtRSI, emlrtRootTLSGlobal);
          emlrtPopRtStackR2012b(&oc_emlrtRSI, emlrtRootTLSGlobal);
          while (CNT + 1 <= k) {
            if (DIST_data[CNT] < kd) {
              kd = DIST_data[CNT];
            }

            CNT++;
          }
        }
      }

      emlrtPopRtStackR2012b(&nc_emlrtRSI, emlrtRootTLSGlobal);
      emlrtPopRtStackR2012b(&fb_emlrtRSI, emlrtRootTLSGlobal);
      emlrtPopRtStackR2012b(&jb_emlrtRSI, emlrtRootTLSGlobal);
      i0 = RANGE->size[1];
      nm1d2 = 1 + i;
      RANGE->data[emlrtDynamicBoundsCheckFastR2012b(nm1d2, 1, i0, &i_emlrtBCI,
        emlrtRootTLSGlobal) - 1] = kd;
      emlrtPopRtStackR2012b(&d_emlrtRSI, emlrtRootTLSGlobal);
    } else {
      i0 = RANGE->size[1];
      nm1d2 = 1 + i;
      RANGE->data[emlrtDynamicBoundsCheckFastR2012b(nm1d2, 1, i0, &h_emlrtBCI,
        emlrtRootTLSGlobal) - 1] = LASER_RANGE;
    }

    i++;
    emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar, emlrtRootTLSGlobal);
  }

  emxFree_real_T(&e_MAP);
  emxFree_real_T(&d_MAP);
  emxFree_real_T(&c_MAP);
  emxFree_real_T(&b_MAP);
  emxFree_real_T(&YI);
  emxFree_real_T(&XI);

  /*  including the heading angle */
  /*  only the front of the vehicle is scanned */
  /*  START_ANGLE range should be 0 to 360-ANGULAR_RES */
  /*  range of START_IDX should be 1 to 360/ANGULAR_RES */
  IDX_180 = b_mod(HA - 1.5707963267948966) / ANGULAR_RES;
  x = muDoubleScalarFloor(IDX_180);
  kd = muDoubleScalarFloor(IDX_180) + 1.0;
  IDX_180 = 3.1415926535897931 / ANGULAR_RES;
  IDX_360 = 6.2831853071795862 / ANGULAR_RES;
  emxInit_real_T(&IDX_OUT, 2, &f_emlrtRTEI, TRUE);
  emxInit_real_T(&d_y, 2, &b_emlrtRTEI, TRUE);
  if ((x + 1.0 >= 1.0) && (x + 1.0 <= IDX_180)) {
    emlrtPushRtStackR2012b(&e_emlrtRSI, emlrtRootTLSGlobal);
    IDX_180 += x + 1.0;
    emlrtPushRtStackR2012b(&g_emlrtRSI, emlrtRootTLSGlobal);
    if (muDoubleScalarIsNaN(kd) || muDoubleScalarIsNaN(IDX_180)) {
      CNT = 0;
      anew = rtNaN;
      kd = IDX_180;
      n_too_large = FALSE;
    } else if (IDX_180 < x + 1.0) {
      CNT = -1;
      anew = x + 1.0;
      kd = IDX_180;
      n_too_large = FALSE;
    } else if (muDoubleScalarIsInf(kd) || muDoubleScalarIsInf(IDX_180)) {
      CNT = 0;
      anew = rtNaN;
      kd = IDX_180;
      n_too_large = !(x + 1.0 == IDX_180);
    } else {
      anew = x + 1.0;
      ndbl = muDoubleScalarFloor((IDX_180 - (x + 1.0)) + 0.5);
      kd = (x + 1.0) + ndbl;
      cdiff = kd - IDX_180;
      absa = muDoubleScalarAbs(x + 1.0);
      absb = muDoubleScalarAbs(IDX_180);
      if (absa > absb) {
        b_absa = absa;
      } else {
        b_absa = absb;
      }

      if (muDoubleScalarAbs(cdiff) < 4.4408920985006262E-16 * b_absa) {
        ndbl++;
        kd = IDX_180;
      } else if (cdiff > 0.0) {
        kd = (x + 1.0) + (ndbl - 1.0);
      } else {
        ndbl++;
      }

      n_too_large = (2.147483647E+9 < ndbl);
      if (ndbl >= 0.0) {
        CNT = (int32_T)ndbl - 1;
      } else {
        CNT = -1;
      }
    }

    emlrtPushRtStackR2012b(&h_emlrtRSI, emlrtRootTLSGlobal);
    if (!n_too_large) {
    } else {
      emlrtPushRtStackR2012b(&i_emlrtRSI, emlrtRootTLSGlobal);
      e_y = NULL;
      m0 = mxCreateCharArray(2, iv3);
      for (i = 0; i < 21; i++) {
        cv0[i] = cv1[i];
      }

      emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 21, m0, cv0);
      emlrtAssign(&e_y, m0);
      error(message(e_y, &emlrtMCI), &b_emlrtMCI);
      emlrtPopRtStackR2012b(&i_emlrtRSI, emlrtRootTLSGlobal);
    }

    emlrtPopRtStackR2012b(&h_emlrtRSI, emlrtRootTLSGlobal);
    i0 = IDX_OUT->size[0] * IDX_OUT->size[1];
    IDX_OUT->size[0] = 1;
    IDX_OUT->size[1] = CNT + 1;
    emxEnsureCapacity((emxArray__common *)IDX_OUT, i0, (int32_T)sizeof(real_T),
                      &emlrtRTEI);
    if (CNT + 1 > 0) {
      IDX_OUT->data[0] = anew;
      if (CNT + 1 > 1) {
        IDX_OUT->data[CNT] = kd;
        i0 = CNT + (CNT < 0);
        if (i0 >= 0) {
          nm1d2 = (int32_T)((uint32_T)i0 >> 1);
        } else {
          nm1d2 = ~(int32_T)((uint32_T)~i0 >> 1);
        }

        for (k = 1; k < nm1d2; k++) {
          IDX_OUT->data[k] = anew + (real_T)k;
          IDX_OUT->data[CNT - k] = kd - (real_T)k;
        }

        if (nm1d2 << 1 == CNT) {
          IDX_OUT->data[nm1d2] = (anew + kd) / 2.0;
        } else {
          IDX_OUT->data[nm1d2] = anew + (real_T)nm1d2;
          IDX_OUT->data[nm1d2 + 1] = kd - (real_T)nm1d2;
        }
      }
    }

    emlrtPopRtStackR2012b(&g_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPopRtStackR2012b(&e_emlrtRSI, emlrtRootTLSGlobal);
    i0 = ANGLE_OUT->size[0] * ANGLE_OUT->size[1];
    ANGLE_OUT->size[0] = 1;
    ANGLE_OUT->size[1] = IDX_OUT->size[1];
    emxEnsureCapacity((emxArray__common *)ANGLE_OUT, i0, (int32_T)sizeof(real_T),
                      &b_emlrtRTEI);
    k = IDX_OUT->size[0] * IDX_OUT->size[1];
    for (i0 = 0; i0 < k; i0++) {
      ANGLE_OUT->data[i0] = (IDX_OUT->data[i0] - 1.0) * ANGULAR_RES;
    }

    i0 = RANGE_OUT->size[0] * RANGE_OUT->size[1];
    RANGE_OUT->size[0] = 1;
    RANGE_OUT->size[1] = IDX_OUT->size[1];
    emxEnsureCapacity((emxArray__common *)RANGE_OUT, i0, (int32_T)sizeof(real_T),
                      &b_emlrtRTEI);
    k = IDX_OUT->size[0] * IDX_OUT->size[1];
    for (i0 = 0; i0 < k; i0++) {
      nm1d2 = RANGE->size[1];
      kd = IDX_OUT->data[i0];
      CNT = (int32_T)emlrtIntegerCheckFastR2012b(kd, &b_emlrtDCI,
        emlrtRootTLSGlobal);
      RANGE_OUT->data[i0] = RANGE->data[emlrtDynamicBoundsCheckFastR2012b(CNT, 1,
        nm1d2, &g_emlrtBCI, emlrtRootTLSGlobal) - 1];
    }
  } else if (x + 1.0 > IDX_180) {
    emlrtPushRtStackR2012b(&f_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&g_emlrtRSI, emlrtRootTLSGlobal);
    if (muDoubleScalarIsNaN(kd) || muDoubleScalarIsNaN(IDX_360)) {
      CNT = 0;
      anew = rtNaN;
      kd = IDX_360;
      n_too_large = FALSE;
    } else if (IDX_360 < x + 1.0) {
      CNT = -1;
      anew = x + 1.0;
      kd = IDX_360;
      n_too_large = FALSE;
    } else if (muDoubleScalarIsInf(kd) || muDoubleScalarIsInf(IDX_360)) {
      CNT = 0;
      anew = rtNaN;
      kd = IDX_360;
      n_too_large = !(x + 1.0 == IDX_360);
    } else {
      anew = x + 1.0;
      ndbl = muDoubleScalarFloor((IDX_360 - (x + 1.0)) + 0.5);
      kd = (x + 1.0) + ndbl;
      cdiff = kd - IDX_360;
      absa = muDoubleScalarAbs(x + 1.0);
      absb = muDoubleScalarAbs(IDX_360);
      if (absa > absb) {
        c_absa = absa;
      } else {
        c_absa = absb;
      }

      if (muDoubleScalarAbs(cdiff) < 4.4408920985006262E-16 * c_absa) {
        ndbl++;
        kd = IDX_360;
      } else if (cdiff > 0.0) {
        kd = (x + 1.0) + (ndbl - 1.0);
      } else {
        ndbl++;
      }

      n_too_large = (2.147483647E+9 < ndbl);
      if (ndbl >= 0.0) {
        CNT = (int32_T)ndbl - 1;
      } else {
        CNT = -1;
      }
    }

    emlrtPushRtStackR2012b(&h_emlrtRSI, emlrtRootTLSGlobal);
    if (!n_too_large) {
    } else {
      emlrtPushRtStackR2012b(&i_emlrtRSI, emlrtRootTLSGlobal);
      f_y = NULL;
      m0 = mxCreateCharArray(2, iv4);
      for (i = 0; i < 21; i++) {
        cv0[i] = cv1[i];
      }

      emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 21, m0, cv0);
      emlrtAssign(&f_y, m0);
      error(message(f_y, &emlrtMCI), &b_emlrtMCI);
      emlrtPopRtStackR2012b(&i_emlrtRSI, emlrtRootTLSGlobal);
    }

    emlrtPopRtStackR2012b(&h_emlrtRSI, emlrtRootTLSGlobal);
    i0 = ANGLE->size[0] * ANGLE->size[1];
    ANGLE->size[0] = 1;
    ANGLE->size[1] = CNT + 1;
    emxEnsureCapacity((emxArray__common *)ANGLE, i0, (int32_T)sizeof(real_T),
                      &emlrtRTEI);
    if (CNT + 1 > 0) {
      ANGLE->data[0] = anew;
      if (CNT + 1 > 1) {
        ANGLE->data[CNT] = kd;
        i0 = CNT + (CNT < 0);
        if (i0 >= 0) {
          nm1d2 = (int32_T)((uint32_T)i0 >> 1);
        } else {
          nm1d2 = ~(int32_T)((uint32_T)~i0 >> 1);
        }

        for (k = 1; k < nm1d2; k++) {
          ANGLE->data[k] = anew + (real_T)k;
          ANGLE->data[CNT - k] = kd - (real_T)k;
        }

        if (nm1d2 << 1 == CNT) {
          ANGLE->data[nm1d2] = (anew + kd) / 2.0;
        } else {
          ANGLE->data[nm1d2] = anew + (real_T)nm1d2;
          ANGLE->data[nm1d2 + 1] = kd - (real_T)nm1d2;
        }
      }
    }

    emlrtPopRtStackR2012b(&g_emlrtRSI, emlrtRootTLSGlobal);
    IDX_180 = (x + 1.0) - IDX_180;
    emlrtPushRtStackR2012b(&g_emlrtRSI, emlrtRootTLSGlobal);
    if (muDoubleScalarIsNaN(IDX_180)) {
      CNT = 0;
      anew = rtNaN;
      kd = IDX_180;
      n_too_large = FALSE;
    } else if (IDX_180 < 1.0) {
      CNT = -1;
      anew = 1.0;
      kd = IDX_180;
      n_too_large = FALSE;
    } else if (muDoubleScalarIsInf(IDX_180)) {
      CNT = 0;
      anew = rtNaN;
      kd = IDX_180;
      n_too_large = !(1.0 == IDX_180);
    } else {
      anew = 1.0;
      ndbl = muDoubleScalarFloor((IDX_180 - 1.0) + 0.5);
      kd = 1.0 + ndbl;
      cdiff = (1.0 + ndbl) - IDX_180;
      if (muDoubleScalarAbs(cdiff) < 4.4408920985006262E-16 * IDX_180) {
        ndbl++;
        kd = IDX_180;
      } else if (cdiff > 0.0) {
        kd = 1.0 + (ndbl - 1.0);
      } else {
        ndbl++;
      }

      n_too_large = (2.147483647E+9 < ndbl);
      if (ndbl >= 0.0) {
        CNT = (int32_T)ndbl - 1;
      } else {
        CNT = -1;
      }
    }

    emlrtPushRtStackR2012b(&h_emlrtRSI, emlrtRootTLSGlobal);
    if (!n_too_large) {
    } else {
      emlrtPushRtStackR2012b(&i_emlrtRSI, emlrtRootTLSGlobal);
      g_y = NULL;
      m0 = mxCreateCharArray(2, iv5);
      for (i = 0; i < 21; i++) {
        cv0[i] = cv1[i];
      }

      emlrtInitCharArrayR2013a(emlrtRootTLSGlobal, 21, m0, cv0);
      emlrtAssign(&g_y, m0);
      error(message(g_y, &emlrtMCI), &b_emlrtMCI);
      emlrtPopRtStackR2012b(&i_emlrtRSI, emlrtRootTLSGlobal);
    }

    emlrtPopRtStackR2012b(&h_emlrtRSI, emlrtRootTLSGlobal);
    i0 = d_y->size[0] * d_y->size[1];
    d_y->size[0] = 1;
    d_y->size[1] = CNT + 1;
    emxEnsureCapacity((emxArray__common *)d_y, i0, (int32_T)sizeof(real_T),
                      &emlrtRTEI);
    if (CNT + 1 > 0) {
      d_y->data[0] = anew;
      if (CNT + 1 > 1) {
        d_y->data[CNT] = kd;
        i0 = CNT + (CNT < 0);
        if (i0 >= 0) {
          nm1d2 = (int32_T)((uint32_T)i0 >> 1);
        } else {
          nm1d2 = ~(int32_T)((uint32_T)~i0 >> 1);
        }

        for (k = 1; k < nm1d2; k++) {
          d_y->data[k] = anew + (real_T)k;
          d_y->data[CNT - k] = kd - (real_T)k;
        }

        if (nm1d2 << 1 == CNT) {
          d_y->data[nm1d2] = (anew + kd) / 2.0;
        } else {
          d_y->data[nm1d2] = anew + (real_T)nm1d2;
          d_y->data[nm1d2 + 1] = kd - (real_T)nm1d2;
        }
      }
    }

    emlrtPopRtStackR2012b(&g_emlrtRSI, emlrtRootTLSGlobal);
    i0 = IDX_OUT->size[0] * IDX_OUT->size[1];
    IDX_OUT->size[0] = 1;
    IDX_OUT->size[1] = ANGLE->size[1] + d_y->size[1];
    emxEnsureCapacity((emxArray__common *)IDX_OUT, i0, (int32_T)sizeof(real_T),
                      &b_emlrtRTEI);
    k = ANGLE->size[1];
    for (i0 = 0; i0 < k; i0++) {
      IDX_OUT->data[IDX_OUT->size[0] * i0] = ANGLE->data[ANGLE->size[0] * i0];
    }

    k = d_y->size[1];
    for (i0 = 0; i0 < k; i0++) {
      IDX_OUT->data[IDX_OUT->size[0] * (i0 + ANGLE->size[1])] = d_y->data
        [d_y->size[0] * i0];
    }

    emlrtPopRtStackR2012b(&f_emlrtRSI, emlrtRootTLSGlobal);
    i0 = ANGLE_OUT->size[0] * ANGLE_OUT->size[1];
    ANGLE_OUT->size[0] = 1;
    ANGLE_OUT->size[1] = IDX_OUT->size[1];
    emxEnsureCapacity((emxArray__common *)ANGLE_OUT, i0, (int32_T)sizeof(real_T),
                      &b_emlrtRTEI);
    k = IDX_OUT->size[0] * IDX_OUT->size[1];
    for (i0 = 0; i0 < k; i0++) {
      ANGLE_OUT->data[i0] = (IDX_OUT->data[i0] - 1.0) * ANGULAR_RES;
    }

    i0 = RANGE_OUT->size[0] * RANGE_OUT->size[1];
    RANGE_OUT->size[0] = 1;
    RANGE_OUT->size[1] = IDX_OUT->size[1];
    emxEnsureCapacity((emxArray__common *)RANGE_OUT, i0, (int32_T)sizeof(real_T),
                      &b_emlrtRTEI);
    k = IDX_OUT->size[0] * IDX_OUT->size[1];
    for (i0 = 0; i0 < k; i0++) {
      nm1d2 = RANGE->size[1];
      kd = IDX_OUT->data[i0];
      CNT = (int32_T)emlrtIntegerCheckFastR2012b(kd, &emlrtDCI,
        emlrtRootTLSGlobal);
      RANGE_OUT->data[i0] = RANGE->data[emlrtDynamicBoundsCheckFastR2012b(CNT, 1,
        nm1d2, &f_emlrtBCI, emlrtRootTLSGlobal) - 1];
    }
  } else {
    i0 = ANGLE_OUT->size[0] * ANGLE_OUT->size[1];
    ANGLE_OUT->size[0] = 0;
    ANGLE_OUT->size[1] = 0;
    emxEnsureCapacity((emxArray__common *)ANGLE_OUT, i0, (int32_T)sizeof(real_T),
                      &b_emlrtRTEI);
    i0 = RANGE_OUT->size[0] * RANGE_OUT->size[1];
    RANGE_OUT->size[0] = 0;
    RANGE_OUT->size[1] = 0;
    emxEnsureCapacity((emxArray__common *)RANGE_OUT, i0, (int32_T)sizeof(real_T),
                      &b_emlrtRTEI);
  }

  emxFree_real_T(&d_y);
  emxFree_real_T(&IDX_OUT);
  emxFree_real_T(&RANGE);
  emxFree_real_T(&ANGLE);

  /*  the output is in vehicle's local coordinates */
  i0 = ANGLE_OUT->size[0] * ANGLE_OUT->size[1];
  emxEnsureCapacity((emxArray__common *)ANGLE_OUT, i0, (int32_T)sizeof(real_T),
                    &b_emlrtRTEI);
  nm1d2 = ANGLE_OUT->size[0];
  CNT = ANGLE_OUT->size[1];
  k = nm1d2 * CNT;
  for (i0 = 0; i0 < k; i0++) {
    ANGLE_OUT->data[i0] -= HA;
  }

  emxInit_real_T(&b_x, 2, &b_emlrtRTEI, TRUE);
  i0 = b_x->size[0] * b_x->size[1];
  b_x->size[0] = ANGLE_OUT->size[0];
  b_x->size[1] = ANGLE_OUT->size[1];
  emxEnsureCapacity((emxArray__common *)b_x, i0, (int32_T)sizeof(real_T),
                    &b_emlrtRTEI);
  k = ANGLE_OUT->size[0] * ANGLE_OUT->size[1];
  for (i0 = 0; i0 < k; i0++) {
    b_x->data[i0] = ANGLE_OUT->data[i0];
  }

  for (i0 = 0; i0 < 2; i0++) {
    uv0[i0] = (uint32_T)ANGLE_OUT->size[i0];
  }

  i0 = ANGLE_OUT->size[0] * ANGLE_OUT->size[1];
  ANGLE_OUT->size[0] = (int32_T)uv0[0];
  ANGLE_OUT->size[1] = (int32_T)uv0[1];
  emxEnsureCapacity((emxArray__common *)ANGLE_OUT, i0, (int32_T)sizeof(real_T),
                    &c_emlrtRTEI);
  i0 = (int32_T)uv0[0] * (int32_T)uv0[1];
  for (k = 0; k < i0; k++) {
    kd = b_x->data[k] / 6.2831853071795862;
    if (muDoubleScalarAbs(kd - muDoubleScalarRound(kd)) <=
        2.2204460492503131E-16 * muDoubleScalarAbs(kd)) {
      kd = 0.0;
    } else {
      kd = (kd - muDoubleScalarFloor(kd)) * 6.2831853071795862;
    }

    ANGLE_OUT->data[k] = kd;
  }

  emxFree_real_T(&b_x);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (LIDAR.c) */
