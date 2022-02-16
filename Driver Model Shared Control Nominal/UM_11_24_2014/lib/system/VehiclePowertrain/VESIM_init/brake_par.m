%% Brake
K_vb        = 1500; % N
F_cs        = 138; % N
F_cf        = 80; % N
A_mc        = 4.91*10^-4; % m^2
C_q         = 1.4*10^-6; % m^3/s sqrt(kpa)
P_0         = 10.67*10^3; % Pa
P_gain      = 0.6*10^-3;

load brake_LUT.mat
% brake_V     = flip(Data001(:, 1))*10^-6;
% brake_Pw    = flip(Data001(:, 2));