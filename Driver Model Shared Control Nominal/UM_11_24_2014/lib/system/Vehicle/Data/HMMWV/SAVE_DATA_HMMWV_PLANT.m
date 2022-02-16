clear all; clc; close all;

% load original HMMWV data
load DATA_HMMWV_RAW.mat

DATA_HMMWV.g         	= DATA_HMMWV_RAW.g;                        % m/s^2
DATA_HMMWV.MU       	= DATA_HMMWV_RAW.UNSPRUNGMASS_MASS;        % kg
DATA_HMMWV.MS          	= DATA_HMMWV_RAW.SPRUNGMASS_MASS;          % kg
DATA_HMMWV.VEHICLEMASS	= DATA_HMMWV_RAW.VEHICLE_MASS;             % kg
% DATA_HMMWV.LA         = DATA_HMMWV_RAW.VEHICLE_LA;               % m
% DATA_HMMWV.LB       	= DATA_HMMWV_RAW.VEHICLE_LB;               % m
DATA_HMMWV.LA       	= 1.5675;                                   % m
DATA_HMMWV.LB       	= 1.7345;                                   % m
DATA_HMMWV.LC         	= DATA_HMMWV_RAW.VEHICLE_LC(1)*2;          % m
% DATA_HMMWV.IXX      	= DATA_HMMWV_RAW.SPRUNGMASS_IXX;           % kg-m^2
% DATA_HMMWV.IYY     	= DATA_HMMWV_RAW.SPRUNGMASS_IYY;           % kg-m^2
% DATA_HMMWV.IZZ      	= DATA_HMMWV_RAW.SPRUNGMASS_IZZ;           % kg-m^2
DATA_HMMWV.IXX      	= DATA_HMMWV_RAW.VEHICLE_IXX;              % kg-m^2
DATA_HMMWV.IYY      	= DATA_HMMWV_RAW.VEHICLE_IYY;              % kg-m^2
DATA_HMMWV.IZZ          = DATA_HMMWV_RAW.VEHICLE_IZZ;              % kg-m^2

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

% DATA_HMMWV.HRCF   	= 0.90;                                     % m
% DATA_HMMWV.HRCR      	= 0.85;                                     % m 
DATA_HMMWV.HRCF         = 0.95;                                     % m
DATA_HMMWV.HRCR         = 1.22;                                     % m

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

save DATA_HMMWV_PLANT DATA_HMMWV