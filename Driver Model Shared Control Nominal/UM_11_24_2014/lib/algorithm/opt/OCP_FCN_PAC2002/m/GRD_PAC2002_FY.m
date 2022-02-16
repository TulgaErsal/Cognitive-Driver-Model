function [FY, dFYdZ, dFYdK, dFYdA] = GRD_PAC2002_FY(FZ, KAPPA, ALPHA)

[ PD1, PD2, RB1, RB2, RB3, RC1, RE1, RE2, ...
  RH1, RH2, RV1, RV2, RV4, RV5, RV6] = DATA_FY();

[FY0, dFY0dZ, dFY0dA] = GRD_PAC2002_FY0(FZ, ALPHA);

%--------------------------------------------------------------------------
DY              = PD2*FZ.^2 + PD1*FZ;

dDYdZ           = 2*PD2*FZ  + PD1;

%--------------------------------------------------------------------------
% BYK           = RB1.*cos(atan(RB2.*(ALPHA - RB3)));

INT4            = atan(RB2.*(ALPHA - RB3));

dINT4dA         = RB2./(1 + (RB2.*(ALPHA - RB3)).^2);

BYK             = RB1.*cos(INT4);

dBYKdA          = - RB1*dINT4dA.*sin(INT4);

%--------------------------------------------------------------------------
EYK             = RE2*FZ + RE1;

dEYKdZ          = RE2;

%--------------------------------------------------------------------------
SHYK            = RH2*FZ + RH1;

dSHYKdZ         = RH2;

%--------------------------------------------------------------------------
KAPPAS          = KAPPA + SHYK;

dKAPPASdZ       = dSHYKdZ;
dKAPPASdK       = 1;

%--------------------------------------------------------------------------
TMP3            = BYK.*KAPPAS;

dTMP3dZ         = BYK.*dKAPPASdZ;
dTMP3dK         = BYK.*dKAPPASdK;
dTMP3dA         = dBYKdA.*KAPPAS;

%--------------------------------------------------------------------------
% TMP4          = cos(RC1.*atan(TMP3 - EYK.*(TMP3 - atan(TMP3))));

INT5            = RC1.*atan(TMP3 - EYK.*(TMP3 - atan(TMP3)));

dINT5dZ         = RC1.*dMFdX(TMP3, dTMP3dZ, EYK, dEYKdZ);
dINT5dK         = RC1.*dMFdX(TMP3, dTMP3dK, EYK, 0);
dINT5dA         = RC1.*dMFdX(TMP3, dTMP3dA, EYK, 0);

TMP4            = cos(INT5);

S_INT5          = sin(INT5);
dTMP4dZ         = - dINT5dZ.*S_INT5;
dTMP4dK         = - dINT5dK.*S_INT5;
dTMP4dA         = - dINT5dA.*S_INT5;

%--------------------------------------------------------------------------
TMP5            = BYK.*SHYK;

dTMP5dZ         = BYK.*dSHYKdZ;
dTMP5dA         = dBYKdA.*SHYK;

%--------------------------------------------------------------------------
% TMP6          = cos(RC1.*atan(TMP5 - EYK.*(TMP5 - atan(TMP5))));

INT6            = RC1.*atan(TMP5 - EYK.*(TMP5 - atan(TMP5)));

dINT6dZ         = RC1.*dMFdX(TMP5, dTMP5dZ, EYK, dEYKdZ);
dINT6dA         = RC1.*dMFdX(TMP5, dTMP5dA, EYK, 0);

TMP6            = cos(INT6);

S_INT6          = sin(INT6);
dTMP6dZ         = - dINT6dZ.*S_INT6;
dTMP6dA         = - dINT6dA.*S_INT6;

%--------------------------------------------------------------------------
GY              = TMP4./TMP6;

TMP6SQ          = TMP6.^2;
dGYdZ           = (dTMP4dZ.*TMP6 - TMP4.*dTMP6dZ)./TMP6SQ;
dGYdK           =  dTMP4dK./TMP6;
dGYdA           = (dTMP4dA.*TMP6 - TMP4.*dTMP6dA)./TMP6SQ;

%--------------------------------------------------------------------------
% DVYK          = DY.*(RV2*FZ + RV1).*cos(atan(RV4.*ALPHA));

INT7            = DY.*(RV2*FZ + RV1);

dINT7dZ         = dDYdZ.*(RV2*FZ + RV1) + DY*RV2;

INT8            = atan(RV4.*ALPHA);

dINT8dA         = RV4./(1 + (RV4.*ALPHA).^2);

INT9            = cos(INT8);

dINT9dA         = - dINT8dA.*sin(INT8);

DVYK            = INT7.*INT9;

dDVYKdZ         = dINT7dZ.*INT9;
dDVYKdA         = INT7.*dINT9dA;

%--------------------------------------------------------------------------
% SVYK          = DVYK.*sin(RV5.*atan(RV6.*KAPPA));

INT10           = RV5.*atan(RV6.*KAPPA);

dINT10dK        = RV5*RV6./(1 + (RV6.*KAPPA).^2);

INT11           = sin(INT10);

dINT11dK        = dINT10dK.*cos(INT10);

SVYK            = DVYK.*INT11;

dSVYKdZ         = dDVYKdZ.*INT11;
dSVYKdK         = DVYK.*dINT11dK;
dSVYKdA         = dDVYKdA.*INT11;

%--------------------------------------------------------------------------
FY              = GY.*FY0 + SVYK;

dFYdZ           = dGYdZ.*FY0 + GY.*dFY0dZ + dSVYKdZ;
dFYdK           = dGYdK.*FY0              + dSVYKdK;
dFYdA           = dGYdA.*FY0 + GY.*dFY0dA + dSVYKdA;
