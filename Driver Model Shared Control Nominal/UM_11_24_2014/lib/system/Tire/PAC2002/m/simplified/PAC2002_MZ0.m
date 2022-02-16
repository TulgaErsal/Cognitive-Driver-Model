function [MZ0,MZ0_COEFF] = PAC2002_MZ0(DATA, FZ, ALPHA, GAMMA, FY0, FY0_COEFF)

%% Tire Data
QBZ1    = DATA.QBZ1;                                 
QBZ2    = DATA.QBZ2;                                 
QBZ3    = DATA.QBZ3;                                 
QBZ4    = DATA.QBZ4;                                 
QBZ5    = DATA.QBZ5;                                 
QBZ9    = DATA.QBZ9;                                 
QBZ10   = DATA.QBZ10;                               
QCZ1    = DATA.QCZ1;                                 
QDZ1    = DATA.QDZ1;                                 
QDZ2    = DATA.QDZ2;                                 
QDZ3    = DATA.QDZ3;                                 
QDZ4    = DATA.QDZ4;                                 
QDZ6    = DATA.QDZ6;                                 
QDZ7    = DATA.QDZ7;                                 
QDZ8    = DATA.QDZ8;                                 
QDZ9    = DATA.QDZ9;                                 
QEZ1    = DATA.QEZ1;                                 
QEZ2    = DATA.QEZ2;                                 
QEZ3    = DATA.QEZ3;                                 
QEZ4    = DATA.QEZ4;                                 
QEZ5    = DATA.QEZ5;                                 
QHZ1    = DATA.QHZ1;                                 
QHZ2    = DATA.QHZ2;                                 
QHZ3    = DATA.QHZ3;                                 
QHZ4    = DATA.QHZ4;  

% unloaded radius
R0      = DATA.UNLOADED_RADIUS; 

% normal load
FZ0     = DATA.FNOMIN;  
DFZ     = (FZ - FZ0)/(FZ0);

% FY0 coefficients
BY      = FY0_COEFF.BY;
CY      = FY0_COEFF.CY;
KY      = FY0_COEFF.KY;
SHY     = FY0_COEFF.SHY;
SVY     = FY0_COEFF.SVY;

%%
GAMMAZ  = GAMMA;
SHT     = QHZ1 + QHZ2.*DFZ + (QHZ3 + QHZ4.*DFZ).*GAMMAZ;
ALPHAT  = ALPHA + SHT;
BT      = (QBZ1 + QBZ2.*DFZ + QBZ3.*DFZ.^2).*(1 + QBZ4.*GAMMAZ + QBZ5.*abs(GAMMAZ));
CT      = QCZ1;
DT      = FZ.*(QDZ1 + QDZ2.*DFZ).*(1 + QDZ3.*GAMMAZ + QDZ4.*GAMMAZ.^2).*(R0./FZ0);
ET      = (QEZ1 + QEZ2.*DFZ + QEZ3.*DFZ.^2).*(1 + (QEZ4 + QEZ5.*GAMMAZ).*((2./pi).*atan(BT.*CT.*ALPHAT)));
TMP1    = BT.*ALPHAT;
T0      = DT.*cos(CT.*atan(TMP1 - ET.*(TMP1 - atan(TMP1)))).*cos(ALPHA);
% modify denominator
KY_M    = KY + sign(KY)*0.001;
SHF     = SHY + SVY./KY_M;
ALPHAR  = ALPHA + SHF;
BR      = (QBZ9 + QBZ10.*BY.*CY);
CR      = 1;
DR      = FZ.*((QDZ6 + QDZ7.*DFZ) + (QDZ8 + QDZ9.*DFZ).*GAMMAZ).*R0;
MZR0    = DR.*cos(CR.*atan(BR.*ALPHAR)).*cos(ALPHA);  % last cos(alpha) is cos(alpha_t) in Pac2006
MZ0     = -T0.*FY0 + MZR0;

MZ0_COEFF.ALPHAT = ALPHAT;
MZ0_COEFF.ALPHAR = ALPHAR;
MZ0_COEFF.BT = BT;
MZ0_COEFF.CT = CT;
MZ0_COEFF.DT = DT;
MZ0_COEFF.ET = ET;
MZ0_COEFF.BR = BR;
MZ0_COEFF.CR = CR;
MZ0_COEFF.DR = DR;
