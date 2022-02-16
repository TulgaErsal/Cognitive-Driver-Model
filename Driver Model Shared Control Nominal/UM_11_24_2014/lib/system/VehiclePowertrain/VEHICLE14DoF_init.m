% Vehicle14DOF_init.m
% Editted on Nov.6th, 2014
% This is the initialization file. 
% It calls parameters for 14DOF vehicle model.

%% Vehicle model parameters and initialization
load DATA_HMMWV_PLANT.mat
global DATA_HMMWV STATES_INIT
warning off;

U_INIT      = 0.01;   
STATES_INIT          = zeros(1,32);
STATES_INIT(3)       = DATA_HMMWV.HG;
STATES_INIT(6)       = pi/2;
STATES_INIT(7)       = U_INIT;
STATES_INIT(17:20)   = DATA_HMMWV.XT_INIT;
STATES_INIT(21:24)   = DATA_HMMWV.XS_INIT;
STATES_INIT(25:28)   = U_INIT./DATA_HMMWV.ZT_INIT;

%% Cruise control parameters
Kp_v    = 30;		  			
Ti_v    = 2.5 ;		  			
Tt_v    = Ti_v/8;				
Gain_v  = 70;				    
ms2mph  = 2.23694;

fprintf('14DoF vehicle model parameters loaded.\n')
fprintf('\n');
