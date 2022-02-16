function SEQ = LIDAR_DP_SEQINFO_OP(INFO, PBM, SEQ_CNT)

SECINFO_T2      = INFO.SECINFO_T2;
END_PTS         = INFO.END_PTS;
EP_LOCAL        = INFO.EP_LOCAL;
EP_POLAR        = INFO.EP_POLAR;

FRN_SEC         = PBM.FRN_SEC;
IDX_OP          = PBM.IDX_OP(SEQ_CNT);

% ----------------------------------------------------------------
% type and sequence
if FRN_SEC < IDX_OP
    SEQ.TYPE    = 1;
    SEQ.SEQ     = FRN_SEC:1:IDX_OP;
elseif FRN_SEC > IDX_OP
    SEQ.TYPE    = 2;
    SEQ.SEQ     = FRN_SEC:-1:IDX_OP;
elseif FRN_SEC == IDX_OP
    SEQ.TYPE    = 3;
    SEQ.SEQ     = IDX_OP;
end

%#UPDATE# 1104
% change in LIDAR_DP_MGSECT2()
RM_IDX          = [];
for i = 1:length(SEQ.SEQ)
    TYPEi       = SECINFO_T2(SEQ.SEQ(i), 3);
    POLARi     	= EP_POLAR(SECINFO_T2(SEQ.SEQ(i), 2), :);
    if TYPEi == 0 && POLARi(1) == POLARi(2)
        RM_IDX  = [RM_IDX, i]; %#ok<AGROW>
    end
end
SEQ.SEQ(RM_IDX) = [];

% ----------------------------------------------------------------
% end points
SEQ.SEC_TYPE    = SECINFO_T2(SEQ.SEQ, 3);
SEQ.END_PTS     = END_PTS( SECINFO_T2(SEQ.SEQ, 2), 1:6);
SEQ.EP_LOCAL    = EP_LOCAL(SECINFO_T2(SEQ.SEQ, 2), 1:6);
SEQ.EP_POLAR    = EP_POLAR(SECINFO_T2(SEQ.SEQ, 2), 1:4);

% ----------------------------------------------------------------
% left sector
OP_SL           = SECINFO_T2(IDX_OP, 4);

if ~isnan(OP_SL)
    PT1         = END_PTS(OP_SL, 1:2);
    PT2         = END_PTS(OP_SL, 3:4);
    PT3         = END_PTS(OP_SL, 5:6);
    OP_SL_AREA  = triangle_area(PT1, PT2, PT3);
    OP_SL_RANGE = EP_POLAR(OP_SL, 2) - EP_POLAR(OP_SL, 1);
else
    OP_SL_AREA  = nan;
    OP_SL_RANGE = nan;
end

% ----------------------------------------------------------------
% right sector
OP_SR           = SECINFO_T2(IDX_OP, 6);
if ~isnan(OP_SR)
    PT1         = END_PTS(OP_SR, 1:2);
    PT2         = END_PTS(OP_SR, 3:4);
    PT3         = END_PTS(OP_SR, 5:6);
    OP_SR_AREA  = triangle_area(PT1, PT2, PT3);
    OP_SR_RANGE = EP_POLAR(OP_SR, 2) - EP_POLAR(OP_SR, 1);
else
    OP_SR_AREA  = nan;
    OP_SR_RANGE = nan;
end

% ----------------------------------------------------------------
SEQ.OP_SIDE     = [ OP_SL, OP_SL_AREA, OP_SL_RANGE, ...
                    OP_SR, OP_SR_AREA, OP_SR_RANGE ];

% threshold for checking whether the side sector is worth adding or not
POLY            = [EP_LOCAL(:, 1:2); EP_LOCAL(end, 3:4); [0, 0]];
TOTAL_AREA      = polyarea(POLY(:, 1), POLY(:, 2));
OP_AREA_THLD    = 0.05*TOTAL_AREA; %#THLD#
OP_RANGE_THLD   = 0.4*pi/180; %#THLD#

% ----------------------------------------------------------------
% left sector
if OP_SL_AREA >= OP_AREA_THLD && OP_SL_RANGE >= OP_RANGE_THLD
    ADD_LEFT    = true;
else
    ADD_LEFT    = false;
end

SEQ.ADDL.CHECK  = ADD_LEFT;

if ADD_LEFT == true
    SEQ.ADDL.SEC_TYPE   = - 1;
    SEQ.ADDL.END_PTS    = END_PTS( OP_SL, 1:6);
    SEQ.ADDL.EP_LOCAL   = EP_LOCAL(OP_SL, 1:6);
    SEQ.ADDL.EP_POLAR   = EP_POLAR(OP_SL, 1:4);
end

% ----------------------------------------------------------------
% right sector
if OP_SR_AREA >= OP_AREA_THLD && OP_SR_RANGE >= OP_RANGE_THLD
    ADD_RIGHT	= true;
else
    ADD_RIGHT	= false;
end

SEQ.ADDR.CHECK	= ADD_RIGHT;

if ADD_RIGHT == true
    SEQ.ADDR.SEC_TYPE   = - 1;
    SEQ.ADDR.END_PTS    = END_PTS( OP_SR, 1:6);
    SEQ.ADDR.EP_LOCAL   = EP_LOCAL(OP_SR, 1:6);
    SEQ.ADDR.EP_POLAR   = EP_POLAR(OP_SR, 1:4);
end

if DEBUG == 1
    % ------------------------------------------------------------
    figure
    hold on
    % axis equal
    title(['OCP #', num2str(SEQ_CNT)])
    SEC_IDX = 1:length(SEQ.SEC_TYPE);
    SECTOR_PATCH(SEC_IDX, SEQ.SEC_TYPE, SEQ.EP_LOCAL)
    hold off

    % ------------------------------------------------------------
    if SEQ.ADDL.CHECK == true
        figure
        hold on
        % axis equal
        title(['OCP #', num2str(SEQ_CNT), ' additional left sector'])
        SEC_IDX = 1:length(SEQ.SEC_TYPE);
        SECTOR_PATCH(SEC_IDX, SEQ.SEC_TYPE, SEQ.EP_LOCAL)
        SECTOR_PATCH(1, SEQ.ADDL.SEC_TYPE, SEQ.ADDL.EP_LOCAL)
        hold off
    end

    % ------------------------------------------------------------
    if SEQ.ADDR.CHECK == true
        figure
        hold on
        % axis equal
        title(['OCP #', num2str(SEQ_CNT), ' additional right sector'])
        SEC_IDX = 1:length(SEQ.SEC_TYPE);
        SECTOR_PATCH(SEC_IDX, SEQ.SEC_TYPE, SEQ.EP_LOCAL)
        SECTOR_PATCH(1, SEQ.ADDR.SEC_TYPE, SEQ.ADDR.EP_LOCAL)
        hold off
    end
end