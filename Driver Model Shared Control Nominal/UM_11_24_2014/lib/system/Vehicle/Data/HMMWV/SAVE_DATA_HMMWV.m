clear all; clc; close all;

% load original HMMWV data
load DATA_HMMWV_RAW.mat

DATA_HMMWV.g         	= DATA_HMMWV_RAW.g;                        % m/s^2
DATA_HMMWV.MU       	= DATA_HMMWV_RAW.UNSPRUNGMASS_MASS;        % kg
DATA_HMMWV.MS          	= DATA_HMMWV_RAW.SPRUNGMASS_MASS;          % kg
DATA_HMMWV.VEHICLEMASS	= DATA_HMMWV_RAW.VEHICLE_MASS;             % kg
DATA_HMMWV.LA         	= DATA_HMMWV_RAW.VEHICLE_LA;               % m
DATA_HMMWV.LB           = DATA_HMMWV_RAW.VEHICLE_LB;               % m
DATA_HMMWV.LC         	= DATA_HMMWV_RAW.VEHICLE_LC(1)*2;          % m
DATA_HMMWV.IXX        	= DATA_HMMWV_RAW.SPRUNGMASS_IXX;           % kg-m^2
DATA_HMMWV.IYY        	= DATA_HMMWV_RAW.SPRUNGMASS_IYY;           % kg-m^2
DATA_HMMWV.IZZ        	= DATA_HMMWV_RAW.SPRUNGMASS_IZZ;           % kg-m^2

% suspension spring stifness
DATA_HMMWV.KS           = DATA_HMMWV_RAW.KS;                       % N/m
% Tire Stiffness
DATA_HMMWV.KT           = DATA_HMMWV_RAW.KT;                       % N/m
% Damper coefficient: nonlinear relationship
    % relative speed
DATA_HMMWV.CS.RS    	= DATA_HMMWV_RAW.CS.relative_speed;        % m/s
    % front damping force
DATA_HMMWV.CS.FDF    	= DATA_HMMWV_RAW.CS.front_damping_force;   % N
    % rear damping force
DATA_HMMWV.CS.FDR     	= DATA_HMMWV_RAW.CS.rear_damping_force;    % N

% maximum power
DATA_HMMWV.MAXPOWER   	= DATA_HMMWV_RAW.MAXPOWER;                 % W
% wheel rotation inertia
DATA_HMMWV.IW       	= DATA_HMMWV_RAW.IW;                       % kg-m^2
% nominal tire radius
DATA_HMMWV.RW       	= DATA_HMMWV_RAW.RW;                       % m

DATA_HMMWV.HRCF       	= 0.90;                                     % m
DATA_HMMWV.HRCR      	= 0.85;                                     % m 

% Chassis CG height
DATA_HMMWV.HG          	= DATA_HMMWV_RAW.CHASSIS_HG;               % m
DATA_HMMWV.ZS_INIT  	= DATA_HMMWV.HG*[1, 1, 1, 1];               % m

TRACK_LENGTH        	= DATA_HMMWV.LA + DATA_HMMWV.LB;

MSI(1)                	= DATA_HMMWV.MS*DATA_HMMWV.LB/2/TRACK_LENGTH;
MSI(2)              	= DATA_HMMWV.MS*DATA_HMMWV.LB/2/TRACK_LENGTH;
MSI(3)                	= DATA_HMMWV.MS*DATA_HMMWV.LA/2/TRACK_LENGTH;
MSI(4)                  = DATA_HMMWV.MS*DATA_HMMWV.LA/2/TRACK_LENGTH;
DATA_HMMWV.XS_INIT   	= - MSI*DATA_HMMWV.g./DATA_HMMWV.KS; 

MVI(1)                 	= DATA_HMMWV.VEHICLEMASS*DATA_HMMWV.LB/2/TRACK_LENGTH;
MVI(2)               	= DATA_HMMWV.VEHICLEMASS*DATA_HMMWV.LB/2/TRACK_LENGTH;
MVI(3)                 	= DATA_HMMWV.VEHICLEMASS*DATA_HMMWV.LA/2/TRACK_LENGTH;
MVI(4)                 	= DATA_HMMWV.VEHICLEMASS*DATA_HMMWV.LA/2/TRACK_LENGTH;
DATA_HMMWV.XT_INIT     	= - MVI*DATA_HMMWV.g./DATA_HMMWV.KT; 
DATA_HMMWV.ZT_INIT  	= DATA_HMMWV.RW + DATA_HMMWV.XT_INIT;

% Nominal track loads
FZF0                  	= DATA_HMMWV.MS*DATA_HMMWV.g*DATA_HMMWV.LB / TRACK_LENGTH + 2*DATA_HMMWV.MU*DATA_HMMWV.g;
FZR0                	= DATA_HMMWV.MS*DATA_HMMWV.g*DATA_HMMWV.LA / TRACK_LENGTH + 2*DATA_HMMWV.MU*DATA_HMMWV.g;

dFZX_Coeff          	= DATA_HMMWV.VEHICLEMASS*DATA_HMMWV.HG / TRACK_LENGTH;
% Lateral load transfer from step steer test
dFZYF_Coeff           	= 674.9;
dFZYR_Coeff             = 1076;

DATA_HMMWV.FZF0       	= FZF0;
DATA_HMMWV.FZR0      	= FZR0;
DATA_HMMWV.dFZX_Coeff	= dFZX_Coeff;
DATA_HMMWV.dFZYF_Coeff	= dFZYF_Coeff;
DATA_HMMWV.dFZYR_Coeff	= dFZYR_Coeff;

% single tire conering stiffness
% KY0                	= PKY1.*(FZ0.*LFZO).*sin(2.*atan(FZ./(PKY2.*FZ0.*LFZO))).*LKY;
KF0                     = -10.289.*35000.*sin(2.*atan(FZF0/2./(3.3343.*35000)));
KR0                     = -10.289.*35000.*sin(2.*atan(FZR0/2./(3.3343.*35000)));

% tire cornering stiffness versus tire vertical load
FZ_SEQ                  = 100:1:30000;                              % N
K_SEQ                   = -10.289.*35000.*sin(2.*atan(FZ_SEQ./(3.3343.*35000)));
P                       = polyfit(FZ_SEQ,K_SEQ,1);
K_SEQ_FIT               = P(1)*FZ_SEQ+P(2);

DATA_HMMWV.KF0          = KF0*2;
DATA_HMMWV.KR0          = KR0*2;
DATA_HMMWV.K_SLOPE  	= P(1);
DATA_HMMWV.K_INTERCEPT	= P(2);

DATA_HMMWV.Tau_LT       = 0.01;

save DATA_HMMWV DATA_HMMWV