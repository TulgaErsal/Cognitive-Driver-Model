clear all; clc; close all;

% load original HMMWV data
load DATA_HMMWV_RAW.mat

DATA_HMMWV.g         	= DATA_HMMWV_RAW.g;                        % m/s^2
DATA_HMMWV.MU       	= DATA_HMMWV_RAW.UNSPRUNGMASS_MASS;        % kg
DATA_HMMWV.MS          	= DATA_HMMWV_RAW.SPRUNGMASS_MASS;          % kg
DATA_HMMWV.VEHICLEMASS	= DATA_HMMWV_RAW.VEHICLE_MASS;             % kg
DATA_HMMWV.LA           = DATA_HMMWV_RAW.VEHICLE_LA;               % m
DATA_HMMWV.LB       	= DATA_HMMWV_RAW.VEHICLE_LB;               % m
DATA_HMMWV.LC         	= DATA_HMMWV_RAW.VEHICLE_LC(1)*2;          % m
DATA_HMMWV.IXX      	= DATA_HMMWV_RAW.SPRUNGMASS_IXX;           % kg-m^2
DATA_HMMWV.IYY          = DATA_HMMWV_RAW.SPRUNGMASS_IYY;           % kg-m^2
DATA_HMMWV.IZZ      	= DATA_HMMWV_RAW.SPRUNGMASS_IZZ;           % kg-m^2

% suspension spring stifness
DATA_HMMWV.KS           = DATA_HMMWV_RAW.KS;                       % N/m
% Tire Stiffness
DATA_HMMWV.KT           = DATA_HMMWV_RAW.KT;                       % N/m
% Damper coefficient: nonlinear relationship
    % relative speed
CS.RS                   = DATA_HMMWV_RAW.CS.relative_speed;        % m/s
    % front damping force
CS.FDF                  = DATA_HMMWV_RAW.CS.front_damping_force;   % N
    % rear damping force
CS.FDR                  = DATA_HMMWV_RAW.CS.rear_damping_force;    % N

% figure(1)
% plot(CS.RS, CS.FDF, 'k')
% 
% figure(2)
% plot(CS.RS, CS.FDR, 'k')

DATA_HMMWV.CS.RS    	= linspace(CS.RS(1), CS.RS(end), 100);
DATA_HMMWV.CS.FDF    	= interp1f(CS.RS, CS.FDF, DATA_HMMWV.CS.RS, 'pchip');
DATA_HMMWV.CS.FDR    	= interp1f(CS.RS, CS.FDR, DATA_HMMWV.CS.RS, 'pchip');

DATA_HMMWV.CS.RS_INIT   = DATA_HMMWV.CS.RS(1);
DATA_HMMWV.CS.RS_SLOPE  = (length(DATA_HMMWV.CS.RS) - 1)/(DATA_HMMWV.CS.RS(end) - DATA_HMMWV.CS.RS(1));

% figure(1)
% hold on;
% plot(DATA_HMMWV.CS.RS, DATA_HMMWV.CS.FDF, 'r')
% 
% figure(2)
% hold on;
% plot(DATA_HMMWV.CS.RS, DATA_HMMWV.CS.FDR, 'r')

% maximum power
DATA_HMMWV.MAXPOWER   	= DATA_HMMWV_RAW.MAXPOWER;                 % W
% wheel rotation inertia
DATA_HMMWV.IW       	= DATA_HMMWV_RAW.IW;                       % kg-m^2
% nominal tire radius
DATA_HMMWV.RW       	= DATA_HMMWV_RAW.RW;                       % m

DATA_HMMWV.HRCF         = 0.90;                                     % m
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

save DATA_HMMWV_PLANT DATA_HMMWV