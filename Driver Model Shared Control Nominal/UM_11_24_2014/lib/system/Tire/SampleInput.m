% time [s]
T = linspace(1, 10, 1000);
% normal load [N]
FZ = 5000*ones(size(T));
% longitudinal slip [-]
KAPPA = 0.5*sin(pi*T/2);
% slip angle [rad]
ALPHA = pi/2*cos(pi*T/2);
% inclination angle [rad]
GAMMA = zeros(size(T));
% longitudinal speed [m/s]
VX = 20*ones(size(T));