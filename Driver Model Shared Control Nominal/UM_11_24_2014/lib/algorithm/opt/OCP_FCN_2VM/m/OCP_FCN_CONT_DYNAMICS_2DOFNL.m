function DYNAMICS = OCP_FCN_CONT_DYNAMICS_2DOFNL(V, R, PSI, SA, SR, VD)

%%
M               = VD.M;
IZZ             = VD.IZZ;
LA              = VD.LA;
LB              = VD.LB;
FZF0            = VD.FZF0;
FZR0            = VD.FZR0;
dF              = VD.dF;

U0              = VD.U0;

%%
ALPHAF          = atan2(V + LA*R, U0) - SA;
ALPHAR          = atan2(V - LB*R, U0);

FZF             = FZF0 - dF*( - V.*R);
FZR             = FZR0 + dF*( - V.*R);

FYF             = FCN_PAC2002_FY0(FZF, ALPHAF);
FYR             = FCN_PAC2002_FY0(FZR, ALPHAR);

DYNAMICS        = zeros(length(V), 6);

DYNAMICS(:,1)   = U0.*cos(PSI) - (V + LA*R).*sin(PSI);
DYNAMICS(:,2)	= U0.*sin(PSI) + (V + LA*R).*cos(PSI);
DYNAMICS(:,3)	= (FYF + FYR)/M - R.*U0;
DYNAMICS(:,4)  	= (LA*FYF-LB*FYR)/IZZ;
DYNAMICS(:,5)   = SR;
DYNAMICS(:,6)  	= R;