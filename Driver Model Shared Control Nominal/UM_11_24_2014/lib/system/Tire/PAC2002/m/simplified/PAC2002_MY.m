function MY = PAC2002_MY(DATA, FZ, FX, VX)

%% Tire Data
QSY1    = DATA.QSY1;                                 
QSY2    = DATA.QSY2;                                 
QSY3    = DATA.QSY3;                                 
QSY4    = DATA.QSY4;  

% measurement speed
VREF    = DATA.LONGVL; 

% unloaded radius
R0      = DATA.UNLOADED_RADIUS; 

% normal load
FZ0     = DATA.FNOMIN;  

%%
MY      = -R0.*FZ.*(QSY1 + QSY2.*FX./FZ0 + QSY3.*abs(VX./VREF)+ QSY4.*(VX./VREF).^2);