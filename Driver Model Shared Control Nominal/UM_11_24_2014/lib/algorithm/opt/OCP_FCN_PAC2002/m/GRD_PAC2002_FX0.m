function [FX0, dFX0dZ, dFX0dK] = GRD_PAC2002_FX0(FZ, KAPPA)

[ PC1, PD1, PD2, PE1, PE2, PE3, PE4, ... 
  PK1, PK2, PK3, PK4, PH1, PH2, PV1, PV2] = DATA_FX0();

%--------------------------------------------------------------------------
KAPPAX          = KAPPA + PH2*FZ + PH1;

dKAPPAXdZ       = PH2;
dKAPPAXdK       = 1;

%--------------------------------------------------------------------------
SVX             = PV2*FZ.^2 + PV1*FZ;

dSVXdZ          = 2*PV2*FZ  + PV1;

%--------------------------------------------------------------------------
DX              = PD2*FZ.^2 + PD1*FZ;

dDXdZ           = 2*PD2*FZ  + PD1;

%--------------------------------------------------------------------------
TMP1            = PE3*FZ.^2 + PE2*FZ + PE1;

dTMP1dZ         = 2*PE3*FZ  + PE2;

%--------------------------------------------------------------------------
TMP2            = 1 - PE4.*sign(KAPPAX);

%--------------------------------------------------------------------------
EX              = TMP1.*TMP2;

dEXdZ           = dTMP1dZ.*TMP2;

%--------------------------------------------------------------------------
TMP3            = PK2*FZ.^2 + PK1*FZ;

dTMP3dZ         = 2*PK2*FZ  + PK1;

%--------------------------------------------------------------------------
TMP4            = exp(PK4*FZ - PK3);

dTMP4dZ         = PK4*TMP4;

%--------------------------------------------------------------------------
KX              = TMP3.*TMP4;

dKXdZ           = dTMP3dZ.*TMP4 + TMP3.*dTMP4dZ;

%--------------------------------------------------------------------------
TMP5            = PD2*PC1*FZ.^2 + PD1*PC1*FZ;
TMP5            = TMP5 + sign(TMP5)*0.001;

dTMP5dZ         = 2*PD2*PC1*FZ  + PD1*PC1;

%--------------------------------------------------------------------------
BX              = KX./TMP5;

dBXdZ           = (dKXdZ.*TMP5 - KX.*dTMP5dZ)./(TMP5.^2);

%--------------------------------------------------------------------------
TMP6            = BX.*KAPPAX;

dTMP6dZ         = dBXdZ.*KAPPAX + BX.*dKAPPAXdZ;
dTMP6dK         = BX.*dKAPPAXdK;

%--------------------------------------------------------------------------
% FX0           = DX.*sin(PC1.*atan(TMP6 - EX.*(TMP6 - atan(TMP6)))) + SVX;

% INT: Intermediate
INT1            = PC1.*atan(TMP6 - EX.*(TMP6 - atan(TMP6)));

dINT1dZ         = PC1.*dMFdX(TMP6, dTMP6dZ, EX, dEXdZ);
dINT1dK         = PC1.*dMFdX(TMP6, dTMP6dK, EX, 0);
    
INT2            = sin(INT1);

C_INT1          = cos(INT1);
dINT2dZ         = dINT1dZ.*C_INT1;
dINT2dK         = dINT1dK.*C_INT1;
    
FX0         	= DX.*INT2 + SVX;

dFX0dZ          = dDXdZ.*INT2 + DX.*dINT2dZ + dSVXdZ;
dFX0dK          = DX.*dINT2dK;
