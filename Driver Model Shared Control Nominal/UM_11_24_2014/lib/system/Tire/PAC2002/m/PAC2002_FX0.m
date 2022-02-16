function [FX0, FX0_COEFF] = PAC2002_FX0(DATA, ZETA, FZ, KAPPA, GAMMA)

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

% scaling coefficients
LFZO    = DATA.LFZO;    
LGAX    = DATA.LGAX;      
LHX     = DATA.LHX; 
LVX     = DATA.LVX;  
LMUX    = DATA.LMUX;
LCX     = DATA.LCX;                                                                 
LEX     = DATA.LEX;                                   
LKX     = DATA.LKX; 

% normal load
FZ0  	= DATA.FNOMIN;  
DFZ     = (FZ - FZ0*LFZO)/(FZ0*LFZO);

% zeta
ZETA1   = ZETA.ZETA1;

%%
GAMMAX  = GAMMA.*LGAX;
SHX     = (PHX1 + PHX2.*DFZ).*LHX;
SVX     = FZ.*(PVX1 + PVX2.*DFZ).*LVX.*LMUX.*ZETA1;
KAPPAX  = KAPPA + SHX;
CX      = PCX1.*LCX;
MUX     = (PDX1 + PDX2.*DFZ).*(1-PDX3.*GAMMAX.^2).*LMUX;
DX      = MUX.*FZ.*ZETA1;
EX      = (PEX1 + PEX2.*DFZ + PEX3.*DFZ.^2).*(1-PEX4.*sign(KAPPAX)).*LEX;
% check_E(EX,'EX');
KX      = FZ.*(PKX1 + PKX2.*DFZ).*exp(PKX3.*DFZ).*LKX;
TMP1    = PCX1.*LCX.*MUX.*FZ;
% modify_denominator
TMP1    = TMP1 + sign(TMP1)*0.001;
BX      = KX./TMP1;
TMP2    = BX.*KAPPAX;
FX0     = DX.*sin((CX.*atan(TMP2 - EX.*(TMP2-atan(TMP2)))))+SVX;

FX0_COEFF.KX = KX;