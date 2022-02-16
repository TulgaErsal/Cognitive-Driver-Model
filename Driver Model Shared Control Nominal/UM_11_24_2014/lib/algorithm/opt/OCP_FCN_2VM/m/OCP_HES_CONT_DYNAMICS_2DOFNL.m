function DYNAMICS_HES = OCP_HES_CONT_DYNAMICS_2DOFNL(V, R, PSI, SA, VD)

M       = VD.M;
IZZ     = VD.IZZ;
LA      = VD.LA;
LB      = VD.LB;
FZF0    = VD.FZF0;
FZR0    = VD.FZR0;
dF      = VD.dF;

U0      = VD.U0;

FZF       	= FZF0 + dF*V.*R;
ALPHAF    	= atan2(V + LA*R, U0) - SA;

PARAF   	= (V + LA*R).^2 + U0.^2;
PARAFSQ     = PARAF.^2;
dPARAFdV   	= 2*(V + LA*R);
dPARAFdR   	= 2*LA*(V + LA*R);

dFZFdV      = dF*R;
    dFZFdVdV = 0;
dFZFdR      = dF*V;
    dFZFdRdV = dF;
    dFZFdRdR = 0;

dALPHAFdV   = U0./PARAF;
    dALPHAFdVdV = U0.*( - dPARAFdV)./PARAFSQ;
dALPHAFdR   = LA*U0./PARAF;
    dALPHAFdRdV = LA*U0.*( - dPARAFdV)./PARAFSQ;
    dALPHAFdRdR = LA*U0.*( - dPARAFdR)./PARAFSQ;
dALPHAFdD   = - 1;
    
FZR       	= FZR0 - dF*V.*R;
ALPHAR     	= atan2(V - LB*R, U0);

PARAR   	= (V - LB*R).^2 + U0.^2;
PARARSQ     = PARAR.^2;
dPARARdV   	= 2*(V - LB*R);
dPARARdR   	= - 2*LB*(V - LB*R);

dFZRdV      = - dF*R;
    dFZRdVdV = 0;
dFZRdR      = - dF*V;
    dFZRdRdV = - dF;
    dFZRdRdR = 0;

dALPHARdV   = U0./PARAR;
    dALPHARdVdV = U0.*( - dPARARdV)./PARARSQ;
dALPHARdR   = - LB*U0./PARAR;
    dALPHARdRdV = - LB*U0.*( - dPARARdV)./PARARSQ;
    dALPHARdRdR = - LB*U0.*( - dPARARdR)./PARARSQ;
dALPHARdD   = 0;
    
[~, dFYFdFZ, dFYFdAP, dFYFdFZdFZ, dFYFdAPdFZ, dFYFdAPdAP] = HES_PAC2002_FY0(FZF, ALPHAF);
[~, dFYRdFZ, dFYRdAP, dFYRdFZdFZ, dFYRdAPdFZ, dFYRdAPdAP] = HES_PAC2002_FY0(FZR, ALPHAR);

dFYFdVdV = dFYFdAP.*dALPHAFdVdV + dFYFdAPdAP.*dALPHAFdV.*dALPHAFdV + dFYFdFZ.*dFZFdVdV + dFYFdFZdFZ.*dFZFdV.*dFZFdV + 2*dFYFdAPdFZ.*dALPHAFdV.*dFZFdV;
dFYFdRdV = dFYFdAP.*dALPHAFdRdV + dFYFdAPdAP.*dALPHAFdR.*dALPHAFdV + dFYFdFZ.*dFZFdRdV + dFYFdFZdFZ.*dFZFdR.*dFZFdV + dFYFdAPdFZ.*dALPHAFdV.*dFZFdR + dFYFdAPdFZ.*dALPHAFdR.*dFZFdV;
dFYFdRdR = dFYFdAP.*dALPHAFdRdR + dFYFdAPdAP.*dALPHAFdR.*dALPHAFdR + dFYFdFZ.*dFZFdRdR + dFYFdFZdFZ.*dFZFdR.*dFZFdR + 2*dFYFdAPdFZ.*dALPHAFdR.*dFZFdR;
dFYFdDdV =                        dFYFdAPdAP.*dALPHAFdD.*dALPHAFdV                                                  + dFYFdAPdFZ.*dALPHAFdD.*dFZFdV;
dFYFdDdR =                        dFYFdAPdAP.*dALPHAFdD.*dALPHAFdR                                                  + dFYFdAPdFZ.*dALPHAFdD.*dFZFdR;
dFYFdDdD =                        dFYFdAPdAP.*dALPHAFdD.*dALPHAFdD;

dFYRdVdV = dFYRdAP.*dALPHARdVdV + dFYRdAPdAP.*dALPHARdV.*dALPHARdV + dFYRdFZ.*dFZRdVdV + dFYRdFZdFZ.*dFZRdV.*dFZRdV + 2*dFYRdAPdFZ.*dALPHARdV.*dFZRdV;
dFYRdRdV = dFYRdAP.*dALPHARdRdV + dFYRdAPdAP.*dALPHARdR.*dALPHARdV + dFYRdFZ.*dFZRdRdV + dFYRdFZdFZ.*dFZRdR.*dFZRdV + dFYRdAPdFZ.*dALPHARdV.*dFZRdR + dFYRdAPdFZ.*dALPHARdR.*dFZRdV;
dFYRdRdR = dFYRdAP.*dALPHARdRdR + dFYRdAPdAP.*dALPHARdR.*dALPHARdR + dFYRdFZ.*dFZRdRdR + dFYRdFZdFZ.*dFZRdR.*dFZRdR + 2*dFYRdAPdFZ.*dALPHARdR.*dFZRdR;
dFYRdDdV =                        dFYRdAPdAP.*dALPHARdD.*dALPHARdV                                                  + dFYRdAPdFZ.*dALPHARdD.*dFZRdV;
dFYRdDdR =                        dFYRdAPdAP.*dALPHARdD.*dALPHARdR                                                  + dFYRdAPdFZ.*dALPHARdD.*dFZRdR;
dFYRdDdD =                        dFYRdAPdAP.*dALPHARdD.*dALPHARdD;

DYNAMICS_HES         = zeros(length(V), 16);

% / dV / dV
DYNAMICS_HES(:,1)    = (dFYFdVdV + dFYRdVdV) / M;
DYNAMICS_HES(:,2)    = (LA*dFYFdVdV - LB*dFYRdVdV)/IZZ;

% / dR / dV
DYNAMICS_HES(:,3)    = (dFYFdRdV + dFYRdRdV) / M;
DYNAMICS_HES(:,4)    = (LA*dFYFdRdV - LB*dFYRdRdV)/IZZ;

% / dR / dR
DYNAMICS_HES(:,5)  	= (dFYFdRdR + dFYRdRdR) / M;
DYNAMICS_HES(:,6) 	= (LA*dFYFdRdR - LB*dFYRdRdR)/IZZ;

% / dD / dV
DYNAMICS_HES(:,7)   = (dFYFdDdV + dFYRdDdV) / M;
DYNAMICS_HES(:,8)   = (LA*dFYFdDdV - LB*dFYRdDdV)/IZZ;

% / dD / dR
DYNAMICS_HES(:,9)    = (dFYFdDdR + dFYRdDdR) / M;
DYNAMICS_HES(:,10)   = (LA*dFYFdDdR - LB*dFYRdDdR)/IZZ;

% / dD / dD
DYNAMICS_HES(:,11)   = (dFYFdDdD + dFYRdDdD) / M;
DYNAMICS_HES(:,12)   = (LA*dFYFdDdD - LB*dFYRdDdD)/IZZ;

% / dPSI / dV
DYNAMICS_HES(:,13)   = - cos(PSI);
DYNAMICS_HES(:,14)   = - sin(PSI);

% / dPSI / dR
DYNAMICS_HES(:,15)   = - LA*cos(PSI);
DYNAMICS_HES(:,16)   = - LA*sin(PSI);

% / dPSI / dPSI
DYNAMICS_HES(:,17)   = - U0.*cos(PSI) + (V + LA*R).*sin(PSI);
DYNAMICS_HES(:,18)   = - U0.*sin(PSI) - (V + LA*R).*cos(PSI);