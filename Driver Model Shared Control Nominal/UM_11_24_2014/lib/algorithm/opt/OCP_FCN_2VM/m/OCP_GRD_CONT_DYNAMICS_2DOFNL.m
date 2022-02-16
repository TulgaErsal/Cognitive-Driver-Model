function DYNAMICS_GRD = OCP_GRD_CONT_DYNAMICS_2DOFNL(V, R, PSI, SA, VD)

M       = VD.M;
IZZ     = VD.IZZ;
LA      = VD.LA;
LB      = VD.LB;
FZF0    = VD.FZF0;
FZR0    = VD.FZR0;
dF      = VD.dF;

U0      = VD.U0;

FZF     = FZF0 + dF*V.*R;
ALPHAF	= atan2(V + LA*R, U0) - SA;

[~, dFYFdFZ, dFYFdALPHA] = GRD_PAC2002_FY0(FZF, ALPHAF);

PARAF	= (V + LA*R).^2 + U0.^2;

dFZFdV  = dF*R;
dFZFdR  = dF*V;

dALPHAFdV = U0./ PARAF;
dALPHAFdR = (LA*U0)./ PARAF;
dALPHAFdD = - 1;

dFYFdV	= dFYFdFZ.*dFZFdV + dFYFdALPHA.*dALPHAFdV;
dFYFdR	= dFYFdFZ.*dFZFdR + dFYFdALPHA.*dALPHAFdR;
dFYFdD	=                   dFYFdALPHA.*dALPHAFdD;

FZR       	= FZR0 - dF*V.*R;
ALPHAR     	= atan2(V - LB*R, U0);

[~, dFYRdFZ, dFYRdALPHA] = GRD_PAC2002_FY0(FZR, ALPHAR);
PARAR   	= (V - LB*R).^2 + U0.^2;

dFZRdV  = - dF*R;
dFZRdR  = - dF*V;

dALPHARdV = U0./ PARAR;
dALPHARdR = - (LB*U0)./ PARAR;
dALPHARdD = 0;

dFYRdV	= dFYRdFZ.*dFZRdV + dFYRdALPHA.*dALPHARdV;
dFYRdR	= dFYRdFZ.*dFZRdR + dFYRdALPHA.*dALPHARdR;
dFYRdD	=                   dFYRdALPHA.*dALPHARdD;

% dV: derivative with respect to lateral speed, V
% dR: derivative with respect to yaw rate, R
% dD: derivative with respect to steering angle, DELTAF

DYNAMICS_GRD = zeros(length(V), 12);

% / dV
DYNAMICS_GRD(:,1)    = - sin(PSI);
DYNAMICS_GRD(:,2)    =   cos(PSI);
DYNAMICS_GRD(:,3)    = (dFYFdV + dFYRdV) / M;
DYNAMICS_GRD(:,4)    = (LA*dFYFdV - LB*dFYRdV)/IZZ;

% / dR
DYNAMICS_GRD(:,5)    = - LA*sin(PSI);
DYNAMICS_GRD(:,6)    =   LA*cos(PSI);
DYNAMICS_GRD(:,7)    = (dFYFdR + dFYRdR) /M - U0;
DYNAMICS_GRD(:,8)    = (LA*dFYFdR - LB*dFYRdR)/IZZ;
DYNAMICS_GRD(:,9)    = ones(size(PSI));

% / dDELTAF
DYNAMICS_GRD(:,10)    = (dFYFdD + dFYRdD) / M;
DYNAMICS_GRD(:,11)    = (LA*dFYFdD - LB*dFYRdD)/IZZ;

% / dPSI
DYNAMICS_GRD(:,12)   = - U0*sin(PSI) - (V + LA*R).*cos(PSI);
DYNAMICS_GRD(:,13)   =   U0*cos(PSI) - (V + LA*R).*sin(PSI);

% / dDELTAFDOT
DYNAMICS_GRD(:,14)   = ones(size(SA));