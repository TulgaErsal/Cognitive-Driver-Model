function [RESULT, GOAL_REACHED, AV_control,FAIL_test, DELAY, ERROR, PATH_data] = RUN_SIMULATION_SHARED_new(INPUT)


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
t_vector                        = [];
cogSA_sim                       = [];
cogSA_sim_delay                 = [];
L_old                           = 0;

t_mpc  = 1;  % counter for saving the dynamic path created from MPC code
t_path = 1; % counter for updating the path data
t_cog  = 1; % counter for new variable, for cognitive model loop
JAVA_started = false;
FAIL_sync    = false;

% time step is 1/198, calculate how time steps in delay
aprox_steps_in_delay = round(INPUT.CONTROL_DELAY_AV/(1/198));
start                = 0;

% LIDAR scanning angular resolution (deg)
ANGULAR_RES                     = 0.1; %#THLD#
INPUT.ANGULAR_RES               = ANGULAR_RES;

% counter for howe many times the models got out of sync
DELAY.CM_update = 0;

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
        
        if ~INPUT.static_cognitive
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
            [PUSH, CMP, LOG, SIM, DEAD_END, MPC_Telapsed, XXXXX, YYYYY] ...
                = MPC_VDCOAA_wrapper(PARA, OBS, CMP, LIO, SIM); %#ok<ASGLU>
            
            % save dynamic path data
            PATH_data.X{t_mpc} = XXXXX;
            PATH_data.Y{t_mpc} = YYYYY;
            
            te = toc(ts);
            formatSpec = '%8.2f \t\n';
            fprintf(SIM.f3id, formatSpec, te*1000);
            clear ts te
            
            %#UPDATE# 20141106
            GOAL_PASSED         = false;
            if SIM.RTG_IND >= 2 && PUSH.CMD_TM(end) < PARA.EXECUTION_TIME
                GOAL_PASSED     = true;
            end
            
            % %#UPDATE# 20141108: only for constant speed
            if DEAD_END == true  % Huck uncommented - 8/10/2015
                PUSH.CMD_TM     = [0, PARA.PLANNING_TIME];
                PUSH.CMD_SA     = sign(LOG.VCS.SA0)*[PARA.SA_MAX, PARA.SA_MAX];
                PUSH.CMD_UX     = PARA.U_INIT*[1, 1];
                PUSH.CMD_SR     = [0, 0];
                PUSH.CMD_AX     = [0, 0];
                PUSH.T_TOTAL    = PARA.PLANNING_TIME;
            else
                % delay the control of the AV model
                if INPUT.CONTROL_DELAY_AV  ~= 0   % if there are delays on the control of the AV mocdel
                    % currently model has a linspace for the time signal, so moving it
                    % forward in time is relatively trivial
                    if isempty(TIME_sim)
                        TIME_sim  = [TIME_sim, PUSH.CMD_TM];
                    else
                        if isfield(PUSH,'CMD_TM')
                            TIME_sim  = [TIME_sim, (TIME_sim(end) + PUSH.CMD_TM(2) + PUSH.CMD_TM)]; % the last time, plus a dt, plus the vector
                        end
                    end
                    
                    if isfield(PUSH,'CMD_SA')
                        AV_SA_sim = [AV_SA_sim, PUSH.CMD_SA];
                    end
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
                        if isfield(PUSH,'CMD_SA')
                            PUSH.CMD_SA(RR) = AV_SA_delay(n);
                        end
                        RR = RR + 1;
                    end
                end
                
            end
            
            %% Command Execution
            if SIM.DISPLAY == YES
                disp('# Simulated Vehicle Platform')
            end
        end
        % Create Texe loop
        flag = 1; % flag for this loop, can update path when it is 1
        for t_loop=0:0.05:(INPUT.EXECUTION_TIME-.05),
            if t_cog == 1 % Cognitive Model Initialization - only happens once at start of run
%                 global speedv
%                 speedv = TST.ST(end,7)
                actr_startup
%                 actr_startup_v2;
                % Check to see if cognitiveModel.firstRun is false.  If so, restart
                % cogntive model
                fprintf('Pausing to let the Cognative Model warm up!!\n')
                pause(5)
                fprintf('done pause');
                if (cognitiveModel.firstRun == false),
                    fprintf('The Model Restarted!\n')
                    cognitiveModel.restart();
                end;
                JAVA_started = true;
                
            end
            
            if flag == 1 && INPUT.dynamic_path  % do not update path during the for loop
                TEMP_X  = PATH_data.X(~cellfun('isempty', PATH_data.X));
                TEMP_Y  = PATH_data.Y(~cellfun('isempty', PATH_data.Y));
                L = length(TEMP_X);   % get the latest update for the path
                
                if ~isempty(TEMP_X) && ~isempty(TEMP_Y) && L > L_old
                    % is this is a new path
                    L_old = L;   % update the latest path index
                    
                    x = TEMP_X{L};
                    y = TEMP_Y{L};
                    z = zeros(size(y));
                    firstCol = (1:1:length(y))';
                    
                    if INPUT.param_path_update_freq && t_mpc > 5
                        if INPUT.param_path_update_freq
                            if (~rem((t_mpc-1),5) ||  t_mpc < 5)
                                update_path = 1;
                            else
                                update_path = 0;
                            end
                        end
                    else
                        update_path = 1; % don't not update the path based off off INPUT.param_path_update_freq ( it is not a factor )
                    end
                    
                    if update_path
                        PATH_data.COG_path.X{:,t_path} = x;  % save for later
                        PATH_data.COG_path.Y{:,t_path} = y;
                        
                        % temporary plot for the dynamic path
                        if INPUT.internal_plot
                            figure(1);
                            px=TST.ST(end,1);
                            py=0;
                            pz=TST.ST(end,2);
                            figure(1)
                            plot(x,y,'k','linewidth',3)
                            hold on
                            plot(px,pz,'r.','markersize',20)
                            hold on
                        end
                        % temporary plot for the dynamic path
                        
                        % delete any left over path data
                        check_exist = exist(INPUT.fname);
                        if check_exist == 2
                            delete(INPUT.fname);              % delete any left over info
                        end
                        
                        % update path data
                        createCognitivePath(INPUT.fname,firstCol,x',y',z');
                        
                        % update path counter variable and java boolean
                        t_path = t_path + 1;
                        
                        % if java has already started up, update the path
                        if JAVA_started
                            cognitiveModel.update_PATH();
                            fprintf('Updating Cognitive Path in Matlab 2 !\n')
                        end
                    end
                end
            end
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% UPDATE %%%%%%%%%%%%%%%%%%%%%%%
            % Compute/translate values from state vector
            % Model needs location, heading, and speed
            px=TST.ST(end,1);
            py=0;
            pz=TST.ST(end,2);
            hx=cos(TST.ST(end,6));
            hy=0;
            hz=sin(TST.ST(end,6));
            speed=TST.ST(end,7);
            
            % delay the sensing of the cognative model
            cogDelay=0;
            
            % Step: Send vehicle information to cognitive model
            cognitiveModel.setVehicleState(px,py,pz,hx,hy,hz,speed,cogDelay);
            
            % Step: Update cognitive model
            cognitiveModel.update();
%              pause(0.5);  % without this pause, the models get out of sync!
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% UPDATE %%%%%%%%%%%%%%%%%%%%%%%
            
            % temp position plot
            if INPUT.internal_plot
                plot(px,pz,'g.','markersize',20)
                %             axis equal
                hold on
                % plot the obstacles
                axis equal tight
                
              
%                 X_MIN = INPUT.VP_INIT(1);
%                 X_MAX = INPUT.VP_GOAL(1);
%                 Y_MIN = INPUT.VP_INIT(2);
%                 Y_MAX = INPUT.VP_GOAL(2);
                 
                %% Added by Hossein Nov. 18/2016
                X_MIN = min(INPUT.VP_INIT(1),INPUT.VP_GOAL(1)) ;
                X_MAX = max(INPUT.VP_INIT(1),INPUT.VP_GOAL(1));
                Y_MIN = min(INPUT.VP_INIT(2),INPUT.VP_GOAL(2));
                Y_MAX = max(INPUT.VP_INIT(2),INPUT.VP_GOAL(2));
                                
                axis([X_MIN-225, X_MAX+180, Y_MIN-10, Y_MAX+10])
                
                if ~isempty(INPUT.MAP.OBS(1).PTS)
                    for i = 1:length(INPUT.MAP.OBS)
                        patch(INPUT.MAP.OBS(i).PTS(:, 1), INPUT.MAP.OBS(i).PTS(:, 2), 'k')
                    end
                end
                hold on
                xlabel('x (m)')
                ylabel('y (m)')
                title('Cognitive Model')
                set(gca,'FontSize',12,'fontWeight','bold')
                set(findall(gcf,'type','text'),'FontSize',12,'fontWeight','bold')
                grid on
                axis equal
            end
            % temp position plot
%             
            % Compute time
            time            = (SIM.STEPCNT-1)*INPUT.EXECUTION_TIME+t_loop;
            time_actual     = time + 0.05;            % shift simulation time forward to matcvh where cognitive model time is
            cog_t           = cognitiveModel.getCogTime();
            
            % Check to make sure cognitive model is paused and Matlab
            % time is not ahead of cognitive model time'
            while (~cognitiveModel.getCogPause()) && abs(time_actual - cog_t) > (0.05 + 10*10^-3)
                pause(0.01);
                % if the cognitive model is paused, then it needs to be
                % pushed forward a time step to get it unpaused - this
                % basically resets the cognitive model in which case the
                % cognitive model will be acting on old information at
                % times - these are issues with co-simulation, try to sync
                % it up best you can
                time_actual = time + 0.05;
                cog_t = cognitiveModel.getCogTime();
                %                 cognitiveModel.update();
                DELAY.CM_update =  DELAY.CM_update + 1; % counter for how many times the cognitive modelk gets behind because it is still calculating and needs to be pushed forwards
                
                if  DELAY.CM_update > 10 && abs(time_actual - cog_t) > (0.05 + 10*10^-3) % tolerance for co-simulation sync
                    FAIL_sync = true;
                    break;
                end
            end;
            
            % Step: Get control inputs from cognitive model
            % Model provides steering angle and acceleration
            cognitiveControlSteer       = cognitiveModel.getControlSteer();
            cognitiveControlAcc         = cognitiveModel.getControlAcc();
            cognitiveControlBrake       = cognitiveModel.getControlBrake();
            
            % Cognitive steering angle needs to be translated
            cogSA                       = 0.0423*cognitiveControlSteer;
            cogSA=cogSA+0.125*(0.01*sin(2.0*pi*0.13*time+1.137)+0.005*sin(2.0*pi*0.47*time+0.875));
            %              for now eliminate
            
            % Cognitive acc/brake command needs to be translated
            % Acc/brake values range from 0 to 1 and represent fraction that
            % the accelerator or brake pedal is pushed down.
            % Currently fixed velocity only.  Needs to be updated when
            % newer code incorporating powertrain model is used
            cogUX                       = INPUT.U_INIT;
            
            if INPUT.useSharedControl
                % Compute threat
                % Threat is currently being computed as abs(slip angle)
                % Slip angle is being defined as -arctan(lateral
                % velocity/abs(longitudinal velocity))
                currentThreat               = abs(-atan2(TST.ST(end,8),abs(TST.ST(end,7))))*180/pi;
                
                % Compute shared control ratio K
                if currentThreat<sharedThreatLow,
                    sharedK=0;
                elseif currentThreat>sharedThreatHigh,
                    sharedK=1;
                elseif (currentThreat>=sharedThreatLow && currentThreat<=sharedThreatHigh)
                    sharedK=(currentThreat-sharedThreatLow)/(sharedThreatHigh-sharedThreatLow);
                end;
                
            else % check to make sure user is using cognitive model only here
                sharedK=0;
            end
            
            if ~INPUT.static_cognitive
                % Interpolate autonomous algorithm steering command
                autoSA=interp1(PUSH.CMD_TM,PUSH.CMD_SA,t_loop);
                
                % Interpolate autonomous algorithm speed command
                autoUX=interp1(PUSH.CMD_TM,PUSH.CMD_UX,t_loop);
            end
            AV_control(t_cog) = sharedK;
            
            % delay the control of the cognative model
            t_vector = 0:0.05:time;
            if INPUT.CONTROL_DELAY_cog == 0
                cogSA_push = cogSA;
                cogSA_sim(t_cog) = cogSA;
                cogSA_sim_delay(t_cog) = cogSA;
            else
                cogSA_sim(t_cog) = cogSA;
                if time < INPUT.CONTROL_DELAY_cog
                    cogSA_push = 0;
                    cogSA_sim_delay(t_cog) = 0;
                else
                    % find the simulation time that the control is delayed
                    % by
                    CD_time = time - INPUT.CONTROL_DELAY_cog;
                    if CD_time > max(t_vector)     % could happen in a rare case
                        CD_time = max(t_vector);   % saturate, so you do not try to interpolate out of range
                    end
                    cogSA_push = interp1(t_vector, cogSA_sim, CD_time);
                    cogSA_sim_delay(t_cog) = cogSA_push;
                end
            end
            
            % for now I am not saturating saved steering angles
            % check the steering angle ( in radians )
            
            SA_MAX = 7.359*pi/180;
            %SA_MAX = 3.359*pi/180; % rads
            SA_MIN = -SA_MAX;
            
            
            if isnan(cogSA_push) || isempty(cogSA_push)
                fprintf(' Bad steering command from the cognitive model!!\n')
                break;
            end
            
            if cogSA_push > SA_MAX
                cogSA_push = SA_MAX;
            end
            
            if cogSA_push < SA_MIN
                cogSA_push = SA_MIN;
            end
            
            
            if ~INPUT.static_cognitive 
                % Step:  Compute plant commands
                altSA=(1-sharedK)*cogSA_push + sharedK*autoSA;   
            else
                % Step:  Compute plant commands
                altSA=cogSA_push;
            end
            
            altUX= INPUT.U_INIT; % for now this is not blended
            
            % Step:  Setup plant commands
            altPUSH.CMD_TM=[0 .05];
            altPUSH.CMD_SA=[altSA altSA];
            altPUSH.CMD_UX=[altUX altUX];
            altPUSH.CMD_SR=[0 0];
            altPUSH.CMD_AX=[0 0];
            altPUSH.T_TOTAL=.05;
            
            % Step: Run vehicle model up to current time
            [PLANT, TAC, TST, EXE_Telapsed, ERROR_P] ...
                = RUN_PLANT_wrapper(SPEC, altPUSH, TAC, TST, SIM); %#ok<ASGLU>
            
            t_cog  = t_cog + 1;
            flag   = 0;  % now the flag is set to off
        end; % Cognitive loop
        
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
        
        if time > INPUT.time_max
            OUT_OF_TIME = true;
        else
            OUT_OF_TIME = false;
        end
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
        
        if ~INPUT.static_cognitive
            if HIT == true || LIFT == true || GOAL_PASSED == true || DEAD_END == true || OUT_OF_TIME == true || FAIL_sync == true
                ABNORMAL = true;
                break;
            end
        else
            if HIT == true || LIFT == true || OUT_OF_TIME == true || FAIL_sync == true
                ABNORMAL = true;
                break;
            end
        end
        
        t_mpc = t_mpc + 1;  % update mpc loop counter
        
    end
    
    %     % close all frames in the cognitive model
    %     cognitiveModel.close_FRAMES();
    
    % wrap-up the simulation
    RESULT                      = wrapup(TST, SIM, ABNORMAL);
    if ~INPUT.static_cognitive
        FAIL_test                   = [HIT, LIFT, GOAL_PASSED, DEAD_END, OUT_OF_TIME, FAIL_sync];
        DELAY.TIME_AV               = TIME_sim;
        DELAY.AV_SA                 = AV_SA_sim;
        DELAY.AV_SA_delay           = AV_SA_delay;
    else
        FAIL_test               = [HIT, LIFT, OUT_OF_TIME, FAIL_sync];
        PATH_data               = NaN;
    end
    DELAY.TIME_COG              = t_vector;
    DELAY.COG_SA                = cogSA_sim;
    DELAY.COG_SA_delay          = cogSA_sim_delay;  % empty without delays
    ERROR                       = false;
catch ERROR_S
    %     if  JAVA_started
    %         % close all frames in the cognitive model
    %         cognitiveModel.close_FRAMES();
    %     end
    errorPRINT(ERROR_S);
    fprintf('ERROR results saved as NaN for this run!!!\n')
    
    RESULT                    = NaN;
    GOAL_REACHED              = NaN;
    AV_control                = NaN;
    FAIL_test                 = NaN;
    DELAY                     = NaN;
    PATH_data                 = NaN;
    ERROR                     = true;
    
end