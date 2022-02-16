function [FX,FY,MX,MY,MZ] = PAC2002_biased(FZ, KAPPA, ALPHA, MODE)

DFZ = (FZ - 35000)/35000;

[FX0, KX] = PAC2002_FX0(DFZ, FZ, KAPPA, 0);
[FY0, KY, SHY, SVY, MUY] = PAC2002_FY0(DFZ, FZ, ALPHA, 0);
[MZ0, ALPHAT, ALPHAR, BT, CT, DT, ET, BR, CR, DR] = PAC2002_MZ0(DFZ, FZ, ALPHA, 0, KY, SHY, SVY, FY0);

FX = zeros(size(FY0));
FY = zeros(size(FY0));
MX = zeros(size(FY0));
MY = zeros(size(FY0));
MZ = zeros(size(FY0));

if strcmp(MODE,'PURESLIP')
    FX = FX0;
    FY = FY0;
    MZ = MZ0;
elseif strcmp(MODE,'COMBSLIP')
    FX = PAC2002_FX(DFZ, KAPPA, ALPHA, FX0);
    [FY, SVYK] = PAC2002_FY(DFZ, FZ, KAPPA, ALPHA, 0, FY0, MUY);
    MZ = PAC2002_MZ(DFZ, KAPPA, ALPHA, 0, ALPHAT, ALPHAR, BT, CT, DT, ET, BR, CR, DR, KX, KY, SVYK, FX, FY);
end 

MZ = real(MZ);