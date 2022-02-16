function FY0 = PAC2002_ST(FZ, ALPHA)

load DATA_TIRE.mat
ZETA        = TURNSLIP();
GAMMA       = zeros(size(FZ));

[FY0, ~]    = PAC2002_FY0(DATA_TIRE, ZETA, FZ, ALPHA, GAMMA);

ALPHA       = zeros(size(FZ));

[FY00, ~]    = PAC2002_FY0(DATA_TIRE, ZETA, FZ, ALPHA, GAMMA);

FY0 = FY0 - FY00;