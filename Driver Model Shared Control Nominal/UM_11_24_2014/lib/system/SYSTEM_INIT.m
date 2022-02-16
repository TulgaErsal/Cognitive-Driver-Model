function [SPEC, TST, TAC, ERROR] = SYSTEM_INIT(INPUT)

%% SPEC: system specifications

[SPEC, ERROR]   = SYSTEM_SPEC(INPUT);

%% TST: Vehicle true states

TST             = TRUE_STATES_INIT(SPEC);

%% TAC: Actuator Initialization

% Actual sequence of commands sent to the actuator
TAC             = TRUE_ACTUATOR_INIT(SPEC);