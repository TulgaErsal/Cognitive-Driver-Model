function [MZ0,ALPHAT, ALPHAR, BT, CT, DT, ET, BR, CR, DR] = PAC2002_MZ0(DFZ, FZ, ALPHA, GAMMA, KY, SHY, SVY, FY0)

ALPHAT  = ALPHA + 0.0085657 - 0.0042922.*DFZ + (0.14763 - 0.29999.*DFZ).*GAMMA;
BT      = (5.8978 - 0.1535.*DFZ - 2.0052.*DFZ.^2).*(1 + 0.62731.*GAMMA - 0.92709.*abs(GAMMA));
CT      = 1.4982;
DT      = FZ.*(0.085549 -0.025298.*DFZ).*(1 + 0.21486.*GAMMA - 3.9098.*GAMMA.^2).*(0.548./35000);
ET      = (-0.0084519 + 0.0097389.*DFZ).*(1 + (4.3583 - 645.04.*GAMMA).*((2./pi).*atan(BT.*CT.*ALPHAT)));
TMP1    = BT.*ALPHAT;
T0      = DT.*cos(CT.*atan(TMP1 - ET.*(TMP1 - atan(TMP1)))).*cos(ALPHA);
ALPHAR  = ALPHA + SHY + SVY./(KY + sign(KY)*0.001);
BR      = 10.637;
CR      = 1;
DR      = FZ.*((-0.0013373 + 0.0013869.*DFZ) + (-0.053513 + 0.025817.*DFZ).*GAMMA).*0.548;
MZR0    = DR.*cos(CR.*atan(BR.*ALPHAR)).*cos(ALPHA);  % last cos(alpha) is cos(alpha_t) in Pac2006
MZ0     = -T0.*FY0 + MZR0;
