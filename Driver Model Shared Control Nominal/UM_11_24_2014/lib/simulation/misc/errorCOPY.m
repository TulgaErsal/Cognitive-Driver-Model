function errorCOPY(SIM, ERROR)

fname = [SIM.errorfolder, '/error.txt'];

if exist(fname, 'file') == 2
    fid = fopen(fname, 'at');
else
    fid = fopen(fname, 'wt');
end

if exist('SIM','var') == 1 && isfield(SIM, 'STEPCNT')
    fprintf(fid, 'STEP: %d\n', SIM.STEPCNT);
end

fprintf(fid, ['\t error: ',ERROR.message, '\n']);
fprintf(fid, [ '\t ', ERROR.stack(1).name,'.m - line ', ...
                   num2str(ERROR.stack(1).line), '\n\n' ]);
fclose(fid);

% copy the saved data from the previous step
if exist('SIM','var') == 1 ...
   && isfield(SIM, 'SAVEDATA') && SIM.SAVEDATA == YES ...
   && isfield(SIM, 'STEPCNT') && SIM.STEPCNT > 1
    source = [ SIM.logfolder, '/STEP_', num2str(SIM.STEPCNT - 1), '.mat' ];
    destination = [ SIM.errorfolder, '/STEP_', num2str(SIM.STEPCNT - 1), '.mat'];
    copyfile(source,destination)
end

% copy the log file
if exist('SIM','var') == 1 ...
   && isfield(SIM, 'LOGS') && SIM.LOGS == YES ...
   && isfield(SIM, 'STEPCNT') && SIM.STEPCNT > 1
    source = [ SIM.logfolder, '/LOG_STEP', num2str(SIM.STEPCNT), '.txt' ];
    destination = [ SIM.errorfolder, '/LOG_STEP', num2str(SIM.STEPCNT), '.txt'];
    copyfile(source,destination)
end