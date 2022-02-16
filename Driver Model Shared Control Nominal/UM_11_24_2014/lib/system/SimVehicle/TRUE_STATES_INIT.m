function TST = TRUE_STATES_INIT(SPEC)

% previous step final time
TST.TIME_PRE        = 0;

% previous step final states / current step initial states
TST.STATES_INIT     = SPEC.STATES_INIT;

% data log since the start of the simulation
TST.TM_SEQ        	= TST.TIME_PRE;         % time 
TST.ST_SEQ          = TST.STATES_INIT;      % states
TST.CM_SEQ          = zeros(1,5);           % commands
TST.FC_SEQ          = zeros(1,28);          % tire forces

TST.T_SEQ           = TST.TIME_PRE;         % time 
TST.X_SEQ           = TST.STATES_INIT(1);   % x-position
TST.Y_SEQ           = TST.STATES_INIT(2);   % y-position
TST.A_SEQ           = TST.STATES_INIT(6);   % yaw-angle

% data from the past execution step
TST.TM              = TST.TM_SEQ;           % time 
TST.ST              = TST.ST_SEQ;           % states
TST.CM              = TST.CM_SEQ;           % commands
TST.FC              = TST.FC_SEQ;           % tire forces

TST.SA              = TST.CM(end, 1);       % steering angle
TST.SR              = 0;                    % steering rate
TST.AX              = 0;                    % longitudinal acceleration
