% VESIM_init.m
% Editted on Nov.6th, 2014
% This is the initialization file. 
% It calls parameters for engine and drivetrain.

% clc					% clear console
% clear all;			% Initialize workspace
% close all;			% Close graphic windows

%simulation;			% Simulation constants
driver_par;			% Driver parameters
engine_par;			% Engine parameters
engine_torque;      % Engine torque from rpm and of fuel mass flow per cycle - 2D lookup table
%f_cor;				% Correction of f_m_inj based on boost and RPM - 2D lookup table
%f_cor_p0;			% Correction of f_m_inj based on boost and pressure - 2D lookup table
fuel_min;			% Base fuel map - 1D lookup table
%icp;                % Injection control pressure - 2D lookup table
%rpm_icp_boost;      % Intake manifold boost from rpm and icp - 2D lookup table
differential_par;   % Differential parameters
brake_par;          % Brake parameters

% % internet_par;       %Internet parameters

Vehicle_Parameters;

% ftp75=load('ftp75.dat'); %Load FMTV driving cycle
% road=load('road.dat');%Load FMTV slope
% road(:,2)=0;
g_motor_eff=1;
gr_motor=0;

% Td = 0.001; % Sampling Frequency

disp('Engine,drivetrain,cruise controller,brake parameters loaded.')
% Save all parameters in a single struct named DATA_VESIM_CC_BRAKE
DATA_VESIM_CC_BRAKE = ws2struct();
save DATA_VESIM_CC_BRAKE.mat DATA_VESIM_CC_BRAKE
