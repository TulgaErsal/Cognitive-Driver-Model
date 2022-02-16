function errorPRINT(ERROR)

disp(['error: ',ERROR.message])

for i = 1:length(ERROR.stack)
    disp([ ERROR.stack(i).name,'.m - line ', num2str(ERROR.stack(i).line)])
end