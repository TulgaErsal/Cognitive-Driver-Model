function OBS = OBSERVER(TST)

% state observer

% data from the past execution step
OBS.TM          = TST.TM;   % time
OBS.ST          = TST.ST;   % states
OBS.CM          = TST.CM;   % commands
OBS.FC          = TST.FC;   % tire forces

OBS.SA          = TST.SA;   % steering angle
OBS.SR          = TST.SR;   % steering rate
OBS.AX          = TST.AX;   % longitudinal acceleration

% previous step final time
OBS.TIME_PRE    = TST.TIME_PRE;

% previous step final states / current step initial states
OBS.STATES_INIT = TST.STATES_INIT;

OBS.X           = TST.STATES_INIT(1);
OBS.Y           = TST.STATES_INIT(2);
OBS.PSI         = TST.STATES_INIT(6);
OBS.U           = TST.STATES_INIT(7);
OBS.V           = TST.STATES_INIT(8);
OBS.R           = TST.STATES_INIT(12);

% data log since the start of the simulation
OBS.T_SEQ       = TST.T_SEQ;
OBS.X_SEQ       = TST.X_SEQ;
OBS.Y_SEQ       = TST.Y_SEQ;
OBS.A_SEQ       = TST.A_SEQ;

