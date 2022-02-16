function [SPEC, TST, TAC, PARA, RUN, OBS, CMP, SIM] = INITIALIZE_SIM_ADAMS(INPUT)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% copied from RUN_SIMULATION.m 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% error messages:
EM_SS	= 'Errors in simulation settings'; % simulation settings
EM_WR   = 'Inappropriate variable value'; % wrong range

% LIDAR scanning angular resolution (deg)
ANGULAR_RES             	= 0.1; %#THLD#
INPUT.ANGULAR_RES         	= ANGULAR_RES;

% Simulation Settings
[SIM, ERROR_I]              = SIM_SETTINGS(INPUT);

if ERROR_I == true
    error(EM_SS)
end

% System Initialization
[SPEC, TST, TAC, ERROR_S]   = SYSTEM_INIT(INPUT);

if ERROR_S == true
    error(EM_WR)
end

% Observer
clear OBS
OBS                         = OBSERVER(TST);

% Algorithm Initialization
[PARA, RUN, CMP, ERROR_A]   = ALGORITHM_INIT(INPUT, OBS);

if ERROR_A == true
    error(EM_WR)
end

% Step Counter
SIM.STEPCNT                 = 0;

SIM.RTG_IND                 = 0; %#UPDATE# 141106

SIM.OLD_CNT                 = 0; %#UPDATE# 141108

if SIM.FIG3 == YES
    figure(3)
    DISPLAY_NAVI_TASK(SPEC, SIM)
    axis equal
end

if SIM.FIG4 == YES
    figure(4)
    DISPLAY_NAVI_TASK(SPEC, SIM)
    axis equal
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%