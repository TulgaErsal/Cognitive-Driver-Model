function [FY0, dFY0dZ, dFY0dA, dFY0dZdZ, dFY0dAdZ, dFY0dAdA] = ...
          HES_PAC2002_FY0(FZ, ALPHA)
                                        
[ PC1, PD1, PD2, PE1, PE2, PE3, ...
  PK1, PK2, PH1, PH2, PV1, PV2] = DATA_FY0();

%--------------------------------------------------------------------------
ALPHAY          = ALPHA + PH2*FZ + PH1;

dALPHAYdZ       = PH2;
dALPHAYdA       = 1;
    
%--------------------------------------------------------------------------
SVY             = PV2*FZ.^2 + PV1*FZ;

dSVYdZ          = 2*PV2*FZ  + PV1;

% ~~
dSVYdZdZ        = 2*PV2;

%--------------------------------------------------------------------------
DY              = PD2*FZ.^2 + PD1*FZ;

dDYdZ           = 2*PD2*FZ  + PD1;

% ~~
dDYdZdZ         = 2*PD2;

%--------------------------------------------------------------------------
EY              = (PE2*FZ + PE1).*(1 - PE3*sign(ALPHAY));

dEYdZ           = PE2*(1 - PE3*sign(ALPHAY));

%--------------------------------------------------------------------------
% KY            = PK1*sin(2*atan(PK2*FZ));

INT1            = 2*atan(PK2*FZ);

dINT1dZ         = 2*PK2./(1 + (PK2*FZ).^2);
    
KY              = PK1*sin(INT1);

dKYdZ           = PK1*dINT1dZ.*cos(INT1);

% ~~
IMP1            = 1 + (PK2*FZ).^2;

dIMP1dZ         = 2*PK2.^2*FZ;

% dINT1dZ     	= 2*PK2./IMP1;

dINT1dZdZ       = - 2*PK2*dIMP1dZ./IMP1.^2;

dKYdZdZ         = PK1*dINT1dZdZ.*cos(INT1) - PK1*dINT1dZ.^2.*sin(INT1);

%--------------------------------------------------------------------------
TMP1            = PD2*PC1*FZ.^2 + PD1*PC1*FZ;
TMP1            = TMP1 + sign(TMP1)*0.001;

dTMP1dZ         = 2*PD2*PC1*FZ  + PD1*PC1;

% ~~
dTMP1dZdZ       = 2*PD2*PC1;

%--------------------------------------------------------------------------
BY              = KY./TMP1;

dBYdZ           = (dKYdZ.*TMP1 - KY.*dTMP1dZ)./(TMP1.^2);

% ~~
TMP1_SQ         = TMP1.^2;

dTMP1_SQdZ      = 2*dTMP1dZ.*TMP1;

IMP2            = dKYdZ.*TMP1 - KY.*dTMP1dZ;

dIMP2dZ         = dKYdZdZ.*TMP1 - KY.*dTMP1dZdZ;

% dBYdZ        	= IMP2./TMP1_SQ;

dBYdZdZ         = (dIMP2dZ.*TMP1_SQ - IMP2.*dTMP1_SQdZ)./TMP1_SQ.^2;

%--------------------------------------------------------------------------
TMP2            = BY.*ALPHAY;

dTMP2dZ         = dBYdZ.*ALPHAY + BY.*dALPHAYdZ;
dTMP2dA         = BY.*dALPHAYdA;

% ~~
dTMP2dZdZ       = dBYdZdZ.*ALPHAY + 2*dBYdZ.*dALPHAYdZ;

dTMP2dAdZ      	= dBYdZ.*dALPHAYdA;

%--------------------------------------------------------------------------
% FY0           = DY.*sin(PC1.*atan(TMP2 - EY.*(TMP2 - atan(TMP2)))) + SVY;

INT2            = PC1.*atan(TMP2 - EY.*(TMP2 - atan(TMP2)));

dINT2dZ         = PC1.*dMFdX(TMP2, dTMP2dZ, EY, dEYdZ);
dINT2dA         = PC1.*dMFdX(TMP2, dTMP2dA, EY, 0);

INT3            = sin(INT2);

C_INT2          = cos(INT2);
dINT3dZ         = dINT2dZ.*C_INT2;
dINT3dA         = dINT2dA.*C_INT2;

FY0             = DY.*INT3 + SVY;
dFY0dZ          = dDYdZ.*INT3 + DY.*dINT3dZ + dSVYdZ;
dFY0dA          = DY.*dINT3dA;

% ~~
dINT2dZdZ       = PC1.*dMFdXdY(TMP2, dTMP2dZ, dTMP2dZ, dTMP2dZdZ, EY, dEYdZ, dEYdZ, 0);
dINT2dAdZ       = PC1.*dMFdXdY(TMP2, dTMP2dA, dTMP2dZ, dTMP2dAdZ, EY, 0,     dEYdZ, 0);
dINT2dAdA       = PC1.*dMFdXdY(TMP2, dTMP2dA, dTMP2dA, 0,         EY, 0,     0,     0);

S_INT2          = INT3;
dC_INT2dZ       = - dINT2dZ.*S_INT2;
dC_INT2dA       = - dINT2dA.*S_INT2;

dINT3dZdZ       = dINT2dZdZ.*C_INT2 + dINT2dZ.*dC_INT2dZ;
dINT3dAdZ       = dINT2dAdZ.*C_INT2 + dINT2dA.*dC_INT2dZ;
dINT3dAdA       = dINT2dAdA.*C_INT2 + dINT2dA.*dC_INT2dA;

dFY0dZdZ        = dDYdZdZ.*INT3 + 2*dDYdZ.*dINT3dZ + DY.*dINT3dZdZ + dSVYdZdZ;
dFY0dAdZ        = dDYdZ.*dINT3dA + DY.*dINT3dAdZ;
dFY0dAdA        = DY.*dINT3dAdA;