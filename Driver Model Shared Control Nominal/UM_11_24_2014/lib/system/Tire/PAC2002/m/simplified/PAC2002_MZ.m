function MZ = PAC2002_MZ(DATA, FZ, KAPPA, ALPHA, GAMMA, FX, FY, FX0_COEFF, FY0_COEFF, MZ0_COEFF, FY_COEFF)

%% Tire Data
SSZ1    = DATA.SSZ1;                                 
SSZ2    = DATA.SSZ2;                                 
SSZ3    = DATA.SSZ3;                                 
SSZ4    = DATA.SSZ4;  

% unloaded radius
R0      = DATA.UNLOADED_RADIUS; 

% normal load
FZ0     = DATA.FNOMIN;  
DFZ     = (FZ - FZ0)/(FZ0);

% coefficients
SVYK    = FY_COEFF.SVYK;
KX      = FX0_COEFF.KX;
KY      = FY0_COEFF.KY;

ALPHAT  = MZ0_COEFF.ALPHAT;
ALPHAR  = MZ0_COEFF.ALPHAR;
BT      = MZ0_COEFF.BT;
CT      = MZ0_COEFF.CT;
DT      = MZ0_COEFF.DT;
ET      = MZ0_COEFF.ET;
BR      = MZ0_COEFF.BR;
CR      = MZ0_COEFF.CR;
DR      = MZ0_COEFF.DR;

%%
ALPHATEQ = atan(sqrt((tan(ALPHAT)).^2 + (KX./KY).^2.*KAPPA.^2).*sign(ALPHAT));
ALPHAREQ = atan(sqrt((tan(ALPHAR)).^2 + (KX./KY).^2.*KAPPA.^2).*sign(ALPHAR));
SCS     = R0.*(SSZ1 + SSZ2.*(FY./FZ0) + (SSZ3 + SSZ4.*DFZ).*GAMMA);
TMP     = BT.*ALPHATEQ;
TCS     = DT.*cos(CT.*atan(TMP - ET.*(TMP - atan(TMP)))).*cos(ALPHA);
MZRCS   = DR.*cos(CR.*atan(BR.*ALPHAREQ)).*cos(ALPHA);
MZ      = SCS.*FX - TCS.*(FY - SVYK) + MZRCS;