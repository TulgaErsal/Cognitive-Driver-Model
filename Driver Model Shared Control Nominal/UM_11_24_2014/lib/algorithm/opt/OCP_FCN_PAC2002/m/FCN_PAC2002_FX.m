function FX = FCN_PAC2002_FX(FZ, KAPPA, ALPHA)

[ RB1, RB2, RC1, RE1, RE2, RH1] = DATA_FX();

FX0 = FCN_PAC2002_FX0(FZ, KAPPA);

BXA     = RB1.*cos(atan(RB2.*KAPPA));
EXA     = RE2*FZ + RE1;
ALPHAS  = ALPHA + RH1;
TMP7    = BXA.*ALPHAS;
TMP8    = cos(RC1.*atan(TMP7 - EXA.*(TMP7 - atan(TMP7))));
TMP9    = BXA.*RH1;
TMP10  	= cos(RC1.*atan(TMP9 - EXA.*(TMP9 - atan(TMP9))));
GX      = TMP8./TMP10;
FX      = GX.*FX0;

% EPSILON       = 0.001;
% IDX           = find(abs(TMP10) <EPSILON);
% if ~isempty(IDX)
%     GX(IDX)   = 0; % or 1 for super grip?
% end
% FX            = GX.*FX0;
