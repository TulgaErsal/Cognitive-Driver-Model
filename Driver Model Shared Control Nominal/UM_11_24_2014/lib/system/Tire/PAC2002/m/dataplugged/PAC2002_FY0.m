function [FY0, KY, SHY, SVY, MUY] = PAC2002_FY0(DFZ, FZ, ALPHA, GAMMA)

SHY     = (0.0056509 -0.0020257.*DFZ) - 0.038716.*GAMMA;
SVY     = FZ.*((0.015216 -0.010365.*DFZ)+(-0.31373 -0.055766.*DFZ).*GAMMA);
ALPHAY  = ALPHA + SHY;
MUY     = (0.73957 - 0.075004.*DFZ).*(1 + 8.0362.*GAMMA.^2);
EY      = (0.37562 - 0.069325.*DFZ).*(1 - (0.29168 + 11.559.*GAMMA).*sign(ALPHAY));
KY0     = -10.289.*35000.*sin(2.*atan(FZ./(3.3343.*35000)));
KY      = KY0.*(1 + 0.25732.*abs(GAMMA));
TMP1    = 1.5874.*MUY.*FZ;
TMP1    = TMP1 + sign(TMP1)*0.001;
TMP2    = (KY./TMP1).*ALPHAY;
FY0     = MUY.*FZ.*sin((1.5874.*atan(TMP2 - EY.*(TMP2-atan(TMP2)))))+SVY;
