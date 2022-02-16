function INFO_1 = LIDAR_DP_RMURSEC(IPT, LIMG, INFO, SIM)

ACTIVE              = false;

% inputs
SECINFO             = INFO.SECINFO;
END_PTS             = INFO.END_PTS;
EP_LOCAL            = INFO.EP_LOCAL;
EP_POLAR            = INFO.EP_POLAR;

ANGLE_MIN           = IPT.ANGLE_MIN;
ANGLE_MAX           = IPT.ANGLE_MAX;

NSEC                = size(SECINFO, 1);

% RM_CNT    = 0;
% RM_VEC    = zeros(1, NSEC);
% for i = 1:NSEC
%     if EP_POLAR(i, 2) < ANGLE_MIN || EP_POLAR(i, 1) > ANGLE_MAX
%         RM_CNT = RM_CNT + 1;
%         RM_VEC(RM_CNT) = i;
%     end
% end
% RM_VEC   	= RM_VEC(1:RM_CNT);

RM_VEC              = [];

IDX_MIN             = find(EP_POLAR(1:end-1, 2) < ANGLE_MIN);
if ~isempty(IDX_MIN)
    RM_VEC          = [RM_VEC, 1:IDX_MIN(end) ];
end

IDX_MAX             = find(EP_POLAR(:, 1) > ANGLE_MAX);
if ~isempty(IDX_MAX)
    RM_VEC          = [RM_VEC, IDX_MAX(1):NSEC ];
end

SECINFO(RM_VEC,:) 	= [];
END_PTS(RM_VEC,:) 	= [];
EP_LOCAL(RM_VEC,:) 	= [];
EP_POLAR(RM_VEC,:) 	= [];

if ~isempty(RM_VEC)
    ACTIVE         	= true;
end

INFO_1.SECINFO   	= SECINFO;
INFO_1.END_PTS    	= END_PTS;
INFO_1.EP_LOCAL   	= EP_LOCAL;
INFO_1.EP_POLAR  	= EP_POLAR;
INFO_1.ACTIVE     	= ACTIVE;

if ACTIVE == true
    if SIM.LOGS == YES
        fprintf(SIM.fid, '+ Remove unreachable sectors\n');
    end
    
    PRINT_SEC_N_POLAR(SECINFO, EP_POLAR, SIM);
    
    filename = mfilename;
    DEBUG_FIGURES(filename, IPT, LIMG, INFO_1)
end
