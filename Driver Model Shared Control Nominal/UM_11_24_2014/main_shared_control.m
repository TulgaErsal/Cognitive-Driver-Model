% parameters for tuning
tuning_result=[];


temp_lakp = 40;
temp_thw1 = 0.8;
temp_lakp_dna = 0.25;
temp_lakp_na = 0.35;
m=1;
%--------------- 5 Selections end -------------------


% Shared Control Mode -- Tunable Control Parameters
sc_parameters=struct();
sc_parameters.autonomy_human_contain_gain = -0.33;
sc_parameters.kp_sc = 12.5;
sc_parameters.human_response_dead_zone = 0;
sc_parameters.human_autonomy_agreement_threshold = 0.00075;
sc_parameters.human_torque_max=4;
sc_parameters.human_contain_min=0.0045;
sc_parameters.bias_distance=0;
sc_parameters.correction_switch_thres=0.3;


% placeholder for future extensions
temp_longkp = 0.3;
temp_thw2 = 2.0;

tuning_result = [temp_lakp, temp_lakp_dna, temp_lakp_na, temp_thw1, temp_longkp, temp_thw2];


delay = 0;

[q,~]=size(tuning_result);
tuning_result=[tuning_result,zeros(q,4)];

while 1
    %%
    
    clc;
    clearvars -except m tuning_result delay sc_parameters;
    close all;
    
    steering_stable_threshold = 1;
    
    % placeholder
    throttle_delay_saturation = 1;
    brake_delay_saturation = 1;
    
    % set_param('VEHICLE_DYN_TRAIN','SimulationCommand','stop')
    T_STOP_ALL = [];
    
    runID = 1;
    ADD_PATHS;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % simulation setting
    TEST_NAME           = 'shared_control_nominal';
    TEST_NAME2          = '_data';
    %%
    TEST_NAME3          = 'shared_control_nominal';
    tempvar=num2str(m);
    TEST_NAME           =strcat(TEST_NAME,'num',tempvar);
    TEST_NAME3          =strcat(TEST_NAME3,'num',tempvar);
    %%
    plot_final          = 0;
    single_run          = 1;  % if you want to plot and you are just running the code a single time, set this to 1
    start_from          = 1;
    clear_old_results   = 1;  % deletes old rundata
    dynamic_path        = false;  % for cognitive model and shared control, the path that the cognitive model is following will be updated based of the MPC controller path - currently not putting in functionality to leave code the old way
    time_max            = 150; % max simulation time (s)

    
    lateral_kp          = tuning_result(m,1);
    lateral_kp_dna      = tuning_result(m,2);
    lateral_kp_na       = tuning_result(m,3);
    longitudinal_kp     = tuning_result(m,5);
    aggressivness_actr  = tuning_result(m,4);  % far eye point- aggressivness parameter, lower is more (1 is default in paper)
    aggressivness_actr2 = tuning_result(m,6);
    
    autonomy_human_contain_gain         =   sc_parameters.autonomy_human_contain_gain;
    kp_sc                               =   sc_parameters.kp_sc;
    human_response_dead_zone            =   sc_parameters.human_response_dead_zone;
    human_autonomy_agreement_threshold  =   sc_parameters.human_autonomy_agreement_threshold;
    human_torque_max                    =   sc_parameters.human_torque_max;
    human_contain_min                   =   sc_parameters.human_contain_min;
    
    Bias_Distance = sc_parameters.bias_distance;
    %%
    param_path_update_freq = true; % this switch that turns on and off functionality to update the path less frequently
    internal_plot          = true; % a debugging feature that creates a plot while the simulation is running
    speedmode=0;
    % navigaion specifications
    % only 'ConstantSpeed' mode is available in this release
    MODE                = 'ConstantSpeed';
    foldername          = ['hypothesis_results\', TEST_NAME];
    %%
    foldername2         = ['text_shared_control_nominal\', TEST_NAME3];
    try
        delete(foldername2);
    catch
        %         keyboard
    end
    %%
    % cognitive parameters
    useADAMS           = false;
    useCognitive       = true;  % if it is just running the cognitive model, there is no need to simulate MPC; can fix for speed
    useSharedControl   = false;  % could have three different functions that are ran inside the for loop
    useMPC             = false;
    
    if ~dynamic_path && useCognitive
        static_cognitive = true;
    else
        static_cognitive = false;
    end
    
    cd ..
    baseFolder = pwd;
    cd UM_11_24_2014;
    
    if dynamic_path % for dynamic paths
        fname = 'test';
        cogPathFile     = strcat(pwd,'\',fname);
    else % for static paths
        cogPathFile = strcat(baseFolder,'\Paths\cog_path_track_human_test_winter_2021_V3');
    end
    
    load('Track_human_test_winter_2021_V2.mat')
    vp_init_x=Ref(1,1);
    vp_init_y=Ref(1,2);
    VP_INIT = [vp_init_x, vp_init_y];
    vp_goal_x= Ref(end,1);
    vp_goal_y= Ref(end,2);
    VP_GOAL = [vp_goal_x, vp_goal_y];
    DIST2GOAL_THLD = 1;

    HA_INIT = 0.2637;
    U_START = 0.1;

    SENSING_DELAY = 0;
    CONTROL_DELAY = delay;

    
    SENSING_DELAY_cog = delay;
    CONTROL_DELAY_cog = delay;
    
    CONTROL_DELAY_AV = 0;
    
    adaptive_flag = 0; % 1: adaptive. 0: non-adaptive
    
    VEHICLE_DYN_TRAIN_INIT
    
    TIME_START                  = tic;
    
    if  (useCognitive == 1)  % shared control, assume different delays for cog model and AV model
        RUN_SIMULATION_SHARED_NEW_POWERTRAIN;
    end

    
    
    Time_start = find(STATE(:,7)>=U_START,1);
    Ts = 1;
    
    ms2mph          = 2.23694;
    
    Line_hum_CD = [ STATE(Time_start:Ts:end,1) STATE(Time_start:Ts:end,2)];
    Line_ref_CD = [ Ref(1:Ts:end,1) Ref(1:Ts:end,2)];

    p_f_l2 = Line_ref_CD(end-5,:);
    p_f = Line_ref_CD(end,:);
    slope = (p_f(2)-p_f_l2(2))/(p_f(1)-p_f_l2(1));
    tan_slope = atan(slope)+pi/2;
    endline = zeros(2001,2);
    for a = 1:2201
        el = -11+(a-1)*0.01;
        endline(a,:) = [p_f(1,1)+el p_f(1,2)+tan(tan_slope)*el];
    end
    [XYcoord,XYdist]  = distance2curve(endline, Line_hum_CD );
    Time_end     = find(XYdist(:,1)==min(XYdist(:,1)))-1;
    Time_total = Time_end/100;
    tuning_result(m,6)=Time_total;
    
    AvgSpeed = mean(STATE(Time_start:Ts:Time_start+Time_end,7))*ms2mph;
    tuning_result(m,5)=AvgSpeed;
    
    dist2endline = zeros(2201,1);
    for a = 1:2201
        dist2endline(a) = min(sqrt((Line_hum_CD(:,1)-endline(a,1)*ones( length(Line_hum_CD),1) ).^2+(Line_hum_CD(:,2)-endline(a,2)*ones(length(Line_hum_CD),1)).^2));
    end
    if (min(dist2endline)<1)
        isComplete = 1;
    else
        isComplete = 0;
    end
    
    Line_hum_CD = Line_hum_CD(1:Time_end,:);
    [XY,Error]  = distance2curve(Line_ref_CD, Line_hum_CD);
    try
        Error_norm  = mean(Error);
    catch
        keyboard
    end
    
    % Create a relaxed goal reaching criteria for poor performances
    GOAL_REACHED_RELAXED = 0;
    Relaxed_threshold = 3.6;
    Error_norm_threshold = 1;
    if Error_norm > Error_norm_threshold
        if sqrt((VP_GOAL(1) - XYcoord(Time_end,1))^2 + (VP_GOAL(2) - XYcoord(Time_end,2))^2) <= Relaxed_threshold
            GOAL_REACHED_RELAXED = 1;
        end
    end
    
    try
        % if isComplete && GOAL_REACHED
        if isComplete && (GOAL_REACHED || GOAL_REACHED_RELAXED)
            tuning_result(m,7)=Error_norm; % Lane keeping error
        else
            tuning_result(m,7)=100;
            Error_norm=100;
        end
    catch
        warning('There is a problem with the goal reached parameter')
    end
    %%Steering control effort
    Control_effort = sum(abs(JAVA_INPUT(Time_start:5:Time_start+Time_end,3)));
    tuning_result(m,8)=Control_effort;
    
    savename = strcat('MatResult/run',num2str(m),'.mat');
    try
        save(savename)
    catch
        try
            save(savename,'-regexp','^(?!(cognitiveModel|currentScenario)$).')
        catch
            keyboard
        end
    end
    if (m<1)
        m=m+1;
    else
        break
    end
    
end

%---- To calculate average lane keeping error starting from x=0 ---------

% display(Error_norm)

delete('parabolic_cur_waypoint.txt')
%%