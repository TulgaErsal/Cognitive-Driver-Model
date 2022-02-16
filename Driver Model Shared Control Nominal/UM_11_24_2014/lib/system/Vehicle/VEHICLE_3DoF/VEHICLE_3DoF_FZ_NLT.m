function [xdot,ALPHAF, ALPHAR, FYF, FYR, FZF, FZR] = VEHICLE_3DoF_FZ_NLT(t,x,INPUT)

% data
DATA_HMMWV  = INPUT.DATA_HMMWV;
M           = DATA_HMMWV.M;
IZZ         = DATA_HMMWV.IZZ;
LA          = DATA_HMMWV.LA;
LB          = DATA_HMMWV.LB;

% inputs
CMD_TM      = INPUT.CMD_TM;
CMD_SA      = INPUT.CMD_SA;
CMD_AX      = INPUT.CMD_AX;
DELTAF      = interp1f(CMD_TM, CMD_SA, t, 'pchip');
AX          = interp1f(CMD_TM, CMD_AX, t, 'pchip');

% states
% X        	= x(1);
% Y       	= x(2);
V           = x(3);
R           = x(4);
PSI         = x(5);
U           = x(6);

% slip angle
BETAF       = atan2(V + LA*R, U);
BETAR       = atan2(V - LB*R, U);

ALPHAF      = BETAF - DELTAF;
ALPHAR      = BETAR;

% vertical load
FZF0        = DATA_HMMWV.FZF0;
FZR0        = DATA_HMMWV.FZR0;
dFZX_Coeff  = DATA_HMMWV.dFZX_Coeff;
AX_GLOBAL   = AX - V.*R;
FZF         = FZF0 - AX_GLOBAL*dFZX_Coeff;
FZR         = FZR0 + AX_GLOBAL*dFZX_Coeff;

% lateral force
FYF         = 2*PAC2002_ST(FZF/2, ALPHAF);
FYR         = 2*PAC2002_ST(FZR/2, ALPHAR);

% dynamics
xdot(1)     = U*cos(PSI) - V*sin(PSI);
xdot(2)     = U*sin(PSI) + V*cos(PSI);
xdot(3)     = (FYF + FYR)/M-R*U;
xdot(4)     = (LA*FYF-LB*FYR)/IZZ;
xdot(5)     = R;
xdot(6)     = AX;
xdot        = xdot(:);