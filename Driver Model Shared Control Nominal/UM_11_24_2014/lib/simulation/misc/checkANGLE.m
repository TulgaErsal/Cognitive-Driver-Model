function ERROR = checkANGLE(INPUT, field)

% check whether the field is a number within [-2*pi, 2*pi] or not

ERROR = false;

if ~isfield(INPUT, field)
    disp(['error: The field "', field, '" is required'])
    ERROR = true;
else
    Value = INPUT.(field);
    if ~isnumeric(Value) || length(Value)> 1 || Value > 2*pi || Value < - 2*pi
        disp(['error: ', field, ' should be a number within [-2*pi, 2*pi]'])
        ERROR = true;
    end
end