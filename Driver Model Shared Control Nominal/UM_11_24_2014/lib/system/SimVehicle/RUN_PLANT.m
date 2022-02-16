function [PLANT, TST] = RUN_PLANT(SPEC, RUN, TST)

% vehicle parameters
INPUT.DATA_HMMWV        = SPEC.DATA_HMMWV;

% speed controller
INPUT.KVEL              = SPEC.KVEL;

% initial states
INPUT.STATES_INIT       = TST.STATES_INIT;

% running time
INPUT.T_TOTAL           = RUN.T_TOTAL;

% control commands to be sent
INPUT.CMD_TM            = RUN.CMD_TM;
INPUT.CMD_UX            = RUN.CMD_UX;
INPUT.CMD_SA            = RUN.CMD_SA;
INPUT.CMD_SAFL          = INPUT.CMD_SA;
INPUT.CMD_SAFR          = INPUT.CMD_SA;
INPUT.CMD_SARL          = zeros(size(INPUT.CMD_TM));
INPUT.CMD_SARR          = zeros(size(INPUT.CMD_TM));
INPUT.CMD_SR            = RUN.CMD_SR;
INPUT.CMD_AX            = RUN.CMD_AX;

% make sure INPUT.CMD_TM is monotonically increasing
RM_IDX                  = find(diff(INPUT.CMD_TM)<=0) + 1;
INPUT.CMD_TM(RM_IDX)    = [];
INPUT.CMD_UX(RM_IDX)    = [];
INPUT.CMD_SA(RM_IDX)   	= [];
INPUT.CMD_SAFL(RM_IDX) 	= [];
INPUT.CMD_SAFR(RM_IDX) 	= [];
INPUT.CMD_SARL(RM_IDX)	= [];
INPUT.CMD_SARR(RM_IDX) 	= [];
INPUT.CMD_SR(RM_IDX)   	= [];
INPUT.CMD_AX(RM_IDX)   	= [];

% run simulation
OUTPUT                  = SIM_14DoF(INPUT);

TST                     = TRUE_STATES(TST, OUTPUT);

PLANT.INPUT             = INPUT;
PLANT.OUTPUT            = OUTPUT;
