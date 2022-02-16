function [xdot,ALPHAF, ALPHAR, FYF, FYR, FZF, FZR] = VEHICLE_5DoF(t,x,INPUT)

% data
DATA_HMMWV  = INPUT.DATA_HMMWV;
M           = DATA_HMMWV.M;
IZZ         = DATA_HMMWV.IZZ;
LA          = DATA_HMMWV.LA;
LB          = DATA_HMMWV.LB;
FZF0        = DATA_HMMWV.FZF0;
FZR0        = DATA_HMMWV.FZR0;
dFZX_Coeff  = DATA_HMMWV.dFZX_Coeff;
IW          = DATA_HMMWV.IW;
RW          = DATA_HMMWV.RW;
Tau_LT      = DATA_HMMWV.Tau_LT;

% states
% X       	= x(1);
% Y       	= x(2);
V           = x(3);
R           = x(4);
PSI         = x(5);
U           = x(6);
OMEGAF      = x(7);
OMEGAR      = x(8);
dFZX        = x(9);

% inputs
CMD_TM      = INPUT.CMD_TM;
CMD_SA      = INPUT.CMD_SA;
CMD_UX      = INPUT.CMD_UX;
DELTAF      = interp1f(CMD_TM, CMD_SA, t, 'pchip');
U_REF      	= interp1f(CMD_TM, CMD_UX, t, 'pchip');
AX          = 100*(U_REF - U);
TF          = 0.5*AX*M*RW;
TR          = 0.5*AX*M*RW;

% slip angles
ALPHAF      = atan2(V + LA*R, U) - DELTAF;
ALPHAR      = atan2(V - LB*R, U);

% slip ratios
UTF         = sqrt((V + LA*R).^2 + U.^2)*cos(ALPHAF);
UTR         = sqrt((V - LB*R).^2 + U.^2)*cos(ALPHAR);
KAPPAF      = (OMEGAF*RW - UTF)./UTF;
KAPPAR      = (OMEGAR*RW - UTR)./UTR;

% vertical loads
FZF         = FZF0 - dFZX;
FZR         = FZR0 + dFZX;

% tire forces
[FXF, FYF]= PAC2002_TT(FZF, KAPPAF, ALPHAF);
[FXR, FYR]= PAC2002_TT(FZR, KAPPAR, ALPHAR);

% dynamics
xdot(1)     = U.*cos(PSI) - V.*sin(PSI);
xdot(2)     = U.*sin(PSI) + V.*cos(PSI);
xdot(3)     = (FXF*sin(DELTAF) + FYF*cos(DELTAF) + FYR)/M - U.*R;
xdot(4)     = ((FXF*sin(DELTAF) + FYF*cos(DELTAF))*LA - FYR*LB)/IZZ;
xdot(5)     = R;
xdot(6)     = (FXF*cos(DELTAF) - FYF*sin(DELTAF) + FXR)/M + V.*R;
xdot(7)     = (TF - (FXF*cos(DELTAF) - FYF*sin(DELTAF))*RW)/IW;
xdot(8)     = (TR - FXR*RW)/IW;
Hat_dFZX  	= dFZX_Coeff*(xdot(6) - V.*R);
xdot(9)     = (Hat_dFZX - dFZX)/Tau_LT;
xdot        = xdot(:);

