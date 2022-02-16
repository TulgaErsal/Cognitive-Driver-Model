function MZ = PAC2002_MZ(DFZ, KAPPA, ALPHA, GAMMA, ALPHAT, ALPHAR, BT, CT, DT, ET, BR, CR, DR, KX, KY, SVYK, FX, FY)

ALPHATEQ    = atan(sqrt((tan(ALPHAT)).^2 + (KX./KY).^2.*KAPPA.^2).*sign(ALPHAT));
ALPHAREQ    = atan(sqrt((tan(ALPHAR)).^2 + (KX./KY).^2.*KAPPA.^2).*sign(ALPHAR));

SCS       	= 0.548.*(-0.019408 + 0.025786.*(FY./(35000)) + (0.31908 -0.50765.*DFZ).*GAMMA);
TMP2        = BT.*ALPHATEQ;
TCS         = DT.*cos(CT.*atan(TMP2 - ET.*(TMP2 - atan(TMP2)))).*cos(ALPHA);
MZRCS       = DR.*cos(CR.*atan(BR.*ALPHAREQ)).*cos(ALPHA);
MZ          = SCS.*FX - TCS.*(FY - SVYK) + MZRCS;