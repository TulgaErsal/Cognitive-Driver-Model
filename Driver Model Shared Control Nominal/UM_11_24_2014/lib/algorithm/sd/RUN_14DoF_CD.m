function [STATES_INIT, SA_INIT, SR_INIT, AX_INIT] ...
            = RUN_14DoF_CD(PARA, OBS, CMP)
        
% vehicle parameters
INPUT.DATA_HMMWV    = PARA.DATA_HMMWV_14DoF;

% speed controller
INPUT.KVEL          = PARA.KVEL;

% initial states: provides feedback
INPUT.STATES_INIT   = OBS.STATES_INIT;

% run the vehicle for t_{dc} sec
INPUT.T_TOTAL       = PARA.CONTROL_DELAY_EST;

% commands
INPUT.CMD_TM     	= [CMP.CMD_TM, CMP.CMD_TM(end) + 0.1];
INPUT.CMD_UX     	= [CMP.CMD_UX, CMP.CMD_UX(end)];
INPUT.CMD_SA        = [CMP.CMD_SA, CMP.CMD_SA(end)];
INPUT.CMD_SR        = [CMP.CMD_SR, CMP.CMD_SR(end)];
INPUT.CMD_AX        = [CMP.CMD_AX, CMP.CMD_AX(end)];

INPUT               = CMD_MONO(INPUT);
INPUT.CMD_SAFL      = INPUT.CMD_SA;
INPUT.CMD_SAFR      = INPUT.CMD_SA;
INPUT.CMD_SARL      = zeros(size(INPUT.CMD_TM));
INPUT.CMD_SARR      = zeros(size(INPUT.CMD_TM));

% run simulation
OUTPUT              = SIM_14DoF(INPUT);

% outputs
TIME                = OUTPUT.TIME;
STATE               = OUTPUT.STATE;
COMMAND             = OUTPUT.COMMAND;
COMMAND(1, :)       = COMMAND(2,:);

STATES_INIT         = STATE(end, :);
SA_INIT             = COMMAND(end, 1);
SR_INIT             = interp1f(INPUT.CMD_TM, INPUT.CMD_SR, TIME(end), 'linear');
AX_INIT             = interp1f(INPUT.CMD_TM, INPUT.CMD_AX, TIME(end), 'linear');