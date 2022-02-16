function [PUSH, CMP, LOG, SIM, DEAD_END, MPC_Telapsed, XXXXX, YYYYY] = MPC_VDCOAA_wrapper(PARA, OBS, CMP, LIO, SIM)

% error messages:
EM_DE   = 'The vehicle is facing a dead end.';      % dead end
EM_EC   = 'No execution commands are generated.';   % empty commands
EM_NC   = 'No execution commands are available!!!'; % no feasible commands
EM_UE   = 'Unexpected error found in MPC_VDCOAA.';  % unexpected error

PUSH    = [];
LOG     = [];
MPC_Telapsed = [];
XXXXX = [];
YYYYY = [];
%% Vehicle Current States

if SIM.DISPLAY == YES
    disp('# - Get sensor data for planning')
end

ts = tic;

% vehicle initial states for obstacle avoidance maneuver planning
VCS         = CURRENT_STATES(PARA, OBS, CMP, SIM);

LOG.VCS     = VCS;

%% Sensor Data 

% sensor data for obstacle avoidance manuever planning
LID         = LIDAR_DATA(LIO, PARA, OBS, SIM);

LOG.LID     = LID;

% check whether the vehicle is facing a dead end or not
DEAD_END  	= DEAD_END_CHECK(PARA, LID, SIM);

te = toc(ts);
formatSpec = '%8.2f \t ';
fprintf(SIM.f3id, formatSpec, te*1000);
clear ts te

if DEAD_END == true
    return;
end

% if DEAD_END == true
%     % facing a dead end: terminate
%     error(EM_DE)
% end

%%
try
    MPC_Tstart              = tic;
    
    [EXE, LOG, SIM, DEAD_END_T2, XXXXX, YYYYY]    = MPC_VDCOAA(PARA, VCS, LID, SIM, LOG);

    MPC_Telapsed            = toc(MPC_Tstart);
    
    if ~isempty(EXE)
        EXE.ADDI_TM         = OBS.TIME_PRE + PARA.CONTROL_DELAY_EST;
    end
    
    if DEAD_END_T2 == true
        SIM.OLD_CNT = SIM.OLD_CNT + 1;

        EXE = FEASIBLE_CMDS(PARA, VCS, SIM, EM_EC);
        
       	% Step index - Problem index - Termination Code - Run Time - Objective
        formatSpec = '%10.0f \t %10.0f \t %10.0f \t %8.2f \t %8.2f\n';
        fprintf(SIM.f2id, formatSpec, SIM.STEPCNT, -1, -200, -1, 100);
        
    elseif DEAD_END_T2 == false && ~isempty(EXE)
        SIM.OLD_CNT = 0;
        
        FIGURE_STEP_PLANNED(EXE, SIM);
        
    elseif DEAD_END_T2 == false && isempty(EXE)
        % no commands are generated because all OCPs are not solved exactly
      	error(EM_EC)
    end
    
    % % facing a dead end: terminate
    % if DEAD_END == true
    %     error(EM_DE)
    % end
    
catch ERROR_M
    errorPRINT(ERROR_M);

    % log the error message
    if SIM.LOGS == YES
        fprintf(SIM.fid, ['error: ',ERROR_M.message, '\n']);
        fprintf(SIM.fid, [ ERROR_M.stack(1).name,'.m - line ', ...
                           num2str(ERROR_M.stack(1).line), '\n' ]);
        fprintf(SIM.fid, '\n');
    end
    
    % Step index - Problem index - Termination Code - Run Time - Objective
    formatSpec = '%10.0f \t %10.0f \t %10.0f \t %8.2f \t %8.2f\n';
    fprintf(SIM.f2id, formatSpec, SIM.STEPCNT, -1, -200, -1, 100);
    
    if strcmp(ERROR_M.message, EM_EC)
        SIM.OLD_CNT = SIM.OLD_CNT + 1;
        
        EXE = FEASIBLE_CMDS(PARA, VCS, SIM, EM_EC);
    else
        % there are unexpected errors in MPC_VDCOAA
        % confirmation is required
        % error(EM_UE)
        
        % check the commands from previous step
        EXE = CHECK_OLD_CMDS(PARA, VCS, LID, SIM);
    end
    
    if isempty(EXE)
        if SIM.LOGS == YES
            fclose(SIM.fid);
            closePOPUP(SIM.fname);
        end
        error(EM_NC)
    end
end

% save the execution commands for potential use in next step
[~, IDX]        = min(abs(EXE.NAVI_TM - PARA.EXECUTION_TIME));
IDX             = IDX(end);
OLD_EXE.NAVI_TM = EXE.NAVI_TM(IDX:end) - EXE.NAVI_TM(IDX);
OLD_EXE.NAVI_UX = EXE.NAVI_UX(IDX:end);
OLD_EXE.NAVI_SA = EXE.NAVI_SA(IDX:end);
OLD_EXE.NAVI_SR = EXE.NAVI_SR(IDX:end);
OLD_EXE.NAVI_AX = EXE.NAVI_AX(IDX:end);
OLD_EXE.D_END   = EXE.D_END; 
save([ SIM.cmdfolder, '/OLD_EXE_', num2str(SIM.STEPCNT + 1), '.mat'], 'OLD_EXE')

%% Execution Horizon
PUSH    = EXECUTION_HORIZON(PARA, EXE);

%% Mimic Command Sequence
CMP     = CMD_SEQ_MIMIC(PUSH, CMP);

%%
LOG.EXE         = EXE;
LOG.OLD_EXE     = OLD_EXE;
