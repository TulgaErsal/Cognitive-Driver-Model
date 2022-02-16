function [PARA, RUN, CMP, ERROR] = ALGORITHM_INIT(INPUT, OBS)

%% PARA: algorithm parameters

if isfield(INPUT, 'DLC')
    % double lane change scenario

    % * always run at constant speed
    INPUT.MODE              = ConstantSpeed;

    [PARA, ERROR]           = ALGORITHM_PARA(INPUT, OBS);

    % * modify parameters
    PARA.MINDIST_THLD       = 1.4;  %#THLD#
    PARA.DIST2GOAL_THLD     = 1;    %#THLD#

    % * indicator
    PARA.DLC                = true;
else
    [PARA, ERROR]           = ALGORITHM_PARA(INPUT, OBS);
end

% whether calculate the guess or not
% find the initial guess when the MODE is ConstantSpeed
if PARA.MODE == VariableSpeed || isfield(PARA, 'DLC')
    PARA.FIND_GUESS = false;
else
    PARA.FIND_GUESS = true;
end

%% Sensing Delay Initial Compensation

if PARA.SENSING_DELAY_EST ~= 0
    % Commands: maintain the speed and go straight
    RUN.T_TOTAL             = PARA.SENSING_DELAY_EST;
    RUN.CMD_TM            	= [0, RUN.T_TOTAL];
    RUN.CMD_SA              = [0, 0];
    RUN.CMD_UX            	= PARA.U_INIT * [1, 1];
    RUN.CMD_SR              = [0, 0]; 
    RUN.CMD_AX              = [0, 0]; 
else
    RUN = [];
end

%% Control Commands Initial Buffer

% assume %#ASSUME#
% TST.SA              = 0;
% TST.SR              = 0;
% TST.AX              = 0;

% command sequence saved for control delay compensation
% CMP: compensation
if PARA.CONTROL_DELAY_EST ~= 0
    CMP.CMD_TM            	= linspace(0, PARA.CONTROL_DELAY_EST, 100);
    CMP.CMD_SA              = zeros(size(CMP.CMD_TM)); 
    CMP.CMD_UX            	= PARA.U_INIT * ones(size(CMP.CMD_TM)); 
    CMP.CMD_SR              = zeros(size(CMP.CMD_TM));
    CMP.CMD_AX              = zeros(size(CMP.CMD_TM));
else
    CMP.CMD_TM              = 0;
    CMP.CMD_SA              = 0; 
    CMP.CMD_UX              = PARA.U_INIT; 
    CMP.CMD_SR              = 0;
    CMP.CMD_AX              = 0;
end