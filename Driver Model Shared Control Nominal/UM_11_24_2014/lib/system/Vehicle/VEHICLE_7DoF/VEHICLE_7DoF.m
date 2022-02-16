function [  xdot, ...
            ALPHA_FL, ALPHA_FR, ALPHA_RL, ALPHA_RR,...
            FZFL, FZFR, FZRL, FZRR, ...
            FXFL, FXFR, FXRL, FXRR, ...
            FYFL, FYFR, FYRL, FYRR] = VEHICLE_7DoF(t,x,INPUT)
        
% data
DATA_HMMWV  = INPUT.DATA_HMMWV;
M           = DATA_HMMWV.M;
IZZ         = DATA_HMMWV.IZZ;
LA          = DATA_HMMWV.LA;
LB          = DATA_HMMWV.LB;
LC          = DATA_HMMWV.LC;
FZF0        = DATA_HMMWV.FZF0;
FZR0        = DATA_HMMWV.FZR0;
dFZX_Coeff  = DATA_HMMWV.dFZX_Coeff;
dFZYF_Coeff = DATA_HMMWV.dFZYF_Coeff;
dFZYR_Coeff = DATA_HMMWV.dFZYR_Coeff;
RW          = DATA_HMMWV.RW;
IW          = DATA_HMMWV.IW;
% Tau_LT    = DATA_HMMWV.Tau_LT;

Tau_LT      = 0.001;

% states
% X        	= x(1);
% Y        	= x(2);
V           = x(3);
R           = x(4);
PSI         = x(5);
U           = x(6);
OMEGA1      = x(7);
OMEGA2      = x(8);
OMEGA3      = x(9);
OMEGA4      = x(10);
dFZX        = x(11);
dFZYF       = x(12);
dFZYR       = x(13);

% inputs
CMD_TM      = INPUT.CMD_TM;
CMD_SA      = INPUT.CMD_SA;
CMD_UX      = INPUT.CMD_UX;
DELTAF      = interp1f(CMD_TM, CMD_SA, t, 'pchip');
U_REF      	= interp1f(CMD_TM, CMD_UX, t, 'pchip');
AX          = 10*(U_REF - U);
T1          = 0.25*AX*M*RW;
T2          = 0.25*AX*M*RW;
T3          = 0.25*AX*M*RW;
T4          = 0.25*AX*M*RW;

% slip angle
ALPHA_FL    = atan2(V + LA*R, U) - DELTAF;
ALPHA_FR    = atan2(V + LA*R, U) - DELTAF;
ALPHA_RL    = atan2(V - LB*R, U);
ALPHA_RR    = atan2(V - LB*R, U);

% slip ratio
KAPPA_FL    = (OMEGA1*RW - U)./U;
KAPPA_FR    = (OMEGA2*RW - U)./U;
KAPPA_RL    = (OMEGA3*RW - U)./U;
KAPPA_RR    = (OMEGA4*RW - U)./U;

% vertical load
FZFL        = (FZF0 - dFZX)/2 - dFZYF;
FZFR        = (FZF0 - dFZX)/2 + dFZYF;
FZRL        = (FZR0 + dFZX)/2 - dFZYR;
FZRR        = (FZR0 + dFZX)/2 + dFZYR;

% tire force
[FXFL, FYFL]= PAC2002_TT(FZFL, KAPPA_FL, ALPHA_FL);
[FXFR, FYFR]= PAC2002_TT(FZFR, KAPPA_FR, ALPHA_FR);
[FXRL, FYRL]= PAC2002_TT(FZRL, KAPPA_RL, ALPHA_RL);
[FXRR, FYRR]= PAC2002_TT(FZRR, KAPPA_RR, ALPHA_RR);
FX1         = FXFL*cos(DELTAF) - FYFL*sin(DELTAF); 
FX2         = FXFR*cos(DELTAF) - FYFR*sin(DELTAF);
FX3         = FXRL;
FX4         = FXRR;
FY1         = FXFL*sin(DELTAF) + FYFL*cos(DELTAF);
FY2         = FXFR*sin(DELTAF) + FYFR*cos(DELTAF);
FY3         = FYRL;
FY4         = FYRR;

% dynamics
xdot(1)     = U.*cos(PSI) - V.*sin(PSI);
xdot(2)     = U.*sin(PSI) + V.*cos(PSI);
xdot(3)     = (FY1 + FY2 + FY3 + FY4)/M - U.*R;
xdot(4)     = ((FX1 - FX2 + FX3 - FX4)*(LC/2) + (FY1 + FY2)*LA - (FY3 + FY4)*LB)/IZZ;
xdot(5)     = R;
xdot(6)     = (FX1 + FX2 + FX3 + FX4)/M + V.*R;
xdot(7)     = (T1 - FX1*RW)/IW;
xdot(8)     = (T2 - FX2*RW)/IW;
xdot(9)     = (T3 - FX3*RW)/IW;
xdot(10)    = (T4 - FX4*RW)/IW;
Hat_dFZX  	= dFZX_Coeff*(xdot(6) - V.*R);
Hat_dFZYF 	= dFZYF_Coeff*(xdot(3) + U.*R);
Hat_dFZYR  	= dFZYR_Coeff*(xdot(3) + U.*R);
xdot(11)    = (Hat_dFZX - dFZX)/Tau_LT;
xdot(12)    = (Hat_dFZYF - dFZYF)/Tau_LT;
xdot(13)    = (Hat_dFZYR - dFZYR)/Tau_LT;
xdot        = xdot(:);