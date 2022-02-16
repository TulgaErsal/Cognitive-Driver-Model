function [FX,FY,MX,MY,MZ] = TIRE_MODEL(FZ, KAPPA, ALPHA)

GAMMA = zeros(size(FZ));
VX = 16.7*ones(size(FZ));

[FX,FY,MX,MY,MZ] = PAC2002_biased(FZ, KAPPA, ALPHA, GAMMA, VX);

KAPPA = zeros(size(FZ));
ALPHA = zeros(size(FZ));
[FX0,FY0,MX0,MY0,MZ0] = PAC2002_biased(FZ, KAPPA, ALPHA, GAMMA, VX);

FX = FX - FX0;
FY = FY - FY0;
MX = MX - MX0;
MY = MY - MY0;
MZ = MZ - MZ0;
