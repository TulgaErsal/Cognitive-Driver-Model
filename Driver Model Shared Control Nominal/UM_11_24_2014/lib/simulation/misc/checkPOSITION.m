function ERROR = checkPOSITION(INPUT, field)

% check whether the field is specifies a feasible position or not

ERROR = false;

if ~isfield(INPUT, field)
    disp(['error: The field "', field, '" is required'])
    ERROR = true;
else
    Value = INPUT.(field);
    if ~isnumeric(Value) || length(Value) ~= 2
        disp(['error: ', field, ' should be a 1 x 2 array'])
        ERROR = true;
    else
        if isfield(INPUT, 'MAP')
            MAP = INPUT.MAP;
            if isfield(MAP, 'BDY') && isfield(MAP, 'OBS')
                X = Value(1);
                Y = Value(2);
                XV = MAP.BDY(:, 1);
                YV = MAP.BDY(:, 2);
                if inpolygon(X,Y,XV,YV) == false
                    disp(['error: ', field, ' should be inside the area specified by MAP.BDY'])
                    ERROR = true;
                else
                    if ~isempty(MAP.OBS(1).PTS)
                        for i = 1:length(MAP.OBS)
                            XV = MAP.OBS(i).PTS(:, 1);
                            YV = MAP.OBS(i).PTS(:, 2);
                            if inpolygon(X,Y,XV,YV) == true
                                disp(['error: ', field, ' should not be inside the areas specified by MAP.OBS'])
                                ERROR = true;
                            end
                        end
                    end
                end
            end
        end
    end
end