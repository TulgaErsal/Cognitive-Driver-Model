function FY = FCN_PAC2002_FY(FZ, KAPPA, ALPHA)

[ PD1, PD2, RB1, RB2, RB3, RC1, RE1, RE2, ...
  RH1, RH2, RV1, RV2, RV4, RV5, RV6] = DATA_FY();

FY0     = FCN_PAC2002_FY0(FZ, ALPHA);

DY      = PD2*FZ.^2 + PD1*FZ;
BYK     = RB1.*cos(atan(RB2.*(ALPHA - RB3)));
EYK     = RE2*FZ + RE1;
SHYK    = RH2*FZ + RH1;
KAPPAS  = KAPPA + SHYK;
TMP3    = BYK.*KAPPAS;
TMP4    = cos(RC1.*atan(TMP3 - EYK.*(TMP3 - atan(TMP3))));
TMP5    = BYK.*SHYK;
TMP6    = cos(RC1.*atan(TMP5 - EYK.*(TMP5 - atan(TMP5))));
GY      = TMP4./TMP6;
DVYK    = DY.*(RV2*FZ + RV1).*cos(atan(RV4.*ALPHA));
SVYK    = DVYK.*sin(RV5.*atan(RV6.*KAPPA));
FY      = GY.*FY0 + SVYK;

% EPSILON       = 0.001;
% IDX           = find(abs(TMP6) <EPSILON);
% if ~isempty(IDX)
%     GY(IDX)   = 0;        % or 1 for super grip?
% end
% FY            = GY.*FY0 + SVYK;
