function FX = PAC2002_FX(DFZ, KAPPA, ALPHA, FX0)

EPSILON     = 0.001;
BXA         = 11.13.*cos(atan(-12.494.*KAPPA));
EXA         = -0.37196 + 0.0017379.*DFZ;
ALPHAS     	= ALPHA + 0.0045181;
TMP1        = cos(0.97505.*atan(BXA.*ALPHAS - EXA.*(BXA.*ALPHAS - atan(BXA.*ALPHAS))));
TMP2        = cos(0.97505.*atan(BXA.*0.0045181 - EXA.*(BXA.*0.0045181 - atan(BXA.*0.0045181))));
GX          = TMP1./TMP2;
IDX         = find(abs(TMP2) <EPSILON);
if ~isempty(IDX)
    GX(IDX) = 0; % or 1 for super grip?
end
FX          = GX.*FX0;