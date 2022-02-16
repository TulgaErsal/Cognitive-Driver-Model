function [FX,FY,MX,MY,MZ] = PAC2002_biased(FZ, KAPPA, ALPHA, GAMMA, VX, MODE, DATA)

% -------------------------------------------------------------------------
% PAC2002 Magic-Formula tire model
%
% Inputs:
% FZ:       normal wheel load (N)
% KAPPA:    longitudinal slip (-)
% ALPHA:    slip angle (rad)
% GAMMA:    inclination angle (rad)
% VX:       longitudinal speed
% MODE:     'PURESLIP': pure slip
%           'COMBSLIP': combined slip
% DATA:     empirical data
%
% Outputs:
% FX:       longitudinal force (N)
% FY:       lateral force (N)
% MX:       overturning couple (N-m)
% MY:       rolling resistance moment (N-m)
% MZ:       aligning moment (N-m)
% 
% Notes:
% 1. check_E: check the range of E ( E<= 1) in
% PAC2002_FX0; PAC2002_FX; PAC2002_FY0; PAC2002_FY; PAC2002_MZ0
% 
% 2. modify_denominator: to avoid dividing by zero
% PAC2002_FX0; PAC2002_FY0; PAC2002_MZ0
% -------------------------------------------------------------------------

% For situations where turn-slip may be neglected and camber remains small, 
% the reduction factors that appear in the equations for steady-state 
% pure slip, are to be set to 1
ZETA    = TURNSLIP();

% Input Range Check
% KAPPAMIN    = TIREDATA.KPUMIN;                             
% KAPPAMAX    = TIREDATA.KPUMAX;                             
% ALPHAMIN    = TIREDATA.ALPMIN;                             
% ALPHAMAX    = TIREDATA.ALPMAX;                             
% GAMMAMIN    = TIREDATA.CAMMIN;                             
% GAMMAMAX    = TIREDATA.CAMMAX;                             
% FZMIN       = TIREDATA.FZMIN;                               
% FZMAX       = TIREDATA.FZMAX;  
%
% if ~isempty(find(FZ > FZMAX, 1))
%     error('Normal Wheel Load Exceed Maximum Allowable Value')
% elseif ~isempty(find(FZ < FZMIN, 1))
%     disp('Normal Wheel Load Below Minimum Allowable Value')
% end
% if ~isempty(find(KAPPA > KAPPAMAX, 1))
%     error('Longitudinal Slip Exceed Maximum Allowable Value')
% elseif ~isempty(find(KAPPA < KAPPAMIN, 1))
%     error('Longitudinal Slip Below Minimum Allowable Value')
% end
% if ~isempty(find(ALPHA > ALPHAMAX, 1))
%     error('Slip Angle Exceed Maximum Allowable Value')
% elseif ~isempty(find(ALPHA < ALPHAMIN, 1))
%     error('Slip Angle Below Minimum Allowable Value')
% end
% if ~isempty(find(GAMMA > GAMMAMAX, 1))
%     error('Inclination Angle Exceed Maximum Allowable Value')
% elseif ~isempty(find(GAMMA < GAMMAMIN, 1))
%     error('Inclination Angle Below Minimum Allowable Value')
% end

[FX0, FX0_COEFF]    = PAC2002_FX0(DATA, ZETA, FZ, KAPPA, GAMMA);
[FY0, FY0_COEFF]    = PAC2002_FY0(DATA, ZETA, FZ, ALPHA, GAMMA);
[MZ0, MZ0_COEFF]	= PAC2002_MZ0(DATA, ZETA, FZ, ALPHA, GAMMA, FY0, FY0_COEFF);

if strcmp(MODE,'PURESLIP')
    FX              = FX0;
    FY              = FY0;
    MX              = PAC2002_MX(DATA, FZ, GAMMA, FY);
    MY              = PAC2002_MY(DATA, FZ, FX, VX);
    MZ              = MZ0;
elseif strcmp(MODE,'COMBSLIP')
    FX              = PAC2002_FX(DATA, FZ, KAPPA, ALPHA, FX0);
    [FY, FY_COEFF]  = PAC2002_FY(DATA, FZ, KAPPA, ALPHA, GAMMA, FY0, FY0_COEFF);
    MX              = PAC2002_MX(DATA, FZ, GAMMA, FY);
    MY              = PAC2002_MY(DATA, FZ, FX, VX);
    MZ              = PAC2002_MZ(DATA, FZ, KAPPA, ALPHA, GAMMA, FX, FY, FX0_COEFF, FY0_COEFF, MZ0_COEFF, FY_COEFF);
end 
