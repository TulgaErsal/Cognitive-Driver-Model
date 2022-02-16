function INPUT = CMD_MONO(INPUT)

% modify the sequence of commands to make them monotonic

RM_IDX                  = find(diff(INPUT.CMD_TM)<=0) + 1;

INPUT.CMD_TM(RM_IDX)    = [];
INPUT.CMD_UX(RM_IDX)    = [];
INPUT.CMD_SA(RM_IDX)   	= [];
INPUT.CMD_SR(RM_IDX)   	= [];
INPUT.CMD_AX(RM_IDX)   	= [];