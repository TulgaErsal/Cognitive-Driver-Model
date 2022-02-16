disp('compiles c++ files')

cd(rootpath)

TOTAL_NUM   = 18;
CNT         = 0;

v = ver;

cd ([pwd,'/lib'])
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% =========================================================================
if any(strcmp('MATLAB Coder', {v.Name}))
    cd ([pwd,'/system/LIDAR'])
%         coder -build LIDAR_coder.prj
        CNT = CNT + 1;
        disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
    cd ../
    cd ../
else
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' skipped'])
end

% =========================================================================
cd ([pwd,'/geometry'])
    mex ([pwd,'/inpoly.c'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
    mex ([pwd,'/ScaleTime.c'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
cd ../

% =========================================================================
cd ([pwd,'/algorithm/sd/cpp'])
    mex([pwd, '/VEHICLE_3DoF_FZ_NLT.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
cd ../
cd ../
cd ../

% =========================================================================
cd ([pwd,'/algorithm/ldp/Clipper'])
    mex ([pwd,'/clipper.cpp'], [pwd,'/mexclipper.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
cd ../
cd ../
cd ../

% =========================================================================
cd ([pwd,'/algorithm/ldp/PartitionConvex/KeilSnoeyink'])
    mex ([pwd,'/ConvexPartition.cpp'], [pwd,'/polypartition.cpp'], [pwd,'/image.cpp'], [pwd,'/imageio.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
cd ../
cd ../
cd ../
cd ../

% =========================================================================
cd ([pwd,'/system/Tire/PAC2002/cpp'])
    mex([pwd, '/PAC2002.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
    mex([pwd, '/PAC2002_biased.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
    mex([pwd, '/PAC2002_TT.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
    mex([pwd, '/PAC2002_ST.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
cd ../
cd ../
cd ../
cd ../

% =========================================================================
cd ([pwd,'/algorithm/opt/OCP_FCN_PAC2002/cpp'])
    mex([pwd, '/FCN_PAC2002_FY0.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
    mex([pwd, '/FCN_PAC2002_FY.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
    mex([pwd, '/GRD_PAC2002_FY0.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
    mex([pwd, '/GRD_PAC2002_FY.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
    mex([pwd, '/HES_PAC2002_FY0.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
cd ../
cd ../
cd ../
cd ../

% =========================================================================
cd ([pwd,'/algorithm/opt/OCP_FCN_2VM/cpp'])
    mex([pwd, '/OCP_FCN_CONT_DYNAMICS_2DOFNL.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
    mex([pwd, '/OCP_GRD_CONT_DYNAMICS_2DOFNL.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
    mex([pwd, '/OCP_HES_CONT_DYNAMICS_2DOFNL.cpp'])
    CNT = CNT + 1;
    disp([num2str(CNT),' out of ',num2str(TOTAL_NUM), ' compiled'])
cd ../
cd ../
cd ../
cd ../

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ../

clear all;