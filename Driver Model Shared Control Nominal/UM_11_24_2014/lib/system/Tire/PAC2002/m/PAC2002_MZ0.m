function [MZ0,MZ0_COEFF] = PAC2002_MZ0(DATA, ZETA, FZ, ALPHA, GAMMA, FY0, FY0_COEFF)

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

% scaling coefficients
LFZO    = DATA.LFZO;  
LGAZ    = DATA.LGAZ;
LKY     = DATA.LKY;
LMUY    = DATA.LMUY;
LTR     = DATA.LTR;
LRES    = DATA.LRES;  

% unloaded radius
R0      = DATA.UNLOADED_RADIUS; 

% normal load
FZ0     = DATA.FNOMIN;  
DFZ     = (FZ - FZ0*LFZO)/(FZ0*LFZO);

% zeta
ZETA5   = ZETA.ZETA5;
ZETA6   = ZETA.ZETA6;
ZETA7   = ZETA.ZETA7;
ZETA8   = ZETA.ZETA8;

% FY0 coefficients
BY      = FY0_COEFF.BY;
CY      = FY0_COEFF.CY;
KY      = FY0_COEFF.KY;
SHY     = FY0_COEFF.SHY;
SVY     = FY0_COEFF.SVY;

%%
GAMMAZ  = GAMMA.*LGAZ;
SHT     = QHZ1 + QHZ2.*DFZ + (QHZ3 + QHZ4.*DFZ).*GAMMAZ;
ALPHAT  = ALPHA + SHT;
BT      = (QBZ1 + QBZ2.*DFZ + QBZ3.*DFZ.^2).*(1 + QBZ4.*GAMMAZ + QBZ5.*abs(GAMMAZ)).*LKY./LMUY;
CT      = QCZ1;
DT      = FZ.*(QDZ1 + QDZ2.*DFZ).*(1 + QDZ3.*GAMMAZ + QDZ4.*GAMMAZ.^2).*(R0./FZ0).*LTR.*ZETA5;
ET      = (QEZ1 + QEZ2.*DFZ + QEZ3.*DFZ.^2).*(1 + (QEZ4 + QEZ5.*GAMMAZ).*((2./pi).*atan(BT.*CT.*ALPHAT)));
% check_E(ET,'ET');
TMP1    = BT.*ALPHAT;
T0      = DT.*cos(CT.*atan(TMP1 - ET.*(TMP1 - atan(TMP1)))).*cos(ALPHA);
% modify denominator
KY_M    = KY + sign(KY)*0.001;
SHF     = SHY + SVY./KY_M;
ALPHAR  = ALPHA + SHF;
BR      = (QBZ9.*LKY./LMUY + QBZ10.*BY.*CY).*ZETA6;
CR      = ZETA7;
DR      = FZ.*((QDZ6 + QDZ7.*DFZ).*LTR + (QDZ8 + QDZ9.*DFZ).*GAMMAZ).*R0.*LMUY + ZETA8 - 1;
MZR0    = DR.*cos(CR.*atan(BR.*ALPHAR)).*cos(ALPHA);  % last cos(alpha) is cos(alpha_t) in Pac2006
MZ0     = -T0.*FY0 + MZR0*LRES;

MZ0_COEFF.ALPHAT = ALPHAT;
MZ0_COEFF.ALPHAR = ALPHAR;
MZ0_COEFF.BT = BT;
MZ0_COEFF.CT = CT;
MZ0_COEFF.DT = DT;
MZ0_COEFF.ET = ET;
MZ0_COEFF.BR = BR;
MZ0_COEFF.CR = CR;
MZ0_COEFF.DR = DR;
