function [FX, dFXdZ, dFXdK, dFXdA, dFXdZdZ, dFXdKdZ, dFXdKdK, dFXdAdZ, dFXdAdK, dFXdAdA] = ...
          HES_PAC2002_FX(FZ, KAPPA, ALPHA)

[ RB1, RB2, RC1, RE1, RE2, RH1] = DATA_FX();

[FX0, dFX0dZ, dFX0dK, dFX0dZdZ, dFX0dKdZ, dFX0dKdK] = HES_PAC2002_FX0(FZ, KAPPA);

%--------------------------------------------------------------------------
% BXA           = RB1.*cos(atan(RB2.*KAPPA));

INT3            = atan(RB2.*KAPPA);

dINT3dK         = RB2./(1 + (RB2.*KAPPA).^2);
    
BXA             = RB1.*cos(INT3);

dBXAdK          = - RB1*dINT3dK.*sin(INT3);

% ~~
IMP2            = 1 + (RB2.*KAPPA).^2;

dIMP2dK         = 2*RB2^2*KAPPA;

% dINT3dK   	= RB2./IMP2;

dINT3dKdK       = - RB2*dIMP2dK./IMP2.^2;

dBXAdKdK        = - RB1*(dINT3dKdK.*sin(INT3) + dINT3dK.^2.*cos(INT3));

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

% ~~
dTMP7dKdK       = dBXAdKdK.*ALPHAS;

dTMP7dAdK       = dBXAdK.*dALPHASdA;

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

% ~~
dINT4dZdZ       = RC1.*dMFdXdY(TMP7, 0,       0,       0,         EXA, dEXAdZ, dEXAdZ, 0);
dINT4dKdZ       = RC1.*dMFdXdY(TMP7, dTMP7dK, 0,       0,         EXA, 0,      dEXAdZ, 0);
dINT4dKdK       = RC1.*dMFdXdY(TMP7, dTMP7dK, dTMP7dK, dTMP7dKdK, EXA, 0,      0,      0);
dINT4dAdZ       = RC1.*dMFdXdY(TMP7, dTMP7dA, 0,       0,         EXA, 0,      dEXAdZ, 0);
dINT4dAdK       = RC1.*dMFdXdY(TMP7, dTMP7dA, dTMP7dK, dTMP7dAdK, EXA, 0,      0,      0);
dINT4dAdA       = RC1.*dMFdXdY(TMP7, dTMP7dA, dTMP7dA, 0,         EXA, 0,      0,      0);

C_INT4          = TMP8;
dS_INT4dZ       = dINT4dZ.*C_INT4;
dS_INT4dK       = dINT4dK.*C_INT4;
dS_INT4dA       = dINT4dA.*C_INT4;

dTMP8dZdZ       = - dINT4dZdZ.*S_INT4 - dINT4dZ.*dS_INT4dZ;
dTMP8dKdZ       = - dINT4dKdZ.*S_INT4 - dINT4dK.*dS_INT4dZ;
dTMP8dKdK       = - dINT4dKdK.*S_INT4 - dINT4dK.*dS_INT4dK;
dTMP8dAdZ       = - dINT4dAdZ.*S_INT4 - dINT4dA.*dS_INT4dZ;
dTMP8dAdK       = - dINT4dAdK.*S_INT4 - dINT4dA.*dS_INT4dK;
dTMP8dAdA       = - dINT4dAdA.*S_INT4 - dINT4dA.*dS_INT4dA;

%--------------------------------------------------------------------------
TMP9            = RH1.*BXA;

dTMP9dK         = RH1.*dBXAdK;

% ~~
dTMP9dKdK     	= RH1.*dBXAdKdK;

%--------------------------------------------------------------------------
% TMP10         = cos(RC1.*atan(TMP9 - EXA.*(TMP9 - atan(TMP9))));

INT5            = RC1.*atan(TMP9 - EXA.*(TMP9 - atan(TMP9)));

dINT5dZ         = RC1.*dMFdX(TMP9, 0,       EXA, dEXAdZ);
dINT5dK         = RC1.*dMFdX(TMP9, dTMP9dK, EXA, 0);

TMP10           = cos(INT5);

S_INT5          = sin(INT5);
dTMP10dZ        = - dINT5dZ.*S_INT5;
dTMP10dK        = - dINT5dK.*S_INT5;

% ~~
dINT5dZdZ       = RC1.*dMFdXdY(TMP9, 0,       0,       0,         EXA, dEXAdZ, dEXAdZ, 0);
dINT5dKdZ       = RC1.*dMFdXdY(TMP9, dTMP9dK, 0,       0,         EXA, 0,      dEXAdZ, 0);
dINT5dKdK       = RC1.*dMFdXdY(TMP9, dTMP9dK, dTMP9dK, dTMP9dKdK, EXA, 0,      0,      0);

C_INT5          = TMP10;
dS_INT5dZ       = dINT5dZ.*C_INT5;
dS_INT5dK       = dINT5dK.*C_INT5;

dTMP10dZdZ    	= - dINT5dZdZ.*S_INT5 - dINT5dZ.*dS_INT5dZ;
dTMP10dKdZ    	= - dINT5dKdZ.*S_INT5 - dINT5dK.*dS_INT5dZ;
dTMP10dKdK    	= - dINT5dKdK.*S_INT5 - dINT5dK.*dS_INT5dK;

%--------------------------------------------------------------------------
GX              = TMP8./TMP10;

TMP10_SQ        = TMP10.^2;

dGXdZ           = (dTMP8dZ.*TMP10 - TMP8.*dTMP10dZ)./TMP10_SQ;
dGXdK           = (dTMP8dK.*TMP10 - TMP8.*dTMP10dK)./TMP10_SQ;
dGXdA           =  dTMP8dA./TMP10;

% ~~
IMP3            = dTMP8dZ.*TMP10 - TMP8.*dTMP10dZ;

dIMP3dZ         = dTMP8dZdZ.*TMP10 - TMP8.*dTMP10dZdZ;

IMP4            = dTMP8dK.*TMP10 - TMP8.*dTMP10dK;

dIMP4dZ         = dTMP8dKdZ.*TMP10 + dTMP8dK.*dTMP10dZ - dTMP8dZ.*dTMP10dK - TMP8.*dTMP10dKdZ;
dIMP4dK         = dTMP8dKdK.*TMP10 - TMP8.*dTMP10dKdK;

dTMP10_SQdZ    	= 2*dTMP10dZ.*TMP10;
dTMP10_SQdK    	= 2*dTMP10dK.*TMP10;

% FP: fourth power
TMP10_FP        = TMP10.^4;

% dGXdZ        	= IMP3./TMP10_SQ;
% dGXdK        	= IMP4./TMP10_SQ;
% dGXdA        	= dTMP8dA./TMP10;

dGXdZdZ         = (dIMP3dZ.*TMP10_SQ - IMP3.*dTMP10_SQdZ)./TMP10_FP;
dGXdKdZ         = (dIMP4dZ.*TMP10_SQ - IMP4.*dTMP10_SQdZ)./TMP10_FP;
dGXdKdK         = (dIMP4dK.*TMP10_SQ - IMP4.*dTMP10_SQdK)./TMP10_FP;
dGXdAdZ         = (dTMP8dAdZ.*TMP10 - dTMP8dA.*dTMP10dZ)./TMP10_SQ;
dGXdAdK         = (dTMP8dAdK.*TMP10 - dTMP8dA.*dTMP10dK)./TMP10_SQ;
dGXdAdA         =  dTMP8dAdA./TMP10;

%--------------------------------------------------------------------------
FX              = GX.*FX0;

dFXdZ        	= dGXdZ.*FX0 + GX.*dFX0dZ;
dFXdK        	= dGXdK.*FX0 + GX.*dFX0dK;
dFXdA       	= dGXdA.*FX0;

% ~~
dFXdZdZ         = dGXdZdZ.*FX0 + 2*dGXdZ.*dFX0dZ + GX.*dFX0dZdZ;
dFXdKdZ         = dGXdKdZ.*FX0 + dGXdK.*dFX0dZ + dGXdZ.*dFX0dK + GX.*dFX0dKdZ;
dFXdKdK         = dGXdKdK.*FX0 + 2*dGXdK.*dFX0dK + GX.*dFX0dKdK;
dFXdAdZ         = dGXdAdZ.*FX0 + dGXdA.*dFX0dZ;
dFXdAdK         = dGXdAdK.*FX0 + dGXdA.*dFX0dK;
dFXdAdA         = dGXdAdA.*FX0;