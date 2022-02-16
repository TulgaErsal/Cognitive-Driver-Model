function [FX, dFXdZ, dFXdK, dFXdA] = GRD_PAC2002_FX(FZ, KAPPA, ALPHA)

[ RB1, RB2, RC1, RE1, RE2, RH1] = DATA_FX();

[FX0, dFX0dZ, dFX0dK] = GRD_PAC2002_FX0(FZ, KAPPA);

%--------------------------------------------------------------------------
% BXA           = RB1.*cos(atan(RB2.*KAPPA));

INT3            = atan(RB2.*KAPPA);

dINT3dK         = RB2./(1 + (RB2.*KAPPA).^2);
    
BXA             = RB1.*cos(INT3);

dBXAdK          = - RB1*dINT3dK.*sin(INT3);

%--------------------------------------------------------------------------
EXA             = RE2*FZ + RE1;

dEXAdZ          = RE2;

%--------------------------------------------------------------------------
ALPHAS          = ALPHA + RH1;

dALPHASdA       = 1;

%--------------------------------------------------------------------------
TMP7          	= BXA.*ALPHAS;

dTMP7dK         = dBXAdK.*ALPHAS;
dTMP7dA         = BXA.*dALPHASdA;

%--------------------------------------------------------------------------
% TMP8          = cos(RC1.*atan(TMP7 - EXA.*(TMP7 - atan(TMP7))));

INT4            = RC1.*atan(TMP7 - EXA.*(TMP7 - atan(TMP7)));

dINT4dZ         = RC1.*dMFdX(TMP7, 0,       EXA, dEXAdZ);
dINT4dK         = RC1.*dMFdX(TMP7, dTMP7dK, EXA, 0);
dINT4dA         = RC1.*dMFdX(TMP7, dTMP7dA, EXA, 0);

TMP8            = cos(INT4);

S_INT4          = sin(INT4);
dTMP8dZ         = - dINT4dZ.*S_INT4;
dTMP8dK         = - dINT4dK.*S_INT4;
dTMP8dA         = - dINT4dA.*S_INT4;

%--------------------------------------------------------------------------
TMP9            = RH1.*BXA;

dTMP9dK         = RH1.*dBXAdK;

%--------------------------------------------------------------------------
% TMP10         = cos(RC1.*atan(TMP9 - EXA.*(TMP9 - atan(TMP9))));

INT5            = RC1.*atan(TMP9 - EXA.*(TMP9 - atan(TMP9)));

dINT5dZ         = RC1.*dMFdX(TMP9, 0,       EXA, dEXAdZ);
dINT5dK         = RC1.*dMFdX(TMP9, dTMP9dK, EXA, 0);

TMP10           = cos(INT5);

S_INT5          = sin(INT5);
dTMP10dZ        = - dINT5dZ.*S_INT5;
dTMP10dK        = - dINT5dK.*S_INT5;

%--------------------------------------------------------------------------
GX              = TMP8./TMP10;

TMP10_SQ        = TMP10.^2;

dGXdZ           = (dTMP8dZ.*TMP10 - TMP8.*dTMP10dZ)./TMP10_SQ;
dGXdK           = (dTMP8dK.*TMP10 - TMP8.*dTMP10dK)./TMP10_SQ;
dGXdA           =  dTMP8dA./TMP10;

%--------------------------------------------------------------------------
FX              = GX.*FX0;

dFXdZ           = dGXdZ.*FX0 + GX.*dFX0dZ;
dFXdK           = dGXdK.*FX0 + GX.*dFX0dK;
dFXdA           = dGXdA.*FX0;