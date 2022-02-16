function [FY, FY_COEFF] = PAC2002_FY(DATA, FZ, KAPPA, ALPHA, GAMMA, FY0, FY0_COEFF)

EPSILON = 0.001;

%% Tire Data
RBY1    = DATA.RBY1;                                 
RBY2    = DATA.RBY2;                                 
RBY3    = DATA.RBY3;                                 
RCY1    = DATA.RCY1;                                 
REY1    = DATA.REY1;                                 
REY2    = DATA.REY2;                                 
RHY1    = DATA.RHY1;                                 
RHY2    = DATA.RHY2;                                 
RVY1    = DATA.RVY1;                                 
RVY2    = DATA.RVY2;                                 
RVY3    = DATA.RVY3;                                 
RVY4    = DATA.RVY4;                                 
RVY5    = DATA.RVY5;                                 
RVY6    = DATA.RVY6;                                 

% normal load
FZ0     = DATA.FNOMIN;  
DFZ     = (FZ - FZ0)/(FZ0);

% FY0 coefficient
MUY     = FY0_COEFF.MUY;

%%
BYK     = RBY1.*cos(atan(RBY2.*(ALPHA - RBY3)));
CYK     = RCY1;
EYK     = REY1 + REY2.*DFZ;
SHYK    = RHY1 + RHY2.*DFZ;
% DYK   = FY0./(cos(CYK.*atan(BYK.*SHYK - EYK.*(BYK.*SHYK - atan(BYK.*SHYK)))));
KAPPAS  = KAPPA + SHYK;
TMP1    = cos(CYK.*atan(BYK.*KAPPAS - EYK.*(BYK.*KAPPAS - atan(BYK.*KAPPAS))));
TMP2    = cos(CYK.*atan(BYK.*SHYK - EYK.*(BYK.*SHYK - atan(BYK.*SHYK))));
GY      = TMP1./TMP2;
IDX     = find(abs(TMP2) <EPSILON);
if ~isempty(IDX)
    GY(IDX) = 0;        % or 1 for super grip?
end
DVYK    = MUY.*FZ.*(RVY1 + RVY2.*DFZ + RVY3.*GAMMA).*cos(atan(RVY4.*ALPHA));
SVYK    = DVYK.*sin(RVY5.*atan(RVY6.*KAPPA));
FY      = GY.*FY0 + SVYK;
% FY    = DYK.*sin((CYK.*atan(BYK.*KAPPAS - EYK.*(BYK.*KAPPAS-atan(BYK.*KAPPAS)))))+SVYK;

FY_COEFF.SVYK = SVYK;