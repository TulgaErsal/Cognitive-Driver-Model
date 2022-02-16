function OUTPUT = SIM_3DoF(INPUT)

if      strcmp(INPUT.TIRE_MODEL, 'LINEAR')      && strcmp(INPUT.LOAD_TRANSFER, 'NO')
    [TIME, STATE] = ode45(@(t, x) VEHICLE_3DoF_FZ0_LT(t,x,INPUT),[0, INPUT.T_TOTAL],INPUT.STATES_INIT,INPUT);
    FCN = @VEHICLE_3DoF_FZ0_LT;
elseif  strcmp(INPUT.TIRE_MODEL, 'NONLINEAR')   && strcmp(INPUT.LOAD_TRANSFER, 'NO')
    [TIME, STATE] = ode45(@(t, x) VEHICLE_3DoF_FZ0_NLT(t,x,INPUT),[0, INPUT.T_TOTAL],INPUT.STATES_INIT,INPUT);
    FCN = @VEHICLE_3DoF_FZ0_NLT;
elseif	strcmp(INPUT.TIRE_MODEL, 'LINEAR')      && strcmp(INPUT.LOAD_TRANSFER, 'YES')
    [TIME, STATE] = ode45(@(t, x) VEHICLE_3DoF_FZ_LT(t,x,INPUT),[0, INPUT.T_TOTAL],INPUT.STATES_INIT,INPUT);
    FCN = @VEHICLE_3DoF_FZ_LT;
elseif  strcmp(INPUT.TIRE_MODEL, 'NONLINEAR')   && strcmp(INPUT.LOAD_TRANSFER, 'YES')
    [TIME, STATE] = ode45(@(t, x) VEHICLE_3DoF_FZ_NLT(t,x,INPUT),[0, INPUT.T_TOTAL],INPUT.STATES_INIT,INPUT);
    FCN = @VEHICLE_3DoF_FZ_NLT;
end

N       = length(TIME);
ACCEL   = zeros(N, 6);
ALPHAF 	= zeros(N, 1);
ALPHAR 	= zeros(N, 1);
FYF     = zeros(N, 1);
FYR     = zeros(N, 1);
FZF     = zeros(N, 1);
FZR     = zeros(N, 1);
for i = 1:length(TIME)
    [ACCEL(i,:),ALPHAF(i), ALPHAR(i), FYF(i), FYR(i), FZF(i), FZR(i)] = feval(FCN, TIME(i), STATE(i,:),INPUT);
end

OUTPUT.TIME     = TIME;
OUTPUT.STATE    = STATE;
OUTPUT.ACCEL    = ACCEL;
OUTPUT.ALPHAF   = ALPHAF;
OUTPUT.ALPHAR   = ALPHAR;
OUTPUT.FYF      = FYF;
OUTPUT.FYR      = FYR;
OUTPUT.FZF      = FZF;
OUTPUT.FZR      = FZR;