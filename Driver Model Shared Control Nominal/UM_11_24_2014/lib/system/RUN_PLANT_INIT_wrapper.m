function [PLANT, TST] = RUN_PLANT_INIT_wrapper(SPEC, RUN, TST, SIM)

if ~isempty(RUN)
    % If sensing delay exists, go straight until sensor data is available

    SIM             = FIGURE_STEP_INIT(SPEC, TST, SIM);

    [PLANT, TST]    = RUN_PLANT(SPEC, RUN, TST);

    FIGURE_STEP_ACTUAL(TST, SIM);
    FIGURE_SAVE(SIM);
else
    PLANT           = [];
end

