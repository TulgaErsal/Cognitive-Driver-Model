function ERROR = checkNNGNUM(INPUT, field)

% check whether the field is a non-negative number or not

ERROR = false;

if ~isfield(INPUT, field)
    disp(['error: The field "', field, '" is required'])
    ERROR = true;
else
    Value = INPUT.(field);
    if ~isnumeric(Value) || length(Value)> 1 || Value < 0
        disp(['error: ', field, ' should be a non-negative number'])
        ERROR = true;
    end
end