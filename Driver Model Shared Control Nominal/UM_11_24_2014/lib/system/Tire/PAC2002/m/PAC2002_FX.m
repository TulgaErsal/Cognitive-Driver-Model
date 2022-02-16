function FX = PAC2002_FX(DATA, FZ, KAPPA, ALPHA, FX0)

EPSILON = 0.001;

%% Tire Data
RBX1    = DATA.RBX1;                                 
RBX2    = DATA.RBX2;                                 
RCX1    = DATA.RCX1;                                 
REX1    = DATA.REX1;                                 
REX2    = DATA.REX2;                                 
RHX1    = DATA.RHX1;                            

% scaling coefficients
LFZO    = DATA.LFZO;  
LXAL    = DATA.LXAL;

% normal load
FZ0     = DATA.FNOMIN;  
DFZ     = (FZ - FZ0*LFZO)/(FZ0*LFZO);

%%
BXA     = RBX1.*cos(atan(RBX2.*KAPPA)).*LXAL;
CXA     = RCX1;
EXA     = REX1 + REX2.*DFZ;
% check_E(EXA,'EXA');
SHXA    = RHX1;
% DXA   = FX0./(cos(CXA.*atan(BXA.*SHXA - EXA.*(BXA.*SHXA - atan(BXA.*SHXA)))));
ALPHAS = ALPHA + SHXA;
TMP1    = cos(CXA.*atan(BXA.*ALPHAS - EXA.*(BXA.*ALPHAS - atan(BXA.*ALPHAS))));
TMP2    = cos(CXA.*atan(BXA.*SHXA - EXA.*(BXA.*SHXA - atan(BXA.*SHXA))));
GX      = TMP1./TMP2;
IDX     = find(abs(TMP2) <EPSILON);
if ~isempty(IDX)
    GX(IDX) = 0; % or 1 for super grip?
end
FX      = GX.*FX0;
% FX    = DXA.*sin((CXA.*atan(BXA.*ALPHAS - EXA.*(BXA.*ALPHAS-atan(BXA.*ALPHAS)))));