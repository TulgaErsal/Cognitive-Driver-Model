function ERROR = checkINPUT(INPUT)

% validate user inputs

% disp('* check user inputs ......')

ERROR = false;

% MAP
if ~isfield(INPUT, 'MAP')
    disp('error: The field "MAP" is required')
    ERROR = true;
else
    MAP = INPUT.MAP;
    if ~isfield(MAP, 'BDY')
        disp('error: MAP should be a structure variable with the field "BDY".')
        ERROR = true;
    end

    if ~isfield(MAP, 'OBS')
        disp('error: MAP should be a structure variable with the field "OBS".')
        ERROR = true;
    end
end

% SENSING_DELAY
if checkNNGNUM(INPUT, 'SENSING_DELAY') == true
    ERROR = true;
end

% CONTROL_DELAY
if checkNNGNUM(INPUT, 'CONTROL_DELAY') == true
    ERROR = true;
end

% LASER_RANGE
if checkNNGNUM(INPUT, 'LASER_RANGE') == true
    ERROR = true;
end

% VP_INIT
if checkPOSITION(INPUT, 'VP_INIT') == true
    ERROR = true;
end

% HA_INIT
if checkANGLE(INPUT, 'HA_INIT') == true
    ERROR = true;
end

% VP_GOAL
if checkPOSITION(INPUT, 'VP_GOAL') == true
    ERROR = true;
end

% HA_GOAL
if isfield(INPUT, 'HA_GOAL') && ~isempty(INPUT.HA_GOAL)
    Value = INPUT.HA_GOAL;
    if ~isnumeric(Value) || length(Value)> 1 || Value > 2*pi || Value < - 2*pi
        disp('error: HA_GOAL should be a number within [-2*pi, 2*pi]')
        ERROR = true;
    end
end

% U_INIT
if checkNNGNUM(INPUT, 'U_INIT') == true
    ERROR = true;
end

% MODE
if ~isfield(INPUT, 'MODE')
    disp('error: The field "MODE" is required')
    ERROR = true;
else
    Value = INPUT.MODE;
    if Value ~= ConstantSpeed && Value ~= VariableSpeed
        disp('error: MODE should be either "ConstantSpeed" or "VariableSpeed"')
        ERROR = true;
    else
        if Value == VariableSpeed
            disp('error: only "ConstantSpeed" mode is available in this release.')
        end
    end
end

% U_MIN
if isfield(INPUT, 'MODE') && (INPUT.MODE == VariableSpeed)
    if checkNNGNUM(INPUT, 'U_MIN') == true
        ERROR = true;
    end
end

% EXECUTION_TIME
if checkNNGNUM(INPUT, 'EXECUTION_TIME') == true
    ERROR = true;
end

% PLANNING_TIME
if checkNNGNUM(INPUT, 'PLANNING_TIME') == true
    ERROR = true;
end

% SENSING_DELAY_EST
if checkNNGNUM(INPUT, 'SENSING_DELAY_EST') == true
    ERROR = true;
end

% CONTROL_DELAY_EST
if checkNNGNUM(INPUT, 'CONTROL_DELAY_EST') == true
    ERROR = true;
end

% disp('* completed')