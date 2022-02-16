function [PBM, DEADEND] = LIDAR_DP_PBMINFO(IPT, INFO, SIM)

SECINFO_T2  = INFO.SECINFO_T2;
EP_POLAR    = INFO.EP_POLAR;

% ________________________________________________________________________
% ************************************************************************
% count number of openings and obstacles
% OP: opening
% HP: hypothetical opening
% OB: obstacle

PBM.IDX_OP  = find(SECINFO_T2(:,3) == -1);
PBM.CNT_OP  = length(PBM.IDX_OP);
PBM.IDX_HP  = find(SECINFO_T2(:,3) == 0);
PBM.CNT_HP  = length(PBM.IDX_HP);
PBM.IDX_OB  = find(SECINFO_T2(:,3) == 1);
PBM.CNT_OB  = length(PBM.IDX_OB);

% sectors shifted to upper left
PBM.IDX_LOP	= find(SECINFO_T2(:,5) == -1);
PBM.CNT_LOP = length(PBM.IDX_LOP);
PBM.IDX_LHP	= find(SECINFO_T2(:,5) == 0);
PBM.CNT_LHP = length(PBM.IDX_LHP);
PBM.IDX_LOB	= find(SECINFO_T2(:,5) == 1);
PBM.CNT_LOB = length(PBM.IDX_LOB);

% sectors shifted to upper right
PBM.IDX_ROP	= find(SECINFO_T2(:,7) == -1);
PBM.CNT_ROP = length(PBM.IDX_ROP);
PBM.IDX_RHP	= find(SECINFO_T2(:,7) == 0);
PBM.CNT_RHP = length(PBM.IDX_RHP);
PBM.IDX_ROB	= find(SECINFO_T2(:,7) == 1);
PBM.CNT_ROB = length(PBM.IDX_ROB);

% ************************************************************************
% log
if SIM.LOGS == YES
    fprintf(SIM.fid, '# Situation Information: \n');
    
    fprintf(SIM.fid, '\t --------------------\n');
    formatSpec = '\t * %d opening(s)\n';
    fprintf(SIM.fid, formatSpec, PBM.CNT_OP);
    formatSpec = '\t * %d hypothetical opening(s)\n';
    fprintf(SIM.fid, formatSpec, PBM.CNT_HP);
    formatSpec = '\t * %d obstacle(s)\n';
    fprintf(SIM.fid, formatSpec, PBM.CNT_OB);
    
    formatSpec = '\t * %d side opening(s)\n';
    fprintf(SIM.fid, formatSpec, PBM.CNT_ROP + PBM.CNT_LOP);
    formatSpec = '\t * %d side hypothetical opening(s)\n';
    fprintf(SIM.fid, formatSpec, PBM.CNT_RHP + PBM.CNT_LHP);
    formatSpec = '\t * %d side obstacle(s)\n';
    fprintf(SIM.fid, formatSpec, PBM.CNT_ROB + PBM.CNT_LOB);
    
    fprintf(SIM.fid, '\t --------------------\n');
    fprintf(SIM.fid, '\n');
end
% ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

% ________________________________________________________________________
% Terminate condition
if ((PBM.CNT_OP + PBM.CNT_HP + PBM.CNT_LHP + PBM.CNT_RHP)) == 0 && ...
    (IPT.DIST2GOAL >= IPT.LASER_RANGE)
    disp('* The vehicle is facing a dead end!')
    disp('* Simulation terminated!')
    DEADEND = true;
    return;
else
    DEADEND = false;
end
% ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

% ________________________________________________________________________
% ************************************************************************
% get index of frontal sector
for i = 1:size(SECINFO_T2, 1)
    SI = SECINFO_T2(i, 2);
    if EP_POLAR(SI,1) <= pi/2 && pi/2 <= EP_POLAR(SI,2)
        FRN_SEC = i;
        break;
    end
end

PBM.FRN_SEC = FRN_SEC;

% ************************************************************************
% check whether the start or end boundary of the frontal sector 
% is close to 90 degree or not.

% closeness threshold
CLN_THLD = 5*pi/180; %#THLD#

CHECK_S	= abs(EP_POLAR(SECINFO_T2(FRN_SEC, 2),1) - pi/2) < CLN_THLD;
CHECK_E	= abs(EP_POLAR(SECINFO_T2(FRN_SEC, 2),2) - pi/2) < CLN_THLD;

% note: CHECK_S and CHECK_E will not be both true
if CHECK_S == true && CHECK_E == true
    if abs(EP_POLAR(SECINFO_T2(FRN_SEC, 2),1) - pi/2) <= ...
       abs(EP_POLAR(SECINFO_T2(FRN_SEC, 2),2) - pi/2)
       CHECK_S = true;
       CHECK_E = false;
    else
       CHECK_S = false;
       CHECK_E = true;
    end
end

PBM.CHECK_S = CHECK_S;
PBM.CHECK_E = CHECK_E;

% ************************************************************************
% log
if SIM.LOGS == YES
    fprintf(SIM.fid, '\t --------------------\n');
    formatSpec = '\t * Frontal sector: S%d\n';
    fprintf(SIM.fid, formatSpec, SECINFO_T2(FRN_SEC, 2));
    if SECINFO_T2(FRN_SEC, 3) == 1
        fprintf(SIM.fid, '\t \t * Obstacle\n');
    elseif SECINFO_T2(FRN_SEC, 3) == -1
        fprintf(SIM.fid, '\t \t * Opening.\n');
    end
    if CHECK_S == true
        fprintf(SIM.fid, '\t \t * Start boundary close to 90\n');
    elseif CHECK_E == true
        fprintf(SIM.fid, '\t \t * End boundary close to 90\n');
    end
    fprintf(SIM.fid, '\t --------------------\n');
    fprintf(SIM.fid, '\n');
end
% ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯