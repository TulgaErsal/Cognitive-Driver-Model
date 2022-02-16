function CMP = CMD_SEQ_MIMIC(PUSH, CMP)

CMD_TM                    	= PUSH.CMD_TM;
CMD_SA                      = PUSH.CMD_SA;
CMD_UX                    	= PUSH.CMD_UX;
CMD_SR                      = PUSH.CMD_SR;
CMD_AX                      = PUSH.CMD_AX;
T_TOTAL                     = PUSH.T_TOTAL;

% maintain a command sequence for delay compensation

% add the commands along the prediction horizon to the sequence for control
% delay compensation
CMP.CMD_TM                  = [CMP.CMD_TM,  CMD_TM + CMP.CMD_TM(end)];
CMP.CMD_SA                  = [CMP.CMD_SA, CMD_SA];
CMP.CMD_UX                	= [CMP.CMD_UX,  CMD_UX];
CMP.CMD_SR                  = [CMP.CMD_SR, CMD_SR];
CMP.CMD_AX                  = [CMP.CMD_AX, CMD_AX];

% remove the commands that have been applied
if abs(T_TOTAL - CMP.CMD_TM(end)) > 0.05
    PRE.CMP_CMD_TM         	= CMP.CMD_TM;
    PRE.CMP_CMD_SA          = CMP.CMD_SA;
    PRE.CMP_CMD_UX        	= CMP.CMD_UX;
    PRE.CMP_CMD_SR          = CMP.CMD_SR;
    PRE.CMP_CMD_AX          = CMP.CMD_AX;

    RM_IDX                  = find(diff(PRE.CMP_CMD_TM)<=0) + 1;
    PRE.CMP_CMD_TM(RM_IDX)	= [];
    PRE.CMP_CMD_SA(RM_IDX)	= [];
    PRE.CMP_CMD_UX(RM_IDX)	= [];
    PRE.CMP_CMD_SR(RM_IDX)	= [];
    PRE.CMP_CMD_AX(RM_IDX)	= [];

    CMP.CMD_TM              = linspace(T_TOTAL, PRE.CMP_CMD_TM(end), 100);
    CMP.CMD_SA              = interp1f(PRE.CMP_CMD_TM, PRE.CMP_CMD_SA, CMP.CMD_TM, 'linear');
    CMP.CMD_UX              = interp1f(PRE.CMP_CMD_TM, PRE.CMP_CMD_UX, CMP.CMD_TM, 'linear');
    CMP.CMD_SR              = interp1f(PRE.CMP_CMD_TM, PRE.CMP_CMD_SR, CMP.CMD_TM, 'linear');
    CMP.CMD_AX              = interp1f(PRE.CMP_CMD_TM, PRE.CMP_CMD_AX, CMP.CMD_TM, 'linear');
    CMP.CMD_TM              = CMP.CMD_TM - T_TOTAL;
else
    CMP.CMD_TM              = 0;
    CMP.CMD_SA              = CMP.CMD_SA(end);
    CMP.CMD_UX              = CMP.CMD_UX(end);
    CMP.CMD_SR              = CMP.CMD_SR(end);
    CMP.CMD_AX              = CMP.CMD_AX(end);
end

