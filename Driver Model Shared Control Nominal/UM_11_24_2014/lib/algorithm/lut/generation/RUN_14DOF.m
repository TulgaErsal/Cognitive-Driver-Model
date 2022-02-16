function [minFZ, INPUT, OUTPUT] = RUN_14DOF(U_INIT, SA_MAG)

% inputs
load DATA_HMMWV.mat

SR_MAX      = 10*pi/180;
TT          = SA_MAG/SR_MAX;

if SA_MAG ~= 0
    CMD_TM	= [0, 0.5,  0.5 + TT, 3.5 + TT, 3.5 + 3*TT, 6.5 + 3*TT,  6.5 + 4*TT,  8 + 4*TT];
    CMD_SA 	= [0, 0,    SA_MAG,   SA_MAG,   - SA_MAG,   - SA_MAG,    0,           0];
else
    CMD_TM	= [0, 8];
    CMD_SA  = [0, 0];
end

CMD_UX      = U_INIT*ones(size(CMD_TM));

T_TOTAL     = CMD_TM(end);
CMD_SAFL    = CMD_SA;
CMD_SAFR    = CMD_SA;
CMD_SARL    = zeros(size(CMD_TM));
CMD_SARR    = zeros(size(CMD_TM));

KVEL        = 100;

% initial consitions    
STATES_INIT          = zeros(1,32);
STATES_INIT(3)       = DATA_HMMWV.HG;
STATES_INIT(6)       = pi/2;
STATES_INIT(7)       = U_INIT;
STATES_INIT(17:20)   = DATA_HMMWV.XT_INIT;
STATES_INIT(21:24)   = DATA_HMMWV.XS_INIT;
STATES_INIT(25:28)   = U_INIT./DATA_HMMWV.ZT_INIT;

INPUT.DATA_HMMWV    = DATA_HMMWV;
INPUT.KVEL          = KVEL;
INPUT.T_TOTAL       = T_TOTAL;
INPUT.STATES_INIT   = STATES_INIT;
INPUT.CMD_TM        = CMD_TM;
INPUT.CMD_UX        = CMD_UX;
INPUT.CMD_SAFL      = CMD_SAFL;
INPUT.CMD_SAFR      = CMD_SAFR;
INPUT.CMD_SARL      = CMD_SARL;
INPUT.CMD_SARR      = CMD_SARR;

% =========================================================================
OUTPUT = SIM_14DoF(INPUT);
% =========================================================================

% outputs
% TIME    = OUTPUT.TIME;
% STATE   = OUTPUT.STATE;
% ACCEL   = OUTPUT.ACCEL;
% SLIP    = OUTPUT.SLIP;
FORCE   = OUTPUT.FORCE;
% SUSP    = OUTPUT.SUSP;
% TIRE    = OUTPUT.TIRE;
% COMMAND = OUTPUT.COMMAND;

FZFL = FORCE(:,9);
FZFR = FORCE(:,10);
FZRL = FORCE(:,11);
FZRR = FORCE(:,12);

FZFL(1) = FZFL(2);
FZFR(1) = FZFR(2);
FZRL(1) = FZRL(2);
FZRR(1) = FZRR(2);

minFZ = min([FZFL; FZFR; FZRL; FZRR]);
