function [FX,FY,MX,MY,MZ] = PAC2002(FZ, KAPPA, ALPHA, GAMMA, VX, MODE, DATA)

[FX,FY,MX,MY,MZ] = PAC2002_biased(FZ, KAPPA, ALPHA, GAMMA, VX, MODE, DATA);

KAPPA = zeros(size(FZ));
ALPHA = zeros(size(FZ));
GAMMA = zeros(size(FZ));
[FX0,FY0,MX0,MY0,MZ0] = PAC2002_biased(FZ, KAPPA, ALPHA, GAMMA, VX, MODE, DATA);

FX = FX - FX0;
FY = FY - FY0;
MX = MX - MX0;
MY = MY - MY0;
MZ = MZ - MZ0;