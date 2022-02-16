function [FY0, FY0_COEFF] = PAC2002_FY0(DATA, FZ, ALPHA, GAMMA)

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

% normal load
FZ0     = DATA.FNOMIN;  
DFZ     = (FZ - FZ0)/(FZ0);

%%
GAMMAY  = GAMMA;
SHY     = (PHY1 + PHY2.*DFZ) + PHY3.*GAMMAY;
SVY     = FZ.*((PVY1 + PVY2.*DFZ)+(PVY3 + PVY4.*DFZ).*GAMMAY);
ALPHAY  = ALPHA + SHY;
CY      = PCY1;
MUY     = (PDY1 + PDY2.*DFZ).*(1-PDY3.*GAMMAY.^2);
DY      = MUY.*FZ;
EY      = (PEY1 + PEY2.*DFZ).*(1-(PEY3 + PEY4.*GAMMAY).*sign(ALPHAY));
KY0     = PKY1.*(FZ0).*sin(2.*atan(FZ./(PKY2.*FZ0)));
KY      = KY0.*(1 - PKY3.*abs(GAMMAY));
TMP1    = PCY1.*MUY.*FZ;
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
