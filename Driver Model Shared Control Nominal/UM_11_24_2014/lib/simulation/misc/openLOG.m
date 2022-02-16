function SIM = openLOG(SIM)

if SIM.LOGS == YES
    SIM.fname = [ SIM.logfolder, '/LOG_STEP', num2str(SIM.STEPCNT), '.txt' ];

    % open or create new file for writing in text mode.
    SIM.fid = fopen(SIM.fname, 'wt');

    % open the txt file in MATLAB editor
    if POPUP == 1
        open(SIM.fname);
    end

    % write contents
    fprintf(SIM.fid, '========== \n');
    fprintf(SIM.fid, 'STEP %d: \n\n', SIM.STEPCNT);
end