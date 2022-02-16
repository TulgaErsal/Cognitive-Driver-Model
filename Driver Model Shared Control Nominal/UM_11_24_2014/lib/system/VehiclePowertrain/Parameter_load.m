% Conversion from m/s to mph
ms2mph          = 2.23694;

% Simulink time step
Tstep = 0.01;

% Simulink simulation length
Tlength = 120;

% Constant reference speed
UG_ref = 45/ms2mph;

%% Sensor_delay = 2 Control_delay
% Constant delay
T_CD = 0.3;
% Variable delay
A = 0.25;
B = 0.1;
M = -1.8380;
SD = 1.221;

% Frame rate (s)
Framerate = 0.05;

% Speed display rate (s)
Ttext = 0.5;

% Packet loss threshold (-)
PacketLoss = 0;

% For 2D Matlab version, range of view(m) and FOV(rad)
Rcam = 100; 
FOV  = pi/6; % Total cone angle = 2*FOV;

% Cruise-controller's parameter
MIN_TH      = 0;
Kp_v        = 30;
Ti_v        = 2.5;
Tt_v        = Ti_v/8.0;
Gain_v      = 70;

load Track_ref_testing2.mat