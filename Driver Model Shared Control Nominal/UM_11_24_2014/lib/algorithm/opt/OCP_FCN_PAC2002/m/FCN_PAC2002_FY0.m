function FY0 = FCN_PAC2002_FY0(FZ, ALPHA)

[ PC1, PD1, PD2, PE1, PE2, PE3, ...
  PK1, PK2, PH1, PH2, PV1, PV2] = DATA_FY0();

ALPHAY  = ALPHA + PH2*FZ + PH1;
SVY     = PV2*FZ.^2 + PV1*FZ;
DY      = PD2*FZ.^2 + PD1*FZ;
% EY   	= PE2*FZ + PE1 - PE2*PE3*FZ.*sign(ALPHAY) - PE1*PE3*sign(ALPHAY);
EY      = (PE2*FZ + PE1).*(1 - PE3*sign(ALPHAY));
KY      = PK1*sin(2*atan(PK2*FZ));
TMP1    = PD2*PC1*FZ.^2 + PD1*PC1*FZ;
TMP1    = TMP1 + sign(TMP1)*0.001;
BY      = KY./TMP1;
TMP2    = BY.*ALPHAY;
FY0     = DY.*sin(PC1.*atan(TMP2 - EY.*(TMP2 - atan(TMP2)))) + SVY;