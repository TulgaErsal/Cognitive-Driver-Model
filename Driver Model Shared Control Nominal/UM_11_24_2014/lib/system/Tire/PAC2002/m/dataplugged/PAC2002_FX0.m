function [FX0, KX] = PAC2002_FX0(DFZ, FZ, KAPPA, GAMMA)

SHX     = (-0.00088873 - 0.00067818.*DFZ);
SVX     = FZ.*(-5.5714e-007 + 6.2972e-006.*DFZ);
KAPPAX  = KAPPA + SHX;
MUX     = (0.77751 - 0.24431.*DFZ).*(1 + 0.00015908.*GAMMA.^2);
EX      = (0.46659 + 0.393.*DFZ + 0.076024.*DFZ.^2).*(1 - 2.6509e-006.*sign(KAPPAX));
KX      = FZ.*(14.848 + -9.8161.*DFZ).*exp(0.15818.*DFZ);
TMP1    = 1.7204.*MUX.*FZ;
TMP1    = TMP1 + sign(TMP1)*0.001;
TMP2    = KX./TMP1.*KAPPAX;
FX0     = MUX.*FZ.*sin((1.7204.*atan(TMP2 - EX.*(TMP2-atan(TMP2)))))+SVX;