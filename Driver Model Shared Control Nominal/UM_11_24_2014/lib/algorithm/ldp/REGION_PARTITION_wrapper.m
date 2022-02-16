function [FML, FML_P, FML_C, RGP, DEADEND] = REGION_PARTITION_wrapper(IPT, LIMG, INFO, SIM)

% polar partition
[RGP, FML_P, DEADEND]	= LIDAR_PARTITION_PLR(IPT, LIMG, INFO, SIM);

if DEADEND == true
    FML_C               = [];
    FML                 = [];
    return;
end

% convex partition
if isfield(IPT, 'CVX')
    FML_C.FML_CNT       = 0;
    FML_C.OCP           = [];
else
    FML_C               = LIDAR_PARTITION_CVX(IPT, INFO, SIM);
end

FML.OCP_C               = FML_C.OCP;
FML.OCP_P               = FML_P.OCP;

% combine two partitions
CNT                     = 0;
if FML_C.FML_CNT ~= 0
    for i = 1:FML_C.FML_CNT
        CNT             = CNT + 1;
        FML.TYPE(CNT)   = 1;
        FML.INDEX(CNT)  = i;
    end
end

if FML_P.FML_CNT ~= 0
    for i = 1:FML_P.FML_CNT
        CNT             = CNT + 1;
        FML.TYPE(CNT)   = 2;
        FML.INDEX(CNT)  = i;
    end
end

FML.FML_CNT             = CNT;