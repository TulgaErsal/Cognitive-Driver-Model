function [PLANT, TAC, TST, EXE_Telapsed, ERROR] = RUN_PLANT_wrapper(SPEC, PUSH, TAC, TST, SIM)

EXE_Tstart                  = tic;
[PLANT, TAC, TST, ERROR]   	= EXECUTE_CMDS(SPEC, PUSH, TAC, TST);
EXE_Telapsed                = toc(EXE_Tstart);

if ERROR == false
    FIGURE_STEP_ACTUAL(TST, SIM);
    FIGURE_SAVE(SIM);
end