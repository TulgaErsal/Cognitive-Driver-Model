function [LIO, LIO_Telapsed] = LIDAR_MODEL_wrapper(SPEC, TST, SIM)

% Obtain the LIDAR data used in this step

LIO_Tstart      = tic;
LI              = LIDAR_MODEL(SPEC, TST);

LIO.ANGLE       = LI.ANGLE;
LIO.RANGE       = LI.RANGE;
LIO.AR          = LI.AR;
LIO.LR          = LI.LR;
LIO.LI          = LI;

LIO_Telapsed    = toc(LIO_Tstart);

LI.PTS          = LIDAR_PTS(LI.VP, LI.HA, LI.ANGLE, LI.RANGE);

SIM.FIG1_LIDAR  = YES;
SIM.FIG2_LIDAR  = YES;
SIM.FIG3_LIDAR  = YES;
FIGURE_LIDAR(SIM, LI, SIM.C10(6,:));

if SIM.LOGS == YES
    fprintf(SIM.fid, '## Simulated LIDAR model\n');
    fprintf(SIM.fid, '\t Elapsed time: %3.2f s. \n\n', LIO_Telapsed);
end