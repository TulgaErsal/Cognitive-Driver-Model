%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% copied from EXECUTE_CMDS.m 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ~isempty(PUSH)
    CMD_TM          = PUSH.CMD_TM;
    CMD_SA          = PUSH.CMD_SA;
    CMD_UX          = PUSH.CMD_UX;
    CMD_SR          = PUSH.CMD_SR;
    CMD_AX          = PUSH.CMD_AX;
    T_TOTAL         = PUSH.T_TOTAL;
end

% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% add the commands along the prediction horizon to the sequence that will
% be sent to the actuator
if ~isempty(PUSH)
    TAC.CMD_TM      = [TAC.CMD_TM, CMD_TM + TAC.CMD_TM(end)];
    TAC.CMD_SA   	= [TAC.CMD_SA, CMD_SA];
    TAC.CMD_UX     	= [TAC.CMD_UX, CMD_UX];
    TAC.CMD_SR     	= [TAC.CMD_SR, CMD_SR];
    TAC.CMD_AX    	= [TAC.CMD_AX, CMD_AX];
end

RUN.CMD_TM          = [TAC.CMD_TM, TAC.CMD_TM(end) + 0.1];
RUN.CMD_SA          = [TAC.CMD_SA, TAC.CMD_SA(end)];
RUN.CMD_UX          = [TAC.CMD_UX, TAC.CMD_UX(end)];
RUN.CMD_SR          = [TAC.CMD_SR, TAC.CMD_SR(end)];
RUN.CMD_AX          = [TAC.CMD_AX, TAC.CMD_AX(end)];

if ~isempty(PUSH)
    if TAC.CMD_TM(end) < T_TOTAL
        RUN.T_TOTAL = TAC.CMD_TM(end);
    else
        RUN.T_TOTAL = T_TOTAL;
    end
else
    RUN.T_TOTAL     = TAC.CMD_TM(end);
end

RM_IDX             	= find(diff(RUN.CMD_TM)<=0) + 1;
RUN.CMD_TM(RM_IDX)	= [];
RUN.CMD_SA(RM_IDX)	= [];
RUN.CMD_UX(RM_IDX)	= [];
RUN.CMD_SR(RM_IDX)	= [];
RUN.CMD_AX(RM_IDX)	= [];
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% remove the commands that have been applied
if abs(RUN.T_TOTAL - TAC.CMD_TM(end)) > 0.05
    PRE.ACT_CMD_TM          = TAC.CMD_TM;
    PRE.ACT_CMD_SA          = TAC.CMD_SA;
    PRE.ACT_CMD_UX          = TAC.CMD_UX;
    PRE.ACT_CMD_SR          = TAC.CMD_SR;
    PRE.ACT_CMD_AX          = TAC.CMD_AX;
    
    RM_IDX                  = find(diff(PRE.ACT_CMD_TM)<=0) + 1;
    PRE.ACT_CMD_TM(RM_IDX)	= [];
    PRE.ACT_CMD_SA(RM_IDX)	= [];
    PRE.ACT_CMD_UX(RM_IDX)	= [];
    PRE.ACT_CMD_SR(RM_IDX)	= [];
    PRE.ACT_CMD_AX(RM_IDX)	= [];
    
    TAC.CMD_TM              = linspace(RUN.T_TOTAL, PRE.ACT_CMD_TM(end), 100);
    TAC.CMD_SA              = interp1f(PRE.ACT_CMD_TM, PRE.ACT_CMD_SA, TAC.CMD_TM, 'linear');
    TAC.CMD_UX              = interp1f(PRE.ACT_CMD_TM, PRE.ACT_CMD_UX, TAC.CMD_TM, 'linear');
    TAC.CMD_SR              = interp1f(PRE.ACT_CMD_TM, PRE.ACT_CMD_SR, TAC.CMD_TM, 'linear');
    TAC.CMD_AX              = interp1f(PRE.ACT_CMD_TM, PRE.ACT_CMD_AX, TAC.CMD_TM, 'linear');
    TAC.CMD_TM              = TAC.CMD_TM - RUN.T_TOTAL;
else
    TAC.CMD_TM              = 0;
    TAC.CMD_SA              = TAC.CMD_SA(end);
    TAC.CMD_UX              = TAC.CMD_UX(end);
    TAC.CMD_SR              = TAC.CMD_SR(end);
    TAC.CMD_AX              = TAC.CMD_AX(end);
end
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++