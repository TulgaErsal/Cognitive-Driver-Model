function [FY, SVYK] = PAC2002_FY(DFZ, FZ, KAPPA, ALPHA, GAMMA, FY0, MUY)

EPSILON     = 0.001;
BYK         = 13.271.*cos(atan(5.2405.*(ALPHA - 1.1547e-005)));
EYK         = 0.010513 + 5.9816e-005.*DFZ;
SHYK        = 0.028005 - 4.8794e-005.*DFZ;
KAPPAS      = KAPPA + SHYK;
TMP1        = cos(1.01.*atan(BYK.*KAPPAS - EYK.*(BYK.*KAPPAS - atan(BYK.*KAPPAS))));
TMP2        = cos(1.01.*atan(BYK.*SHYK - EYK.*(BYK.*SHYK - atan(BYK.*SHYK))));
GY          = TMP1./TMP2;
IDX         = find(abs(TMP2) <EPSILON);
if ~isempty(IDX)
    GY(IDX) = 0; % or 1 for super grip?
end
DVYK        = MUY.*FZ.*(0.0066878 - 0.042813.*DFZ - 0.16227.*GAMMA).*cos(atan(-0.019796.*ALPHA));
SVYK        = DVYK.*sin(1.9.*atan(-7.8097.*KAPPA));
FY          = GY.*FY0 + SVYK;