%Update inputs and simulate plant
% Create Texe loop
t_cog  = 1;
flag = 1; % flag for this loop, can update path when it is 1

time_flag = 1; % this flag is used for debugging purpose - adjust time actual if necessary

time_prev=0;

num_of_consecutive_drops=0; % For debugging purpose

% cog_t = 1; cog_t_old = 0;
for t_loop=0:0.05:(time_max-.05)
    if t_cog == 1 % Cognitive Model Initialization - only happens once at start of run
        actr_startup_v2;
        % Check to see if cognitiveModel.firstRun is false.  If so, restart
        % cogntive model
        fprintf('Pausing to let the Cognative Model warm up!!\n')
        pause(5)
        fprintf('done pause');
        if (cognitiveModel.firstRun == false)
            fprintf('The Model Restarted!\n')
            cognitiveModel.restart();
        end
        JAVA_started = true;
    end
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% UPDATE JAVA %%%%%%%%%%%%%%%%%%%%%%%
    % Compute/translate values from state vector
    % Model needs location, heading, and speed
    %     px=STATE(end,1)-STATE_PASS(:,1);
    px=STATE(end,1);
    py=0;
    pz=STATE(end,2);

    hy=0;
    hx=cos(STATE(end,6));
    hz=sin(STATE(end,6));
    speed=STATE(end,7);
    
    Line_ref_CD = [Ref(1:end,1), Ref(1:end,2)];
    
    % ---------- compute lane keeping error at current time ---------------
    Time_start_now = find(STATE(:,7)>=U_START,1);
    Ts = 1;
    
    Line_hum_CD = [STATE(Time_start_now:Ts:end,1), STATE(Time_start_now:Ts:end,2)];
    try
        [XY_now,Error_now_array]  = distance2curve(Line_ref_CD, Line_hum_CD);
    catch
        keyboard
    end
    Error_now=Error_now_array(end);
    
    if mean(Error_now_array)>sc_parameters.correction_switch_thres && px>=600
        correction_switch=1;
        correction_switch_time=time_prev;
    end

    % ------------------------- end ---------------------------------------
    
    % add autonomy torque
    tau_a_in=tau_a_out(end);
    st_a_in=st_sc_out(end);
    
 
    % End time
    p_f_l2 = Line_ref_CD(end-5,:);
    p_f = Line_ref_CD(end,:);
    slope = (p_f(2)-p_f_l2(2))/(p_f(1)-p_f_l2(1));
    tan_slope = atan(slope)+pi/2;
    endline = zeros(2201,2);
    dist2endline = zeros(2201,1);
    for a = 1:2201
        el = -11+(a-1)*0.01;
        endline(a,:) = [p_f(1,1)+el p_f(1,2)+tan(tan_slope)*el];
        dist2endline(a) = sqrt((px-endline(a,1))^2+(pz-endline(a,2))^2);
    end

    if (min(dist2endline)<1)
        time_max = t_loop+1;
    end
    

    cogDelay=delay;
    
    % Step: Send vehicle information to cognitive model
    cognitiveModel.setVehicleState(px,py,pz,hx,hy,hz,speed,cogDelay);
    
    % Step: Update cognitive model
    cognitiveModel.update();

    pause(0.1);  % without this pause, the models get out of sync!
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Check reach goal %%%%%%%%%%%%%%%%%%%%%%%
    if sqrt((VP_GOAL(1) - px)^2 + (VP_GOAL(2) - pz)^2) <= DIST2GOAL_THLD %#THLD#
        GOAL_REACHED  	= true;
        break;
    else
        GOAL_REACHED  	= false;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Check reach goal %%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% UPDATE PLANT %%%%%%%%%%%%%%%%%%%%%%%
    
    % Compute time
    time = TIME(end);
    % Compute time
    time_actual     = time + 0.05 - TIME_PASS;            % shift simulation time forward to match where cognitive model time is
    
    % --------------- Needed for MATLAB 2019b or later
    try
        time_count = 0;
        while time <= time_prev && time_count < 15
            set_param('VEHICLE_DYN_TRAIN','SimulationCommand','update')
            set_param('VEHICLE_DYN_TRAIN','SimulationCommand','continue')
            pause(0.01)
            time = TIME(end);
            time_actual     = time + 0.05 - TIME_PASS;
            time_count=time_count+1;
            if time_count >= 10
                pause(0.01)
                time = TIME(end);
                time_actual     = time + 0.05 - TIME_PASS;
            elseif time_count >= 12
%                 keyboard
                warning('Time is not synchronized. Retry attempts is over 12.')
            end
        end
        time_prev = time;
    catch
        time_prev = time;
    end
    % ----------------------------- end --------------------------------

    
    cog_t           = cognitiveModel.getCogTime();
    

    time_flag = 0;
    

    % Check to make sure cognitive model is paused and Matlab
    % time is not ahead of cognitive model time'
    CM_update = 0;
    while (~cognitiveModel.getCogPause()) && abs(time_actual - cog_t) > (0.05 + 10*10^-3)
        pause(0.01);
        % if the cognitive model is paused, then it needs to be
        % pushed forward a time step to get it unpaused - this
        % basically resets the cognitive model in which case the
        % cognitive model will be acting on old information at
        % times - these are issues with co-simulation, try to sync
        % it up best you can
        time_actual = time + 0.05-TIME_PASS;
        cog_t = cognitiveModel.getCogTime();
        %                 cognitiveModel.update();
        CM_update =  CM_update + 1; % counter for how many times the cognitive modelk gets behind because it is still calculating and needs to be pushed forwards
        
        if  CM_update > 10 && abs(time_actual - cog_t) > (0.05 + 10*10^-3) % tolerance for co-simulation sync
            FAIL_sync = true;
            break;
        end
    end
    
    % Step: Get control inputs from cognitive model
    % Model provides steering angle and acceleration
    cognitiveControlSteer       = cognitiveModel.getControlSteer();
    cognitiveControlAcc         = cognitiveModel.getControlAcc();
    cognitiveControlBrake       = cognitiveModel.getControlBrake();

    
    
    % Cognitive steering angle needs to be translated
    cogSA                       = 0.0423*cognitiveControlSteer;
    %cogSA=cogSA+0.125*(0.01*sin(2.0*pi*0.13*time+1.137)+0.005*sin(2.0*pi*0.47*time+0.875)); %????
    %              for now eliminate
    
    % Cognitive acc/brake command needs to be translated
    % Acc/brake values range from 0 to 1 and represent fraction that
    % the accelerator or brake pedal is pushed down.
    % Currently fixed velocity only.  Needs to be updated when
    % newer code incorporating powertrain model is used
    cogTH                       = cognitiveControlAcc;
    cogBR                       = cognitiveControlBrake;
    
    % Run MATLAB PLANT
    lth_c = length(TIME);
    CMD_UX(lth_c+1:end,1) = U_START*ones(T_LENGTH-lth_c,1);
    CMD_TH(lth_c+1:end,1) = cogTH*ones(T_LENGTH-lth_c,1);
    CMD_BR(lth_c+1:end,1) = cogBR*ones(T_LENGTH-lth_c,1);
    CMD_ST(lth_c+1:end,1) = cogSA*ones(T_LENGTH-lth_c,1);
    CMD_MODE(lth_c+1:end,1) = zeros(T_LENGTH-lth_c,1);% varying with JAVA
    Tstop(lth_c+1:end,1) = (time+0.05)*ones(T_LENGTH-lth_c,1);
    T_STOP_ALL = [T_STOP_ALL, Tstop(end)];
    
    hws.assignin('Tstop',eval('Tstop'))
    hws.assignin('CMD_TM',eval('CMD_TM'))
    hws.assignin('CMD_UX',eval('CMD_UX'))
    hws.assignin('CMD_TH',eval('CMD_TH'))
    hws.assignin('CMD_BR',eval('CMD_BR'))
    hws.assignin('CMD_ST',eval('CMD_ST'))
    hws.assignin('CMD_MODE',eval('CMD_MODE'))
    
    set_param('VEHICLE_DYN_TRAIN','SimulationCommand','update')
    set_param('VEHICLE_DYN_TRAIN','SimulationCommand','continue')
    pause(0.1);
    
    
    
    t_cog  = t_cog + 1;
    flag   = 0;  % now the flag is set to off
    
end % Cognitive loop

set_param('VEHICLE_DYN_TRAIN','SimulationCommand','stop')
%disp('finish one loop' )
