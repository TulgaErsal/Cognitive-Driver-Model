function [FML, LOG] = LIDAR_PARTITION_CVX(IPT, INFO, SIM)

%% create log file
CVX.LOGS            = SIM.LOGS;

if CVX.LOGS == YES
    CVXlog_fnm      = [SIM.cvxfolder, '/CVX_', num2str(SIM.STEPCNT), '_log.txt'];
    CVXlog_fid      = fopen(CVXlog_fnm, 'wt');

    CVX.log_fid     = CVXlog_fid;

    if POPUP == 1
        open(CVXlog_fnm)
    end

    fprintf(CVXlog_fid, '+ Convex Partition\n\n');
end

%% data from input
SECINFO             = INFO.SECINFO;
EPLOCAL             = INFO.EP_LOCAL;

% vertices specifing the safe region
PTS                 = [EPLOCAL(:, 1:2); EPLOCAL(end, 3:4)];

AREA_THLD           = 1.5; %#THLD#

SG_INFO(:, 1)       = (1:length(PTS) - 1);
SG_INFO(:, 2)       = (2:length(PTS));
SG_INFO(:, 3)       = SECINFO(:, 5);
SG_INFO(:, 4:5)     = NaN;

CVX.PTS             = PTS;
CVX.AREA            = polyarea(PTS(:, 1), PTS(:, 2));
CVX.AREA_THLD       = AREA_THLD;
CVX.SG_INFO         = SG_INFO;

LOG_IDX                 = 1;
LOG.CVX(LOG_IDX).LOG	= CVX;

%% remove vertices type 1
LOOP                = true;
while LOOP == true
    CVX             = CP_RMVERTICES_T1(CVX);
    
    LOG_IDX                 = LOG_IDX + 1;
    LOG.CVX(LOG_IDX).LOG	= CVX;
    
    if isempty(find(CVX.INFO(:, 4) <= AREA_THLD, 1))
        LOOP        = false;
    end
end

%% remove vertices type 2
LOOP                = true;
while LOOP == true
    CVX             = CP_RMVERTICES_T2(CVX);
    
    LOG_IDX                 = LOG_IDX + 1;
    LOG.CVX(LOG_IDX).LOG	= CVX;

    if isempty(find(CVX.INFO(:, 9) <= AREA_THLD, 1))
        LOOP        = false;
    end
end

%% convex partition
CVX.fn              = [SIM.cvxfolder, '/CVX_', num2str(SIM.STEPCNT)];
PBM                 = CP_PTTPOLY(CVX);

%% problem information
PBM                 = CP_PBMINFO(IPT, PBM);
LOG.PBM             = PBM;

%%
for i = 1:length(PBM.POLY_SEQ)
    NPolyi                  = length(PBM.POLY_SEQ{i});
    
    FML.OCP(i).Index        = - i;
    FML.OCP(i).Ancestor    	= 0;
    FML.OCP(i).Peer         = 0;
    FML.OCP(i).Priority    	= 1;
    
    FML.OCP(i).PhaseNum     = NPolyi;
    FML.OCP(i).SecType      = ones(1, NPolyi);
    FML.OCP(i).PolySeq     	= PBM.POLY_SEQ{i};
    FML.OCP(i).OPVertIDX    = PBM.VERT_IDX(i, :);
    FML.OCP(i).Indexes      = PBM.P_VERT_IX;
    FML.OCP(i).Points       = PBM.PTS;
    FML.OCP(i).VPTarget     = IPT.VP_GOAL_LOCAL;
    FML.OCP(i).HATarget     = IPT.HA_GOAL_LOCAL;
    
    if strcmp(PBM.TYPE, 'OP')
    	FML.OCP(i).OCPType      = 4;
        FML.OCP(i).SecType(end)	= -1;
    end
    
    if strcmp(PBM.TYPE, 'HP')
    	FML.OCP(i).OCPType      = 5;
        FML.OCP(i).SecType(end)	= 0;
    end
end

FML.FML_CNT = length(PBM.POLY_SEQ);

if SIM.LOGS == YES
    fclose(CVXlog_fid);

    if POPUP == 1
        Q = matlab.desktop.editor.findOpenDocument(CVXlog_fnm);
        Q.close();
    end
end