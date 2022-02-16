function XTM = RUN_14DOF_XTM(PARA, VCS) 

% XTM: extreme

% vehicle parameters
INPUT.DATA_HMMWV    = PARA.DATA_HMMWV_14DoF;

% speed controller
INPUT.KVEL          = PARA.KVEL;

% initial states
INPUT.STATES_INIT   = VCS.STATES_INIT;
INPUT.STATES_INIT(1)= 0;
INPUT.STATES_INIT(2)= 0;
INPUT.STATES_INIT(6)= pi/2;

% total time
INPUT.T_TOTAL       = VCS.PLANNING_DIST / VCS.U0;

SA_MAX              = interp1f(PARA.LUT.VX_SEQ, PARA.LUT.SA_MAX_SEQ, VCS.U0, 'pchip');
SA_MIN              = - SA_MAX;

%% turn left
TT                  = abs((SA_MAX - VCS.SA0)/PARA.SR_SYS_MAX);

if TT == 0
    CMD_TM          = [0, INPUT.T_TOTAL + 1];
    CMD_UX          = [1, 1] * VCS.U0;
    CMD_SA          = [1, 1] * SA_MAX;
    CMD_SR          = [0, 0];
    CMD_AX          = [0, 0];
else
    CMD_TM_SP      	= [0, TT, TT + 0.001, TT + INPUT.T_TOTAL + 1];
    CMD_UX_SP      	= [1, 1, 1, 1] * VCS.U0;
    CMD_SA_SP      	= [VCS.SA0, SA_MAX, SA_MAX, SA_MAX];
    CMD_SR_SP     	= [PARA.SR_SYS_MAX, PARA.SR_SYS_MAX, 0, 0];
    CMD_AX_SP      	= [0, 0, 0, 0];
    
    CMD_TM          = linspace(0, INPUT.T_TOTAL + 1, 1000);
    CMD_UX          = interp1f(CMD_TM_SP, CMD_UX_SP, CMD_TM, 'linear');
    CMD_SA          = interp1f(CMD_TM_SP, CMD_SA_SP, CMD_TM, 'linear');
    CMD_SR          = interp1f(CMD_TM_SP, CMD_SR_SP, CMD_TM, 'linear');
    CMD_AX          = interp1f(CMD_TM_SP, CMD_AX_SP, CMD_TM, 'linear');
end

INPUT.CMD_TM        = CMD_TM;
INPUT.CMD_UX        = CMD_UX;
INPUT.CMD_SA        = CMD_SA;
INPUT.CMD_SAFL      = INPUT.CMD_SA;
INPUT.CMD_SAFR      = INPUT.CMD_SA;
INPUT.CMD_SARL      = zeros(size(INPUT.CMD_TM));
INPUT.CMD_SARR      = zeros(size(INPUT.CMD_TM));
INPUT.CMD_SR        = CMD_SR;
INPUT.CMD_AX        = CMD_AX;

% if DEBUG == 1
%     figure
%     hold on;
%     plot(INPUT.CMD_TM, INPUT.CMD_SA*180/pi, 'r', 'LineWidth', 2)
%     hold off;
% end

% run simulation
OUTPUT              = SIM_14DoF(INPUT);

% outputs
STATE               = OUTPUT.STATE;

XTM.L.XY            = STATE(:, 1:2);
XTM.L.AG            = atan2(STATE(end, 2), STATE(end, 1));

%% turn right
TT                  = abs((- SA_MAX - VCS.SA0)/PARA.SR_SYS_MIN);

if TT == 0
    CMD_TM          = [0, INPUT.T_TOTAL + 1];
    CMD_UX          = [1, 1] * VCS.U0;
    CMD_SA          = [1, 1] * SA_MIN;
    CMD_SR          = [0, 0];
    CMD_AX          = [0, 0];
else
    CMD_TM_SP      	= [0, TT, TT + 0.001, TT + INPUT.T_TOTAL + 1];
    CMD_UX_SP      	= [1, 1, 1, 1] * VCS.U0;
    CMD_SA_SP      	= [VCS.SA0, SA_MIN, SA_MIN, SA_MIN];
    CMD_SR_SP     	= [PARA.SR_SYS_MIN, PARA.SR_SYS_MIN, 0, 0];
    CMD_AX_SP      	= [0, 0, 0, 0];
    
    CMD_TM          = linspace(0, INPUT.T_TOTAL + 1, 1000);
    CMD_UX          = interp1f(CMD_TM_SP, CMD_UX_SP, CMD_TM, 'linear');
    CMD_SA          = interp1f(CMD_TM_SP, CMD_SA_SP, CMD_TM, 'linear');
    CMD_SR          = interp1f(CMD_TM_SP, CMD_SR_SP, CMD_TM, 'linear');
    CMD_AX          = interp1f(CMD_TM_SP, CMD_AX_SP, CMD_TM, 'linear');
end

INPUT.CMD_TM        = CMD_TM;
INPUT.CMD_UX        = CMD_UX;
INPUT.CMD_SA        = CMD_SA;
INPUT.CMD_SAFL      = INPUT.CMD_SA;
INPUT.CMD_SAFR      = INPUT.CMD_SA;
INPUT.CMD_SARL      = zeros(size(INPUT.CMD_TM));
INPUT.CMD_SARR      = zeros(size(INPUT.CMD_TM));
INPUT.CMD_SR        = CMD_SR;
INPUT.CMD_AX        = CMD_AX;

% if DEBUG == 1
%     hold on;
%     plot(INPUT.CMD_TM, INPUT.CMD_SA*180/pi, 'k', 'LineWidth', 2)
%     hold off;
% end

% run simulation
OUTPUT              = SIM_14DoF(INPUT);

% outputs
STATE               = OUTPUT.STATE;

XTM.R.XY            = STATE(:, 1:2);
XTM.R.AG            = atan2(STATE(end, 2), STATE(end, 1));