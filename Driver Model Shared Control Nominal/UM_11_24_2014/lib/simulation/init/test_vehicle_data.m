function VI = test_vehicle_data()

% inputs
load DATA_HMMWV_14DoF.mat

U_INIT      = 20;

MS          = 1*pi/180;
T_TOTAL     = 2;
TS          = 0.01;

CMD_TM      = 0:TS:T_TOTAL;
TT          = round(MS/(10*pi/180)/TS)*TS;
CMD_TM_SEQ  = [0 TT T_TOTAL/2 T_TOTAL/2+2*TT T_TOTAL];
CMD_SA_SEQ 	= [0 MS MS -MS -MS];
CMD_SA      = interp1f(CMD_TM_SEQ, CMD_SA_SEQ, CMD_TM, 'linear');
CMD_UX      = linspace(U_INIT, 20, length(CMD_TM));
CMD_SAFL    = CMD_SA;
CMD_SAFR    = CMD_SA;
CMD_SARL    = zeros(size(CMD_TM));
CMD_SARR    = zeros(size(CMD_TM));

KVEL = 100;

% initial consitions    
STATES_INIT          = zeros(1,32);
STATES_INIT(3)       = DATA_HMMWV_14DoF.HG;
STATES_INIT(6)       = pi/2;
STATES_INIT(7)       = U_INIT;
STATES_INIT(17:20)   = DATA_HMMWV_14DoF.XT_INIT;
STATES_INIT(21:24)   = DATA_HMMWV_14DoF.XS_INIT;
STATES_INIT(25:28)   = U_INIT./DATA_HMMWV_14DoF.ZT_INIT;

VI.DATA_HMMWV    = DATA_HMMWV_14DoF;
VI.KVEL          = KVEL;
VI.T_TOTAL       = CMD_TM(end);
VI.STATES_INIT   = STATES_INIT;
VI.CMD_TM        = CMD_TM;
VI.CMD_UX        = CMD_UX;
VI.CMD_SAFL      = CMD_SAFL;
VI.CMD_SAFR      = CMD_SAFR;
VI.CMD_SARL      = CMD_SARL;
VI.CMD_SARR      = CMD_SARR;