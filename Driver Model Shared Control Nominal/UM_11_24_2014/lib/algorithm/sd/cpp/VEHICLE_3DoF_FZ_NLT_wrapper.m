function [xdot, CT] = VEHICLE_3DoF_FZ_NLT_wrapper(t,x,INPUT)

% inputs
CMD_TM      = INPUT.CMD_TM;
CMD_SR      = INPUT.CMD_SR;
CMD_AX      = INPUT.CMD_AX;

DELTAFDOT   = interp1f(CMD_TM, CMD_SR, t, 'nearest');
AX          = interp1f(CMD_TM, CMD_AX, t, 'nearest');

CT          = [DELTAFDOT, AX];

V           = x(3);
R           = x(4);
DELTAF      = x(5);
PSI         = x(6);
U           = x(7);

xdot        = VEHICLE_3DoF_FZ_NLT(V, R, DELTAF, PSI, U, DELTAFDOT, AX);

xdot        = xdot(:);