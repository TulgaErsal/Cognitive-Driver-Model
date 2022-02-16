function OUTPUT = SIM_7DoF(INPUT)

[TIME, STATE] = ode23tb(@(t, x) VEHICLE_7DoF(t,x,INPUT),[0, INPUT.T_TOTAL],INPUT.STATES_INIT,INPUT);

N           = length(TIME);
ACCEL       = zeros(N, 13);
ALPHAFL 	= zeros(N, 1);
ALPHAFR 	= zeros(N, 1);
ALPHARL 	= zeros(N, 1);
ALPHARR 	= zeros(N, 1);
FXFL        = zeros(N, 1);
FXFR        = zeros(N, 1);
FXRL      	= zeros(N, 1);
FXRR        = zeros(N, 1);
FYFL        = zeros(N, 1);
FYFR        = zeros(N, 1);
FYRL      	= zeros(N, 1);
FYRR        = zeros(N, 1);
FZFL        = zeros(N, 1);
FZFR        = zeros(N, 1);
FZRL      	= zeros(N, 1);
FZRR        = zeros(N, 1);

for i = 1:length(TIME)
    [   ACCEL(i,:),...
        ALPHAFL(i), ALPHAFR(i), ALPHARL(i), ALPHARR(i),...
        FZFL(i), FZFR(i),FZRL(i), FZRR(i), ...
        FXFL(i), FXFR(i),FXRL(i), FXRR(i), ...
        FYFL(i), FYFR(i),FYRL(i), FYRR(i)] = VEHICLE_7DoF(TIME(i), STATE(i,:),INPUT);
end

OUTPUT.TIME         = TIME;
OUTPUT.STATE        = STATE;
OUTPUT.ACCEL        = ACCEL;
OUTPUT.ALPHAFL      = ALPHAFL;
OUTPUT.ALPHAFR      = ALPHAFR;
OUTPUT.ALPHARL      = ALPHARL;
OUTPUT.ALPHARR      = ALPHARR;
OUTPUT.FXFL         = FXFL;
OUTPUT.FXFR         = FXFR;
OUTPUT.FXRL         = FXRL;
OUTPUT.FXRR         = FXRR;
OUTPUT.FYFL         = FYFL;
OUTPUT.FYFR         = FYFR;
OUTPUT.FYRL         = FYRL;
OUTPUT.FYRR         = FYRR;
OUTPUT.FZFL         = FZFL;
OUTPUT.FZFR         = FZFR;
OUTPUT.FZRL         = FZRL;
OUTPUT.FZRR         = FZRR;