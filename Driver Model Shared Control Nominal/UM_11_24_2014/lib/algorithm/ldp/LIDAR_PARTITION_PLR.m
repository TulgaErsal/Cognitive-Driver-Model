function [RGP, FML, DEADEND] = LIDAR_PARTITION_PLR(IPT, LIMG, INFO, SIM)

%% remove unreachable sectors
INFO1           = LIDAR_DP_RMURSEC(IPT, LIMG, INFO, SIM);
RGP.INFO(1).I	= INFO1;

if INFO1.ACTIVE == true
    PRINT_SEC_SEQ(INFO1, SIM);
end

%% shift sectors to upper left or right corner
INFO2           = LIDAR_DP_SHIFT(IPT, LIMG, INFO1, SIM);
RGP.INFO(2).I 	= INFO2;

if INFO2.ACTIVE == true
    PRINT_SEC_SEQ(INFO2, SIM);
end

%% get problem information
[PBM, DEADEND]	= LIDAR_DP_PBMINFO(IPT, INFO2, SIM);
RGP.PBM         = PBM;

if DEADEND == true
    FML.FML_CNT = 0;
    return;
end

%% sector sequence
SEQ             = LIDAR_DP_SECSEQ(IPT, INFO2, PBM, SIM);
RGP.SEQ         = SEQ;

%% OCP formulation
FML             = LIDAR_DP_OCPFML(IPT, SEQ, SIM);

