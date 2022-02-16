function FX0 = FCN_PAC2002_FX0(FZ, KAPPA)

[ PC1, PD1, PD2, PE1, PE2, PE3, PE4, ... 
  PK1, PK2, PK3, PK4, PH1, PH2, PV1, PV2] = DATA_FX0();

KAPPAX  = KAPPA + PH2*FZ + PH1;
SVX     = PV2*FZ.^2 + PV1*FZ;
DX      = PD2*FZ.^2 + PD1*FZ;
TMP1    = PE3*FZ.^2 + PE2*FZ + PE1;
TMP2    = 1 - PE4.*sign(KAPPAX);
EX      = TMP1.*TMP2;
TMP3    = PK2*FZ.^2 + PK1*FZ;
TMP4    = exp(PK4*FZ - PK3);
KX      = TMP3.*TMP4;
TMP5   	= PD2*PC1*FZ.^2 + PD1*PC1*FZ;
TMP5    = TMP5 + sign(TMP5)*0.001;
BX      = KX./TMP5;
TMP6    = BX.*KAPPAX;
FX0     = DX.*sin((PC1.*atan(TMP6 - EX.*(TMP6 - atan(TMP6))))) + SVX;