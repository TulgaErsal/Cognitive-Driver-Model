function [FY0, dFY0dZ, dFY0dA] = GRD_PAC2002_FY0(FZ, ALPHA)

[ PC1, PD1, PD2, PE1, PE2, PE3, ...
  PK1, PK2, PH1, PH2, PV1, PV2] = DATA_FY0();

%--------------------------------------------------------------------------
ALPHAY          = ALPHA + PH2*FZ + PH1;

dALPHAYdZ       = PH2;
dALPHAYdA       = 1;
    
%--------------------------------------------------------------------------
SVY             = PV2*FZ.^2 + PV1*FZ;

dSVYdZ          = 2*PV2*FZ  + PV1;

%--------------------------------------------------------------------------
DY              = PD2*FZ.^2 + PD1*FZ;

dDYdZ           = 2*PD2*FZ  + PD1;

%--------------------------------------------------------------------------
EY              = (PE2*FZ + PE1).*(1 - PE3*sign(ALPHAY));

dEYdZ           = PE2*(1 - PE3*sign(ALPHAY));

%--------------------------------------------------------------------------
% KY            = PK1*sin(2*atan(PK2*FZ));

INT1            = 2*atan(PK2*FZ);

dINT1dZ         = 2*PK2./(1 + (PK2*FZ).^2);
    
KY              = PK1*sin(INT1);

dKYdZ           = PK1*dINT1dZ.*cos(INT1);

%--------------------------------------------------------------------------
TMP1            = PD2*PC1*FZ.^2 + PD1*PC1*FZ;
TMP1            = TMP1 + sign(TMP1)*0.001;

dTMP1dZ         = 2*PD2*PC1*FZ  + PD1*PC1;

%--------------------------------------------------------------------------
BY              = KY./TMP1;

dBYdZ           = (dKYdZ.*TMP1 - KY.*dTMP1dZ)./(TMP1.^2);

%--------------------------------------------------------------------------
TMP2            = BY.*ALPHAY;

dTMP2dZ         = dBYdZ.*ALPHAY + BY.*dALPHAYdZ;
dTMP2dA         = BY.*dALPHAYdA;

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
