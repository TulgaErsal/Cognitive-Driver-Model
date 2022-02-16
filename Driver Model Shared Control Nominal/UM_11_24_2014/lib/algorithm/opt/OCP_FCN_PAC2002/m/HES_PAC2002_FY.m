function [FY, dFYdZ, dFYdK, dFYdA, dFYdZdZ, dFYdKdZ, dFYdKdK, dFYdAdZ, dFYdAdK, dFYdAdA] = ...
          HES_PAC2002_FY(FZ, KAPPA, ALPHA)

[ PD1, PD2, RB1, RB2, RB3, RC1, RE1, RE2, ...
  RH1, RH2, RV1, RV2, RV4, RV5, RV6] = DATA_FY();

[FY0, dFY0dZ, dFY0dA, dFY0dZdZ, dFY0dAdZ, dFY0dAdA] = HES_PAC2002_FY0(FZ, ALPHA);

%--------------------------------------------------------------------------
DY              = PD2*FZ.^2 + PD1*FZ;

dDYdZ           = 2*PD2*FZ  + PD1;

% ~~
dDYdZdZ         = 2*PD2;

%--------------------------------------------------------------------------
% BYK           = RB1.*cos(atan(RB2.*(ALPHA - RB3)));

INT4            = atan(RB2.*(ALPHA - RB3));

dINT4dA         = RB2./(1 + (RB2.*(ALPHA - RB3)).^2);

BYK             = RB1.*cos(INT4);

dBYKdA          = - RB1*dINT4dA.*sin(INT4);

% ~~
IMP3            = 1 + (RB2.*(ALPHA - RB3)).^2;

dIMP3dA         = 2*RB2.^2*(ALPHA - RB3);

dINT4dAdA       = - RB2*dIMP3dA./IMP3.^2;

dBYKdAdA        = - RB1*(dINT4dAdA.*sin(INT4) + dINT4dA.^2.*cos(INT4));

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

% ~~
dTMP3dAdZ       = dBYKdA.*dKAPPASdZ;
dTMP3dAdK       = dBYKdA.*dKAPPASdK;
dTMP3dAdA       = dBYKdAdA.*KAPPAS;

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

% ~~
dINT5dZdZ       = RC1.*dMFdXdY(TMP3, dTMP3dZ, dTMP3dZ, 0,         EYK, dEYKdZ, dEYKdZ, 0);
dINT5dKdZ       = RC1.*dMFdXdY(TMP3, dTMP3dK, dTMP3dZ, 0,         EYK, 0,      dEYKdZ, 0);
dINT5dKdK       = RC1.*dMFdXdY(TMP3, dTMP3dK, dTMP3dK, 0,         EYK, 0,      0,      0);
dINT5dAdZ       = RC1.*dMFdXdY(TMP3, dTMP3dA, dTMP3dZ, dTMP3dAdZ, EYK, 0,      dEYKdZ, 0);
dINT5dAdK       = RC1.*dMFdXdY(TMP3, dTMP3dA, dTMP3dK, dTMP3dAdK, EYK, 0,      0,      0);
dINT5dAdA       = RC1.*dMFdXdY(TMP3, dTMP3dA, dTMP3dA, dTMP3dAdA, EYK, 0,      0,      0);

C_INT5          = TMP4;
dS_INT5dZ       = dINT5dZ.*C_INT5;
dS_INT5dK       = dINT5dK.*C_INT5;
dS_INT5dA       = dINT5dA.*C_INT5;

dTMP4dZdZ       = - dINT5dZdZ.*S_INT5 - dINT5dZ.*dS_INT5dZ;
dTMP4dKdZ       = - dINT5dKdZ.*S_INT5 - dINT5dK.*dS_INT5dZ;
dTMP4dKdK       = - dINT5dKdK.*S_INT5 - dINT5dK.*dS_INT5dK;
dTMP4dAdZ       = - dINT5dAdZ.*S_INT5 - dINT5dA.*dS_INT5dZ;
dTMP4dAdK       = - dINT5dAdK.*S_INT5 - dINT5dA.*dS_INT5dK;
dTMP4dAdA       = - dINT5dAdA.*S_INT5 - dINT5dA.*dS_INT5dA;

%--------------------------------------------------------------------------
TMP5            = BYK.*SHYK;

dTMP5dZ         = BYK.*dSHYKdZ;
dTMP5dA         = dBYKdA.*SHYK;

% ~~
dTMP5dAdZ       = dBYKdA.*dSHYKdZ;
dTMP5dAdA       = dBYKdAdA.*SHYK;

%--------------------------------------------------------------------------
% TMP6          = cos(RC1.*atan(TMP5 - EYK.*(TMP5 - atan(TMP5))));

INT6            = RC1.*atan(TMP5 - EYK.*(TMP5 - atan(TMP5)));

dINT6dZ         = RC1.*dMFdX(TMP5, dTMP5dZ, EYK, dEYKdZ);
dINT6dA         = RC1.*dMFdX(TMP5, dTMP5dA, EYK, 0);

TMP6            = cos(INT6);

S_INT6          = sin(INT6);
dTMP6dZ         = - dINT6dZ.*S_INT6;
dTMP6dA         = - dINT6dA.*S_INT6;

% ~~
dINT6dZdZ       = RC1.*dMFdXdY(TMP5, dTMP5dZ, dTMP5dZ, 0,         EYK, dEYKdZ, dEYKdZ, 0);
% dINT6dKdZ   	= RC1.*dMFdXdY(TMP5, 0,       dTMP5dZ, 0,         EYK, 0,      dEYKdZ, 0);
% dINT6dKdK   	= RC1.*dMFdXdY(TMP5, 0,       0,       0,         EYK, 0,      0,      0);
dINT6dAdZ       = RC1.*dMFdXdY(TMP5, dTMP5dA, dTMP5dZ, dTMP5dAdZ, EYK, 0,      dEYKdZ, 0);
% dINT6dAdK       = RC1.*dMFdXdY(TMP5, dTMP5dA, 0,       0,         EYK, 0,      0,      0);
dINT6dAdA       = RC1.*dMFdXdY(TMP5, dTMP5dA, dTMP5dA, dTMP5dAdA, EYK, 0,      0,      0);

C_INT6          = TMP6;
dS_INT6dZ       = dINT6dZ.*C_INT6;
dS_INT6dA       = dINT6dA.*C_INT6;

dTMP6dZdZ       = - dINT6dZdZ.*S_INT6 - dINT6dZ.*dS_INT6dZ;
dTMP6dAdZ       = - dINT6dAdZ.*S_INT6 - dINT6dA.*dS_INT6dZ;
% dTMP6dAdK       = - dINT6dAdK.*S_INT6;
dTMP6dAdA       = - dINT6dAdA.*S_INT6 - dINT6dA.*dS_INT6dA;

%--------------------------------------------------------------------------
GY              = TMP4./TMP6;

TMP6_SQ       	= TMP6.^2;
dGYdZ           = (dTMP4dZ.*TMP6 - TMP4.*dTMP6dZ)./TMP6_SQ;
dGYdK           =  dTMP4dK./TMP6;
dGYdA           = (dTMP4dA.*TMP6 - TMP4.*dTMP6dA)./TMP6_SQ;

% ~~
IMP4            = dTMP4dZ.*TMP6 - TMP4.*dTMP6dZ;

dIMP4dZ         = dTMP4dZdZ.*TMP6 - TMP4.*dTMP6dZdZ;

IMP5            = dTMP4dA.*TMP6 - TMP4.*dTMP6dA;

dIMP5dZ         = dTMP4dAdZ.*TMP6 + dTMP4dA.*dTMP6dZ - dTMP4dZ.*dTMP6dA - TMP4.*dTMP6dAdZ;
% dIMP5dK         = dTMP4dAdK.*TMP6                    - dTMP4dK.*dTMP6dA - TMP4.*dTMP6dAdK;
dIMP5dK         = dTMP4dAdK.*TMP6                    - dTMP4dK.*dTMP6dA;
dIMP5dA         = dTMP4dAdA.*TMP6                                       - TMP4.*dTMP6dAdA;

dTMP6_SQdZ    	= 2*dTMP6dZ.*TMP6;
dTMP6_SQdA     	= 2*dTMP6dA.*TMP6;

TMP6_FP         = TMP6.^4;

% dGYdZ       	= IMP4./TMP6_SQ;
% dGYdK       	= dTMP4dK./TMP6;
% dGYdA        	= IMP5./TMP6_SQ;

dGYdZdZ         = (dIMP4dZ.*TMP6_SQ - IMP4.*dTMP6_SQdZ)./TMP6_FP;
dGYdKdZ         = (dTMP4dKdZ.*TMP6 - dTMP4dK.*dTMP6dZ)./TMP6_SQ;
dGYdKdK         = dTMP4dKdK./TMP6;
dGYdAdZ         = (dIMP5dZ.*TMP6_SQ - IMP5.*dTMP6_SQdZ)./TMP6_FP;
dGYdAdK         =  dIMP5dK./TMP6_SQ;
dGYdAdA         = (dIMP5dA.*TMP6_SQ - IMP5.*dTMP6_SQdA)./TMP6_FP;

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

% ~~
dINT7dZdZ       = dDYdZdZ.*(RV2*FZ + RV1) + 2*dDYdZ.*RV2;

IMP6            = 1 + (RV4.*ALPHA).^2;

dIMP6dA         = 2*RV4^2.*ALPHA;

dINT8dAdA       = - RV4*dIMP6dA./IMP6.^2;

dINT9dAdA       = - dINT8dAdA.*sin(INT8) - dINT8dA.^2.*cos(INT8);

dDVYKdZdZ       = dINT7dZdZ.*INT9;
dDVYKdAdZ       = dINT7dZ.*dINT9dA;
dDVYKdAdA       = INT7.*dINT9dAdA;

%--------------------------------------------------------------------------
% SVYK          = DVYK.*sin(RV5.*atan(RV6.*KAPPA));

INT10           = RV5.*atan(RV6.*KAPPA);

dINT10dK        = RV5*RV6./(1 + (RV6.*KAPPA).^2);

INT11           = sin(INT10);

dINT11dK        = dINT10dK.*cos(INT10);

SVYK          = DVYK.*INT11;

dSVYKdZ      	= dDVYKdZ.*INT11;
dSVYKdK      	= DVYK.*dINT11dK;
dSVYKdA     	= dDVYKdA.*INT11;

% ~~

IMP7            = 1 + (RV6.*KAPPA).^2;

dIMP7dK         = 2*RV6^2*KAPPA;

dINT10dKdK      = - RV5*RV6*dIMP7dK./IMP7.^2;

dINT11dKdK      = dINT10dKdK.*cos(INT10) - dINT10dK.^2.*sin(INT10);

dSVYKdZdZ       = dDVYKdZdZ.*INT11;
dSVYKdKdZ       = dDVYKdZ.*dINT11dK;
dSVYKdKdK       = DVYK.*dINT11dKdK;
dSVYKdAdZ       = dDVYKdAdZ.*INT11;
dSVYKdAdK       = dDVYKdA.*dINT11dK;
dSVYKdAdA       = dDVYKdAdA.*INT11;

%--------------------------------------------------------------------------
FY              = GY.*FY0 + SVYK;

dFYdZ       	= dGYdZ.*FY0 + GY.*dFY0dZ + dSVYKdZ;
dFYdK        	= dGYdK.*FY0              + dSVYKdK;
dFYdA       	= dGYdA.*FY0 + GY.*dFY0dA + dSVYKdA;

dFYdZdZ         = dGYdZdZ.*FY0 + 2*dGYdZ.*dFY0dZ  + GY.*dFY0dZdZ + dSVYKdZdZ;
dFYdKdZ         = dGYdKdZ.*FY0 + dGYdK.*dFY0dZ + dSVYKdKdZ;
dFYdKdK         = dGYdKdK.*FY0 + dSVYKdKdK;
dFYdAdZ         = dGYdAdZ.*FY0 + dGYdA.*dFY0dZ + dGYdZ.*dFY0dA + GY.*dFY0dAdZ + dSVYKdAdZ;
dFYdAdK         = dGYdAdK.*FY0 + dGYdK.*dFY0dA + dSVYKdAdK;
dFYdAdA         = dGYdAdA.*FY0 + 2*dGYdA.*dFY0dA + GY.*dFY0dAdA + dSVYKdAdA;