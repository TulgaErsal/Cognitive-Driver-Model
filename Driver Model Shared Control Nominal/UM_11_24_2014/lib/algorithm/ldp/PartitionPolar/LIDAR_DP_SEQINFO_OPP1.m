function PHASE1 = LIDAR_DP_SEQINFO_OPP1(IPT, INFO, PBM, SEQ, SEQ_CNT)

SECINFO_T2              = INFO.SECINFO_T2;
EP_LOCAL                = INFO.EP_LOCAL;
EP_POLAR                = INFO.EP_POLAR;

ANGLE_MIN               = IPT.ANGLE_MIN;
ANGLE_MAX               = IPT.ANGLE_MAX;

CHECK_S                 = PBM.CHECK_S;
CHECK_E                 = PBM.CHECK_E;

FRN_SEC                 = PBM.FRN_SEC;

%#UPDATE# 1104
% change in LIDAR_DP_MGSECT2()
if FRN_SEC ~= 1
    FRN_SEC_m           = FRN_SEC - 1;
else
    FRN_SEC_m           = FRN_SEC;
end

TYPEm                   = SECINFO_T2(FRN_SEC_m, 3);
POLARm                  = EP_POLAR(SECINFO_T2(FRN_SEC_m, 2), :);
if TYPEm == 0 && POLARm(1) == POLARm(2)
    FRN_SEC_m           = FRN_SEC_m - 1;
end

if FRN_SEC ~= length(SECINFO_T2(:, 1))
    FRN_SEC_p           = FRN_SEC + 1;
else
    FRN_SEC_p           = FRN_SEC;
end

TYPEp                   = SECINFO_T2(FRN_SEC_p, 3);
POLARp                  = EP_POLAR(SECINFO_T2(FRN_SEC_p, 2), :);
if TYPEp == 0 && POLARp(1) == POLARp(2)
    FRN_SEC_p           = FRN_SEC_p + 1;
end

%% Angle Range

% TYPE 1: from low index to high index
if SEQ.TYPE == 1
    if CHECK_S == true
        % start boundary of sector (FRN_SEC_m1) is used
        PHASE1.ANGLE_S  = EP_POLAR(SECINFO_T2(FRN_SEC_m, 2), 1);
        PHASE1.ANGLE_E  = SEQ.EP_POLAR(end, 2);
    else
        PHASE1.ANGLE_S  = SEQ.EP_POLAR(1, 1);
        PHASE1.ANGLE_E  = SEQ.EP_POLAR(end, 2);
    end
end

% TYPE 2: from high index to low index
if SEQ.TYPE == 2 
    if CHECK_E == true
        % end boundary of sector (FRN_SEC_p1) is used
        PHASE1.ANGLE_S  = SEQ.EP_POLAR(end, 1);
        PHASE1.ANGLE_E  = EP_POLAR(SECINFO_T2(FRN_SEC_p, 2), 2);
    else
        PHASE1.ANGLE_S  = SEQ.EP_POLAR(end, 1);
        PHASE1.ANGLE_E  = SEQ.EP_POLAR(1, 2);
    end
end

if SEQ.TYPE == 3 
    if CHECK_S == true
        % start boundary of sector (FRN_SEC_m1) is used
        PHASE1.ANGLE_S  = EP_POLAR(SECINFO_T2(FRN_SEC_m, 2), 1);
        PHASE1.ANGLE_E  = SEQ.EP_POLAR(1, 2);
    elseif CHECK_E == true
        % end boundary of sector (FRN_SEC_p1) is used
        PHASE1.ANGLE_S  = SEQ.EP_POLAR(1, 1);
        PHASE1.ANGLE_E  = EP_POLAR(SECINFO_T2(FRN_SEC_p, 2), 2);
    else
        PHASE1.ANGLE_S  = SEQ.EP_POLAR(1, 1);
        PHASE1.ANGLE_E  = SEQ.EP_POLAR(1, 2);
    end
end

%% Radius

% note: EP_LOCAL should be adjusted to set the line segments within
% the range between ANGLE_MIN && ANGLE_MAX
EP_LOCAL_M                  = SEQ.EP_LOCAL;

% modify the line segment
% TYPE 1: from low index to high index
if SEQ.TYPE == 1 || SEQ.TYPE == 3
    % if start boundary is smaller than ANGLE_MIN
    % if the frontal sector is obstacle
    if SEQ.EP_POLAR(1, 1) < ANGLE_MIN && SEQ.SEC_TYPE(1) == 1
        PTS                 = linlinintersect_PTS(EP_LOCAL_M(1, :), ANGLE_MIN);
        EP_LOCAL_M(1,1:2)   = linlinintersect(PTS);
    end
    
    %#UPDATE# 1104
    if SEQ.EP_POLAR(end, 2) > ANGLE_MAX && SEQ.SEC_TYPE(end) == 1
        PTS                 = linlinintersect_PTS(EP_LOCAL_M(end, :), ANGLE_MAX);
        EP_LOCAL_M(end,3:4)	= linlinintersect(PTS);
    end
end

% modify the line segment
% TYPE 2: from high index to low index
if SEQ.TYPE == 2 || SEQ.TYPE == 3
    % if end boundary is larger than ANGLE_MAX
    % if the frontal sector is obstacle
    if SEQ.EP_POLAR(1, 2) > ANGLE_MAX && SEQ.SEC_TYPE(1) == 1
        PTS                 = linlinintersect_PTS(EP_LOCAL_M(1, :), ANGLE_MAX);
        EP_LOCAL_M(1,3:4)   = linlinintersect(PTS);
    end
    
    %#UPDATE# 1104
    if SEQ.EP_POLAR(end, 2) < ANGLE_MIN && SEQ.SEC_TYPE(end) == 1
        PTS                 = linlinintersect_PTS(EP_LOCAL_M(end, :), ANGLE_MIN);
        EP_LOCAL_M(end,1:2) = linlinintersect(PTS);
    end
end

% calculate all distances from the vehicle position to the line segments defining obstacles
DIST_CNT                    = 0;
DIST                        = [];

for j = 1:length(SEQ.SEC_TYPE)
    % if the sector is an obstacle
    if SEQ.SEC_TYPE(j) == 1
        DIST_CNT            = DIST_CNT + 1;
        DIST(DIST_CNT)      = point_lineseg_dist([0,0], EP_LOCAL_M(j, 1:2), EP_LOCAL_M(j, 3:4)); %#ok<AGROW>
    end
end

%% Sector
% TYPE 1: from low index to high index
% The start boundary of the frontal sector is close to 90 degree
% include sector from lower side

if (SEQ.TYPE == 1 || SEQ.TYPE == 3) && CHECK_S == true
    IDX                         = SECINFO_T2(FRN_SEC_m, 2);
    TYPE                        = SECINFO_T2(FRN_SEC_m, 3);
    
    EP_LOCAL_MS                 = EP_LOCAL(IDX, :);
    
    if  TYPE == 1 || TYPE == 0
        if EP_POLAR(IDX, 1) < ANGLE_MIN
            PTS                 = linlinintersect_PTS(EP_LOCAL_MS, ANGLE_MIN);    
            EP_LOCAL_MS(1:2)	= linlinintersect(PTS);
            PHASE1.ANGLE_S      = ANGLE_MIN;
        end

        DIST_CNT                = DIST_CNT + 1;
        DIST(DIST_CNT)          = point_lineseg_dist([0,0], EP_LOCAL_MS(1:2), EP_LOCAL_MS(3:4));
    end

    LOWSEC.R_THLD               = EP_POLAR(IDX, 4);
    LOWSEC.SEC_TYPE             = TYPE;
    % LOWSEC.EP_LOCAL           = EP_LOCAL(IDX, :);
    % LOWSEC.EP_POLAR           = EP_POLAR(IDX, :);
    LOWSEC.EP_LOCAL             = EP_LOCAL_MS;
    LOWSEC.EP_POLAR             = LIDAR_DP_EPPOLAR(EP_LOCAL_MS);
else
    LOWSEC                      = [];
end

% TYPE 2: from high index to low index
% The end boundary of the frontal sector is close to 90 degree
% include sector from higher side
if (SEQ.TYPE == 2 || SEQ.TYPE == 3) && CHECK_E == true
    IDX                         = SECINFO_T2(FRN_SEC_p, 2);
    TYPE                        = SECINFO_T2(FRN_SEC_p, 3);
    
    EP_LOCAL_MS                 = EP_LOCAL(IDX, :);
    
    if TYPE == 1 || TYPE == 0
        if EP_POLAR(IDX, 2) > ANGLE_MAX
            PTS                 = linlinintersect_PTS(EP_LOCAL_MS, ANGLE_MAX);        
            EP_LOCAL_MS(3:4)	= linlinintersect(PTS);
            PHASE1.ANGLE_E      = ANGLE_MAX;
        end

        DIST_CNT                = DIST_CNT + 1;
        DIST(DIST_CNT)          = point_lineseg_dist([0,0], EP_LOCAL_MS(1:2), EP_LOCAL_MS(3:4));
    end

    HIGHSEC.R_THLD              = EP_POLAR(IDX, 3);
    HIGHSEC.SEC_TYPE            = TYPE;
    % HIGHSEC.EP_LOCAL          = EP_LOCAL(IDX, :);
    % HIGHSEC.EP_POLAR          = EP_POLAR(IDX, :);
    HIGHSEC.EP_LOCAL            = EP_LOCAL_MS;
    HIGHSEC.EP_POLAR            = LIDAR_DP_EPPOLAR(EP_LOCAL_MS);
    
else
    HIGHSEC                     = [];
end

% if SEQ(i).ADDL.CHECK == true
%     DIST_CNT                  = DIST_CNT + 1;
%     DIST(DIST_CNT)            = norm(SEQ(i).ADDL.EP_LOCAL(:,5:6));
% end
% 
% if SEQ(i).ADDR.CHECK == true
%     DIST_CNT                  = DIST_CNT + 1;
%     DIST(DIST_CNT)            = norm(SEQ(i).ADDR.EP_LOCAL(:,5:6));
% end

%%
PHASE1.RADIUS           = min(DIST);

if ~isempty(LOWSEC)
    PHASE1.SEC          = LOWSEC;
elseif ~isempty(HIGHSEC)
    PHASE1.SEC          = HIGHSEC;
else
    PHASE1.SEC          = [];
end

if isempty(PHASE1.RADIUS)
    PHASE1              = [];
end

%% Display
if DEBUG == 1
    if ~isempty(PHASE1)
        figure
        hold on
        % axis equal
        title(['OCP #', num2str(SEQ_CNT), ' modification'])

        SEC_IDX = 1:length(SEQ.SEC_TYPE);
        SECTOR_PATCH(SEC_IDX, SEQ.SEC_TYPE, SEQ.EP_LOCAL)

        A_SEQ = linspace(PHASE1.ANGLE_S, PHASE1.ANGLE_E,100);
        patch([PHASE1.RADIUS*cos(A_SEQ), 0], [PHASE1.RADIUS*sin(A_SEQ), 0], [1,0,1]);

        hold off
    end
end

end

function PTS = linlinintersect_PTS(EP_LOCAL, ANGLE)
PTS = [ EP_LOCAL(1:2); 
        EP_LOCAL(3:4);
        EP_LOCAL(5:6);
        EP_LOCAL(5:6) + [cos(ANGLE), sin(ANGLE)]];
end