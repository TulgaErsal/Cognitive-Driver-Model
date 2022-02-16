function MX = PAC2002_MX(DATA, FZ, GAMMA, FY)

%% Tire Data
QSX1    = DATA.QSX1;                                 
QSX2    = DATA.QSX2;                                 
QSX3    = DATA.QSX3;  

% scaling coefficients
LFZO    = DATA.LFZO; 
LVMX    = DATA.LVMX;
LMX     = DATA.LMX; 

% unloaded radius
R0      = DATA.UNLOADED_RADIUS; 

% normal load
FZ0     = DATA.FNOMIN;  

%%
MX      = R0.*FZ.*(QSX1.*LVMX -QSX2.*GAMMA + QSX3.*FY./(FZ0.*LFZO))*LMX;