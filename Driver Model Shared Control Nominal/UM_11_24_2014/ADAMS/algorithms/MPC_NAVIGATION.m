%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% copied from RUN_SIMULATION.m 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Step Initialization

% increase counter
SIM.STEPCNT             = SIM.STEPCNT + 1;

% close all figures currently open EXCEPT for those listed
cab(3,4,5,6,7,8);

% figure initialization
SIM                     = FIGURE_STEP_INIT_ADAMS(SPEC, TST, SIM);          % <--- different

% log initialization
SIM                  	= openLOG(SIM);

%% Simulated LIDAR Sensor (with possible delay)
if SIM.DISPLAY == YES
    disp('# Simulated LIDAR sensor')
end

% LIDAR_wrapper
[LIO, LIO_Telapsed]  	= LIDAR_MODEL_wrapper(SPEC, TST, SIM);
        
%% MPC-Based Obstacle Avoidance Algorithm
if SIM.DISPLAY == YES
    disp('# MPC-Based Obstacle Avoidance Algorithm')
end

formatSpec = '%10.0f \t ';
fprintf(SIM.f3id, formatSpec, SIM.STEPCNT);
ts = tic;

% MPC_Wrapper
[PUSH, CMP, LOG, SIM, DEAD_END, MPC_Telapsed] ...
                        = MPC_VDCOAA_wrapper(PARA, OBS, CMP, LIO, SIM);

te = toc(ts);
formatSpec = '%8.2f \t\n';
fprintf(SIM.f3id, formatSpec, te*1000);
clear ts te
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Command Execution
if SIM.DISPLAY == YES
    disp('# Simulated Vehicle Platform')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
