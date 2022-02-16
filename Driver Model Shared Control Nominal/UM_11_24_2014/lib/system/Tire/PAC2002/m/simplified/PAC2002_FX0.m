function [FX0, FX0_COEFF] = PAC2002_FX0(DATA, FZ, KAPPA, GAMMA)

%% Tire Data
PCX1    = DATA.PCX1;                                 
PDX1    = DATA.PDX1;                                 
PDX2    = DATA.PDX2;                                 
PDX3    = DATA.PDX3;                                 
PEX1    = DATA.PEX1;                                 
PEX2    = DATA.PEX2;                                 
PEX3    = DATA.PEX3;                                 
PEX4    = DATA.PEX4;                                 
PKX1    = DATA.PKX1;                                 
PKX2    = DATA.PKX2;                                 
PKX3    = DATA.PKX3;                                 
PHX1    = DATA.PHX1;                                 
PHX2    = DATA.PHX2;                                 
PVX1    = DATA.PVX1;                                 
PVX2    = DATA.PVX2;      

% normal load
FZ0  	= DATA.FNOMIN;  
DFZ     = (FZ - FZ0)/(FZ0);

%%
GAMMAX  = GAMMA;
SHX     = (PHX1 + PHX2.*DFZ);
SVX     = FZ.*(PVX1 + PVX2.*DFZ);
KAPPAX  = KAPPA + SHX;
CX      = PCX1;
MUX     = (PDX1 + PDX2.*DFZ).*(1-PDX3.*GAMMAX.^2);
DX      = MUX.*FZ;
EX      = (PEX1 + PEX2.*DFZ + PEX3.*DFZ.^2).*(1-PEX4.*sign(KAPPAX));
KX      = FZ.*(PKX1 + PKX2.*DFZ).*exp(PKX3.*DFZ);
TMP1    = PCX1.*MUX.*FZ;
% modify_denominator
TMP1    = TMP1 + sign(TMP1)*0.001;
BX      = KX./TMP1;
TMP2    = BX.*KAPPAX;
FX0     = DX.*sin((CX.*atan(TMP2 - EX.*(TMP2-atan(TMP2)))))+SVX;

FX0_COEFF.KX = KX;