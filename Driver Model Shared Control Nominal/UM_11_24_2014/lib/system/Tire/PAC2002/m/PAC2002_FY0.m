function [FY0, FY0_COEFF] = PAC2002_FY0(DATA, ZETA, FZ, ALPHA, GAMMA)

%% Tire Data
PCY1    = DATA.PCY1;                                 
PDY1    = DATA.PDY1;                                 
PDY2    = DATA.PDY2;                                 
PDY3    = DATA.PDY3;                                 
PEY1    = DATA.PEY1;                                 
PEY2    = DATA.PEY2;                                 
PEY3    = DATA.PEY3;                                 
PEY4    = DATA.PEY4;                                 
PKY1    = DATA.PKY1;                                 
PKY2    = DATA.PKY2;                                 
PKY3    = DATA.PKY3;                                 
PHY1    = DATA.PHY1;                                 
PHY2    = DATA.PHY2;                                 
PHY3    = DATA.PHY3;                                 
PVY1    = DATA.PVY1;                                 
PVY2    = DATA.PVY2;                                 
PVY3    = DATA.PVY3;                                 
PVY4    = DATA.PVY4;    

% scaling coefficients
LFZO    = DATA.LFZO;
LGAY    = DATA.LGAY; 
LHY     = DATA.LHY;
LVY     = DATA.LVY; 
LMUY    = DATA.LMUY;
LCY     = DATA.LCY;                                                           
LEY     = DATA.LEY;                                   
LKY     = DATA.LKY;   

% normal load
FZ0     = DATA.FNOMIN;  
DFZ     = (FZ - FZ0*LFZO)/(FZ0*LFZO);

% zeta
ZETA0   = ZETA.ZETA0;
ZETA2   = ZETA.ZETA2;
ZETA3   = ZETA.ZETA3;
ZETA4   = ZETA.ZETA4;

%%
GAMMAY  = GAMMA.*LGAY;
SHY     = (PHY1 + PHY2.*DFZ).*LHY + PHY3.*GAMMAY.*ZETA0 + ZETA4 - 1;
SVY     = FZ.*((PVY1 + PVY2.*DFZ).*LVY+(PVY3 + PVY4.*DFZ).*GAMMAY).*LMUY.*ZETA4;
ALPHAY  = ALPHA + SHY;
CY      = PCY1.*LCY;
MUY     = (PDY1 + PDY2.*DFZ).*(1-PDY3.*GAMMAY.^2).*LMUY;
DY      = MUY.*FZ.*ZETA2;
EY      = (PEY1 + PEY2.*DFZ).*(1-(PEY3 + PEY4.*GAMMAY).*sign(ALPHAY)).*LEY;
% check_E(EY,'EY');
KY0     = PKY1.*(FZ0.*LFZO).*sin(2.*atan(FZ./(PKY2.*FZ0.*LFZO))).*LKY;
KY      = KY0.*(1 - PKY3.*abs(GAMMAY)).*ZETA3;
TMP1    = PCY1.*LCY.*MUY.*FZ;
% modify denominator
TMP1    = TMP1 + sign(TMP1)*0.001;
BY      = KY./TMP1;
TMP2    = BY.*ALPHAY;
FY0     = DY.*sin((CY.*atan(TMP2 - EY.*(TMP2-atan(TMP2)))))+SVY;

FY0_COEFF.BY    = BY;
FY0_COEFF.CY    = CY;
FY0_COEFF.KY    = KY;
FY0_COEFF.SHY   = SHY;
FY0_COEFF.SVY   = SVY;
FY0_COEFF.MUY   = MUY;
