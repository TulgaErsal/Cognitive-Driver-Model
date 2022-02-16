function [FX,FY,MX,MY,MZ] = TIRE_MODEL(FZ, KAPPA, ALPHA)

GAMMA = zeros(size(FZ));
VX = 16.7*ones(size(FZ));

[FX,FY,MX,MY,MZ] = PAC2002(FZ, KAPPA, ALPHA, GAMMA, VX);

