function LIF = LIDAR_FEATURE(IPT, LID, SIM)

%% ------------------------------------------------------------------------
IDX                 = 0;

%% re-orient the sensor data based on the estimated delays
LIDL                = LIDAR_DP_DELAY(IPT, LID);
LIF.LIDL            = LIDL;

%% add safty margin
LIMG                = LIDAR_DP_MARGIN(IPT, LIDL);
LIF.LIMG            = LIMG;

%% basic sector information and end points
INFO                = LIDAR_DP_SECINFO(IPT, LIMG, SIM);
INFO.ACTIVE         = true;

IDX                 = IDX + 1;
LIF.INFO(IDX).I     = INFO;

PRINT_SEC_SEQ(INFO, SIM);

%% merge obstacles of the same slope
% INFO                = LIDAR_DP_MGSECT1(IPT, LIMG, INFO, SIM);
% 
% IDX                 = IDX + 1;
% LIF.INFO(IDX).I     = INFO;
% 
% if INFO.ACTIVE == true
%     PRINT_SEC_SEQ(INFO, SIM);
% end

%% merge small obstacles to their adjacent sectors
INFO                = LIDAR_DP_MGSECT2(IPT, LIMG, INFO, SIM);

IDX                 = IDX + 1;
LIF.INFO(IDX).I     = INFO;

if INFO.ACTIVE == true
    PRINT_SEC_SEQ(INFO, SIM);
end

%% merge obstacles of the same slope
if INFO.ACTIVE == true
    INFO            = LIDAR_DP_MGSECT1(IPT, LIMG, INFO, SIM);
    
    IDX             = IDX + 1;
    LIF.INFO(IDX).I	= INFO;
    
    if INFO.ACTIVE == true
        PRINT_SEC_SEQ(INFO, SIM);
    end
end

%% ------------------------------------------------------------------------
PRINT_SEC_N_POLAR(INFO.SECINFO, INFO.EP_POLAR, SIM);
