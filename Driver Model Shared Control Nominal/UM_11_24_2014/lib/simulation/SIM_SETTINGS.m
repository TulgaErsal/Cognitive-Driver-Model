function [SIM, ERROR] = SIM_SETTINGS(INPUT)

% Simulation Settings
% 
% * create folders for storing logs and simulation data
% * check user inputs
% * initialize figures
% * initialize log files

%% Create folders to store files
[SIM, ERROR]    = createFOLDERS(INPUT);

if ERROR == true
    return;
end

%% Check User Inputs
ERROR           = checkINPUT(INPUT);

if ERROR == true
    return;
end

%% Figure Initialization

SIM.FigPos      = FIGURE_POSITION();

%=======================%
% show all plots        %
SIM.SHOWALL   	= NO;  %
% save all plots        %
SIM.SAVEALL     = NO;   %
% show formulations     % 
SIM.SHOWFML  	= NO;  % 
% save formulations     % 
SIM.SAVEFML   	= NO;  %
%=======================%

if SIM.SHOWALL == NO
    SIM.SAVEALL = NO;
end

if SIM.SHOWFML == NO
    SIM.SAVEFML = NO;
end

SIM             = FIGURE_INIT(SIM);

%% .txt Log Initialization

%=======================%
SIM.LOGS        = NO; 	%
%=======================%

% file to record the basic information
SIM.f2name = [SIM.logfolder, '/LOG_OPT.txt'];
SIM.f2id = fopen(SIM.f2name,'wt');

if POPUP == 1
    open(SIM.f2name);
end

SIM.f3name = [SIM.logfolder, '/LOG_TIMING.txt'];
SIM.f3id = fopen(SIM.f3name,'wt');

if POPUP == 1
    open(SIM.f3name);
end

%% disp message on the MATLAB command window

%=======================%
SIM.DISPLAY     = NO; 	%
%=======================%

%% .mat Save Initialization

%=======================%
SIM.SAVEDATA	= NO; 	%
%=======================%

%% # Color
load COLOR_BASIC10.mat
SIM.C10         = C10;

load COLOR_JAPAN.mat
SIM.CG          = COLOR_GREEN;
