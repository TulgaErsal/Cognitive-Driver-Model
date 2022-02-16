function [xdot,ALPHAF, ALPHAR, FYF, FYR] = VEHICLE_2DoF_FZ0_LT(t,x,INPUT)

% data
DATA_HMMWV  = INPUT.DATA_HMMWV;
M           = DATA_HMMWV.M;
IZZ         = DATA_HMMWV.IZZ;
LA          = DATA_HMMWV.LA;
LB          = DATA_HMMWV.LB;

% input
CMD_TM      = INPUT.CMD_TM;
CMD_SA      = INPUT.CMD_SA;
U0          = INPUT.U0;
DELTAF      = interp1f(CMD_TM, CMD_SA, t, 'pchip');

% states
% X        	= x(1);
% Y       	= x(2);
V           = x(3);
R           = x(4);
PSI         = x(5);

% slip angle
BETAF       = atan2(V + LA*R, U0);
BETAR       = atan2(V - LB*R, U0);

ALPHAF      = BETAF - DELTAF;
ALPHAR      = BETAR;

% cornering stiffness
KF          = DATA_HMMWV.KF0;
KR          = DATA_HMMWV.KR0;

% lateral force
FYF         = KF.*ALPHAF;
FYR         = KR.*ALPHAR;

% dynamics
xdot(1)     = U0*cos(PSI) - V*sin(PSI);
xdot(2)     = U0*sin(PSI) + V*cos(PSI);
xdot(3)     = (FYF + FYR)/M-R*U0;
xdot(4)     = (LA*FYF-LB*FYR)/IZZ;
xdot(5)     = R;
xdot        = xdot(:);

