function LIF = LIDAR_FEATURE_wrapper(IPT, LID, SIM)

if SIM.LOGS == YES
    fprintf(SIM.fid, '# LIDAR data feature extraction\n');
end

% =========================================================================
LIF_Tstart   	= tic;

LIF             = LIDAR_FEATURE(IPT, LID, SIM);

LIF.Telapsed  	= toc(LIF_Tstart);
% =========================================================================

if SIM.LOGS == YES
    formatSpec = '\t Elapsed time: %3.2f seconds \n';
    fprintf(SIM.fid, formatSpec, LIF.Telapsed);
    fprintf(SIM.fid, '\n');
end