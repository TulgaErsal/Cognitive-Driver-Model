function OUTPUT = SIM_5DoF(INPUT)

[TIME, STATE] = ode45(@(t, x) VEHICLE_5DoF(t,x,INPUT),[0, INPUT.T_TOTAL],INPUT.STATES_INIT,INPUT);

N       = length(TIME);
ACCEL   = zeros(N, 9);
ALPHAF 	= zeros(N, 1);
ALPHAR 	= zeros(N, 1);
FYF     = zeros(N, 1);
FYR     = zeros(N, 1);
FZF     = zeros(N, 1);
FZR     = zeros(N, 1);

for i = 1:length(TIME)
    [ACCEL(i,:),ALPHAF(i), ALPHAR(i), FYF(i), FYR(i), FZF(i), FZR(i)] = VEHICLE_5DoF(TIME(i), STATE(i,:),INPUT);
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