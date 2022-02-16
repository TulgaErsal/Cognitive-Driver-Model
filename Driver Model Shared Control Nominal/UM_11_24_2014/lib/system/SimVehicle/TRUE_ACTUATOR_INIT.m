function TAC = TRUE_ACTUATOR_INIT(SPEC)

U_INIT = SPEC.STATES_INIT(7);

% command sequence to be executed by the actuator
if SPEC.CONTROL_DELAY ~= 0
    TAC.CMD_TM	= linspace(0, SPEC.CONTROL_DELAY, 100);
    TAC.CMD_SA 	= zeros(size(TAC.CMD_TM)); 
    TAC.CMD_UX 	= U_INIT * ones(size(TAC.CMD_TM)); 
    TAC.CMD_SR 	= zeros(size(TAC.CMD_TM));
    TAC.CMD_AX 	= zeros(size(TAC.CMD_TM));
else
    TAC.CMD_TM  = 0;
    TAC.CMD_SA 	= 0; 
    TAC.CMD_UX 	= U_INIT; 
    TAC.CMD_SR 	= 0;
    TAC.CMD_AX 	= 0;
end