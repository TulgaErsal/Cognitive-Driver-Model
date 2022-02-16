function [RESULT, GOAL_REACHED, FAIL_test, DELAY, ERROR] = RUN_SIMULATION_MPC(INPUT)

% Run the simulation with provided settings
%
% * Autonomously navigate the vehicle through the specified obstacle field
% from the initial configuration to the goal configuration
%
% - Obstacle information is obtained using a planar LIDAR sensor.
% - Lumped sensing delay and lumped control delay are considered.

% INIT;

%% Misc
% ERROR_I: error in initialization
% ERROR_M: error in the obstacle avoidance algorithm MPC_VDCOAA
% ERROR_S: error in the simulation
% ERROR_P: error in plant simulation

% error messages:
EM_SS	= 'Errors in simulation settings'; % simulation settings
EM_WR   = 'Inappropriate variable value'; % wrong range

% result preallocation
RESULT                          = []; %#ok<NASGU>
AV_SA_sim                       = [];
TIME_sim                        = [];
AV_SA_delay                     = [];
% t_vector                        = [];
% cogSA_sim                       = [];
% cogSA_sim_delay                 = [];

t = 1; % counter for new variable

% time step is 1/198, calculate how time steps in delay
aprox_steps_in_delay = round(INPUT.CONTROL_DELAY_AV/(1/198));
start = 0;

% LIDAR scanning angular resolution (deg)
ANGULAR_RES                     = 0.1; %#THLD#
INPUT.ANGULAR_RES               = ANGULAR_RES;

% SIM:      simulation settings
% SPEC:     system specifications
% TST:      vehicle true states
% TAC:      actual sequence of commands sent to the actuator
% OBS:      observer outputs
% PARA:     algorithm parameters
% RUN:      commands ready to be executed by the plant
% CMP:      command sequences saved for control delay compensation
% PLANT:    plant output
% LIO:      original LIDAR data
% PUSH:     commands to be executed
% LOG:      algorithm log

%% the main structure is a try~catch block
try
    %% Simulation Settings
    [SIM, ERROR_I]              = SIM_SETTINGS(INPUT);
    
    if ERROR_I == true
        error(EM_SS)
    end
    
    %% System Initialization
    [SPEC, TST, TAC, ERROR_S]   = SYSTEM_INIT(INPUT);
    
    if ERROR_S == true
        error(EM_WR)
    end
    
    %% Observer
    clear OBS
    OBS                         = OBSERVER(TST);
    
    %% Algorithm Initialization
    [PARA, RUN, CMP, ERROR_A]   = ALGORITHM_INIT(INPUT, OBS);
    
    if ERROR_A == true
        error(EM_WR)
    end
    
    %% Step Counter
    SIM.STEPCNT                 = 0;
    
    SIM.RTG_IND                 = 0; %#UPDATE# 141106
    
    SIM.OLD_CNT                 = 0; %#UPDATE# 141108
    
    %% Start the while-loop
    GOAL_REACHED                = false;
    
    ABNORMAL                    = false;
    
    %% Figure Initialization
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
    
    %% Simulate the Plant
    [PLANT, TST]                = RUN_PLANT_INIT_wrapper(SPEC, RUN, TST, SIM); %#ok<ASGLU>
    
    if SIM.SAVEDATA == YES
        save([ SIM.logfolder,'/STEP_0.mat']);
    end
    
    %% Observer
    clear OBS
    OBS                         = OBSERVER(TST);
    
    %% Main Loop
    % loop continues when the specified goal is not reached
    while (GOAL_REACHED == false)
        
        %% Step Initialization
        
        % increase counter
        SIM.STEPCNT             = SIM.STEPCNT + 1;

        % figure initialization
        SIM                     = FIGURE_STEP_INIT(SPEC, TST, SIM);
        
        % log initialization
        SIM                  	= openLOG(SIM);
        
        %% Simulated LIDAR Sensor (with possible delay)
        if SIM.DISPLAY == YES
            disp('# Simulated LIDAR sensor')
        end
        
        % LIDAR_wrapper
        [LIO, LIO_Telapsed]  	= LIDAR_MODEL_wrapper(SPEC, TST, SIM); %#ok<NASGU>
        
        %% MPC-Based Obstacle Avoidance Algorithm
        if SIM.DISPLAY == YES
            disp('# MPC-Based Obstacle Avoidance Algorithm')
        end
        
        formatSpec = '%10.0f \t ';
        fprintf(SIM.f3id, formatSpec, SIM.STEPCNT);
        ts = tic;
        
        % MPC_Wrapper
        [PUSH, CMP, LOG, SIM, DEAD_END, MPC_Telapsed] ...
            = MPC_VDCOAA_wrapper(PARA, OBS, CMP, LIO, SIM); %#ok<ASGLU>
        
        te = toc(ts);
        formatSpec = '%8.2f \t\n';
        fprintf(SIM.f3id, formatSpec, te*1000);
        clear ts te
        
        %#UPDATE# 20141106
        GOAL_PASSED         = false;
        if SIM.RTG_IND >= 2 && PUSH.CMD_TM(end) < PARA.EXECUTION_TIME
            GOAL_PASSED     = true;
        end
        
        % delay the control of the AV model
        if INPUT.CONTROL_DELAY_AV  ~= 0   % if there are delays on the control of the AV mocdel
            % currently model has a linspace for the time signal, so moving it
            % forward in time is relatively trivial
            if isempty(TIME_sim)
                TIME_sim  = [TIME_sim, PUSH.CMD_TM];
            else
                TIME_sim  = [TIME_sim, (TIME_sim(end) + PUSH.CMD_TM(2) + PUSH.CMD_TM)]; % the last time, plus a dt, plus the vector
            end
            AV_SA_sim = [AV_SA_sim, PUSH.CMD_SA];
            
            % augment the delayed signal with new data
            RR = 1; % counter for the actual command index
            for n = start+1:start+length(PUSH.CMD_TM) % go through the entire time vector and shift the control signal for steering
                if TIME_sim(n) >  INPUT.CONTROL_DELAY_AV
                    if (n-aprox_steps_in_delay) < 1
                        AV_SA_delay(n) = 0;               % rare case
                    else
                        AV_SA_delay(n) = AV_SA_sim(n - aprox_steps_in_delay);
                    end
                else
                    AV_SA_delay(n) = 0;            % saturate the beginnning of the signal
                end
                start = start + 1;
                
                % actually modify the control signal
                PUSH.CMD_SA(RR) = AV_SA_delay(n);
                RR = RR + 1;
            end
        end
        
        % %#UPDATE# 20141108: only for constant speed
        if DEAD_END == true  % Huck uncommented - 8/10/2015
            PUSH.CMD_TM     = [0, PARA.PLANNING_TIME];
            PUSH.CMD_SA     = sign(LOG.VCS.SA0)*[PARA.SA_MAX, PARA.SA_MAX];
            PUSH.CMD_UX     = PARA.U_INIT*[1, 1];
            PUSH.CMD_SR     = [0, 0];
            PUSH.CMD_AX     = [0, 0];
            PUSH.T_TOTAL    = PARA.PLANNING_TIME;
        end
        
        %% Command Execution
        if SIM.DISPLAY == YES
            disp('# Simulated Vehicle Platform')
        end
     
        [PLANT, TAC, TST, EXE_Telapsed, ERROR_P] ...
            = RUN_PLANT_wrapper(SPEC, PUSH, TAC, TST, SIM); %#ok<ASGLU>
        
        if ERROR_P == true
            error('Unexpected error: no commands available for execution.')
        end
        
        %% Observer
        clear OBS
        OBS                 	= OBSERVER(TST);
        
        %% Forced Termination Check
        
        % terminate the simulation if the vehicle hits an obstacle
        HIT                 	= COLLISION_CHECK(SPEC, TST, SIM);
        
        LIFT                  	= CONTACT_CHECK(OBS, SIM);
        
        %% Task Completion Check
        
        GOAL_REACHED            = COMPLETION_CHECK(PARA, OBS, SIM);
        
        %#UPDATE# 20141019
        if GOAL_REACHED == true && PARA.CONTROL_DELAY_EST >0
            [PLANT_LAST, TAC, TST, EXE_LAST_Telapsed, ERROR_P] ...
                = RUN_PLANT_wrapper(SPEC, [], TAC, TST, SIM); %#ok<NASGU,ASGLU>
        end
        
        clear formatSpec ans
        if SIM.SAVEDATA == YES
            save([ SIM.logfolder,'/STEP_',num2str(SIM.STEPCNT),'.mat'])
        end
        closeLOG(SIM);
        
        if HIT == true || LIFT == true || GOAL_PASSED == true || DEAD_END == true
            ABNORMAL = true;
            break;
        end
        
        %% END
        
    end
    
    % wrap-up the simulation
    RESULT                      = wrapup(TST, SIM, ABNORMAL);
    FAIL_test                   = [HIT, LIFT, GOAL_PASSED, DEAD_END];
    
    DELAY.TIME_AV               = TIME_sim;
    DELAY.AV_SA                 = AV_SA_sim;
    DELAY.AV_SA_delay           = AV_SA_delay;
    
    ERROR                      = false;
catch ERROR_S
    
    %        error('An error occurred!')
    errorPRINT(ERROR_S);
    fprintf('ERROR results saved as NaN for this run!!!\n')
    RESULT                    = NaN;
    GOAL_REACHED              = NaN;
    FAIL_test                 = NaN;
    DELAY                     = NaN;
    ERROR                     = true;
   
    
end