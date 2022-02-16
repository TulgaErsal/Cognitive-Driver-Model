/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_LIDAR_api.c
 *
 * Code generation for function '_coder_LIDAR_api'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "LIDAR.h"
#include "_coder_LIDAR_api.h"
#include "LIDAR_emxutil.h"
#include "LIDAR_data.h"

/* Variable Definitions */
static emlrtRTEInfo r_emlrtRTEI = { 1, 1, "_coder_LIDAR_api", "" };

/* Function Declarations */
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[2];
static real_T c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *HA, const
  char_T *identifier);
static real_T d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId);
static void e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *MAP, const
  char_T *identifier, struct0_T *y);
static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *VP, const
  char_T *identifier))[2];
static const mxArray *emlrt_marshallOut(const emxArray_real_T *u);
static void f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, struct0_T *y);
static void g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, emxArray_char_T *y);
static void h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, emxArray_real_T *y);
static void i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, emxArray_struct1_T *y);
static real_T (*j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[2];
static real_T k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId);
static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, emxArray_char_T *ret);
static void m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, emxArray_real_T *ret);

/* Function Definitions */
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[2]
{
  real_T (*y)[2];
  y = j_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
  static real_T c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *HA,
  const char_T *identifier)
{
  real_T y;
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  y = d_emlrt_marshallIn(sp, emlrtAlias(HA), &thisId);
  emlrtDestroyArray(&HA);
  return y;
}

static real_T d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = k_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static void e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *MAP, const
  char_T *identifier, struct0_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  f_emlrt_marshallIn(sp, emlrtAlias(MAP), &thisId, y);
  emlrtDestroyArray(&MAP);
}

static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray *VP, const
  char_T *identifier))[2]
{
  real_T (*y)[2];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  y = b_emlrt_marshallIn(sp, emlrtAlias(VP), &thisId);
  emlrtDestroyArray(&VP);
  return y;
}
  static const mxArray *emlrt_marshallOut(const emxArray_real_T *u)
{
  const mxArray *y;
  static const int32_T iv8[2] = { 0, 0 };

  const mxArray *m3;
  y = NULL;
  m3 = emlrtCreateNumericArray(2, iv8, mxDOUBLE_CLASS, mxREAL);
  mxSetData((mxArray *)m3, (void *)u->data);
  emlrtSetDimensions((mxArray *)m3, u->size, 2);
  emlrtAssign(&y, m3);
  return y;
}

static void f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, struct0_T *y)
{
  emlrtMsgIdentifier thisId;
  static const char * fieldNames[3] = { "NAME", "BDY", "OBS" };

  thisId.fParent = parentId;
  emlrtCheckStructR2012b(sp, parentId, u, 3, fieldNames, 0U, 0);
  thisId.fIdentifier = "NAME";
  g_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2013a(sp, u, 0, "NAME")),
                     &thisId, y->NAME);
  thisId.fIdentifier = "BDY";
  h_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2013a(sp, u, 0, "BDY")),
                     &thisId, y->BDY);
  thisId.fIdentifier = "OBS";
  i_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2013a(sp, u, 0, "OBS")),
                     &thisId, y->OBS);
  emlrtDestroyArray(&u);
}

static void g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, emxArray_char_T *y)
{
  l_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, emxArray_real_T *y)
{
  m_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, emxArray_struct1_T *y)
{
  emlrtMsgIdentifier thisId;
  int32_T iv7[2];
  int32_T i9;
  int32_T sizes[2];
  boolean_T bv0[2] = { false, true };

  static const char * fieldNames[1] = { "PTS" };

  int32_T n;
  thisId.fParent = parentId;
  for (i9 = 0; i9 < 2; i9++) {
    iv7[i9] = 1 + -2 * i9;
  }

  emlrtCheckVsStructR2012b(sp, parentId, u, 1, fieldNames, 2U, iv7, &bv0[0],
    sizes);
  i9 = y->size[0] * y->size[1];
  y->size[0] = sizes[0];
  y->size[1] = sizes[1];
  emxEnsureCapacity_struct1_T(sp, y, i9, (emlrtRTEInfo *)NULL);
  n = y->size[1];
  for (i9 = 0; i9 < n; i9++) {
    thisId.fIdentifier = "PTS";
    h_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2013a(sp, u, i9, "PTS")),
                       &thisId, y->data[i9].PTS);
  }

  emlrtDestroyArray(&u);
}

static real_T (*j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[2]
{
  real_T (*ret)[2];
  int32_T iv9[2];
  int32_T i10;
  for (i10 = 0; i10 < 2; i10++) {
    iv9[i10] = 1 + i10;
  }

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 2U, iv9);
  ret = (real_T (*)[2])mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}
  static real_T k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId)
{
  real_T ret;
  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 0U, 0);
  ret = *(real_T *)mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, emxArray_char_T *ret)
{
  int32_T iv10[2];
  int32_T i11;
  int32_T iv11[2];
  boolean_T bv1[2] = { false, true };

  for (i11 = 0; i11 < 2; i11++) {
    iv10[i11] = 1 + -2 * i11;
  }

  emlrtCheckVsBuiltInR2012b(sp, msgId, src, "char", false, 2U, iv10, &bv1[0],
    iv11);
  i11 = ret->size[0] * ret->size[1];
  ret->size[0] = iv11[0];
  ret->size[1] = iv11[1];
  emxEnsureCapacity(sp, (emxArray__common *)ret, i11, (int32_T)sizeof(char_T),
                    (emlrtRTEInfo *)NULL);
  emlrtImportArrayR2011b(src, ret->data, 1, false);
  emlrtDestroyArray(&src);
}

static void m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, emxArray_real_T *ret)
{
  int32_T iv12[2];
  int32_T i12;
  int32_T iv13[2];
  boolean_T bv2[2] = { true, false };

  for (i12 = 0; i12 < 2; i12++) {
    iv12[i12] = 3 * i12 - 1;
  }

  emlrtCheckVsBuiltInR2012b(sp, msgId, src, "double", false, 2U, iv12, &bv2[0],
    iv13);
  i12 = ret->size[0] * ret->size[1];
  ret->size[0] = iv13[0];
  ret->size[1] = iv13[1];
  emxEnsureCapacity(sp, (emxArray__common *)ret, i12, (int32_T)sizeof(real_T),
                    (emlrtRTEInfo *)NULL);
  emlrtImportArrayR2011b(src, ret->data, 8, false);
  emlrtDestroyArray(&src);
}

void LIDAR_api(const mxArray * const prhs[5], const mxArray *plhs[2])
{
  struct0_T MAP;
  emxArray_real_T *ANGLE_OUT;
  emxArray_real_T *RANGE_OUT;
  real_T (*VP)[2];
  real_T HA;
  real_T LASER_RANGE;
  real_T ANGULAR_RES;
  emlrtStack st = { NULL, NULL, NULL };

  st.tls = emlrtRootTLSGlobal;
  emlrtHeapReferenceStackEnterFcnR2012b(&st);
  emxInitStruct_struct0_T(&st, &MAP, &r_emlrtRTEI, true);
  emxInit_real_T(&st, &ANGLE_OUT, 2, &r_emlrtRTEI, true);
  emxInit_real_T(&st, &RANGE_OUT, 2, &r_emlrtRTEI, true);

  /* Marshall function inputs */
  VP = emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "VP");
  HA = c_emlrt_marshallIn(&st, emlrtAliasP(prhs[1]), "HA");
  LASER_RANGE = c_emlrt_marshallIn(&st, emlrtAliasP(prhs[2]), "LASER_RANGE");
  ANGULAR_RES = c_emlrt_marshallIn(&st, emlrtAliasP(prhs[3]), "ANGULAR_RES");
  e_emlrt_marshallIn(&st, emlrtAliasP(prhs[4]), "MAP", &MAP);

  /* Invoke the target function */
  LIDAR(&st, *VP, HA, LASER_RANGE, ANGULAR_RES, &MAP, ANGLE_OUT, RANGE_OUT);

  /* Marshall function outputs */
  plhs[0] = emlrt_marshallOut(ANGLE_OUT);
  plhs[1] = emlrt_marshallOut(RANGE_OUT);
  RANGE_OUT->canFreeData = false;
  emxFree_real_T(&RANGE_OUT);
  ANGLE_OUT->canFreeData = false;
  emxFree_real_T(&ANGLE_OUT);
  emxFreeStruct_struct0_T(&MAP);
  emlrtHeapReferenceStackLeaveFcnR2012b(&st);
}

/* End of code generation (_coder_LIDAR_api.c) */
