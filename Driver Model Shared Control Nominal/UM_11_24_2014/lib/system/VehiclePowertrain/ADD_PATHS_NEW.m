% restores the MATLAB search path to installed products
restoredefaultpath;

% adds paths to the MATLAB path directory
if exist('rootpath.m','file') == 2
    delete('rootpath.m')
end

if exist('rootpath.m', 'file') ~= 2
    cD = pwd;
    cD = strrep(cD, '\', '/');
    fid = fopen('rootpath.m', 'wt');
    fprintf(fid, 'function v = rootpath()\n');
    fprintf(fid, ['v = ''', cD, ''';\n']);
    fclose(fid);
else
    rp = rootpath();
    cd(rp)
end

% clear all; clc;

disp('Adds paths to the MATLAB path directory');

% root path
addpath(pwd,'-begin');

addpath([pwd,'/ADAMS'],'-begin');
addpath([pwd,'/ADAMS/algorithms'],'-begin');

addpath([pwd,'/examples'],'-begin');
addpath([pwd,'/examples/map'],'-begin');

% library
addpath([pwd,'/lib'],'-begin');

% geometry
addpath([pwd,'/lib/geometry'],'-begin');

% simulation
addpath([pwd,'/lib/simulation'],'-begin');
addpath([pwd,'/lib/simulation/init'],'-begin');
addpath([pwd,'/lib/simulation/figure'],'-begin');
addpath([pwd,'/lib/simulation/variable'],'-begin');
addpath([pwd,'/lib/simulation/misc'],'-begin');
addpath([pwd,'/lib/simulation/final'],'-begin');

% system
addpath([pwd,'/lib/system'],'-begin');
addpath([pwd,'/lib/system/LIDAR'],'-begin');
addpath([pwd,'/lib/system/Vehicle/Data'],'-begin');
addpath([pwd,'/lib/system/Vehicle/VEHICLE_14DoF'],'-begin');
addpath([pwd,'/lib/system/Tire/PAC2002/cpp'],'-begin');
addpath([pwd,'/lib/system/SimLIDAR'],'-begin');
addpath([pwd,'/lib/system/SimVehicle'],'-begin');
addpath([pwd,'/lib/system/VehiclePowertrain'],'-begin'); %+...

% algorithm
addpath([pwd,'/lib/algorithm'],'-begin');
addpath([pwd,'/lib/algorithm/init'],'-begin');
addpath([pwd,'/lib/algorithm/lut'],'-begin');
addpath([pwd,'/lib/algorithm/sd'],'-begin');
addpath([pwd,'/lib/algorithm/sd/cpp'],'-begin');
addpath([pwd,'/lib/algorithm/chk'],'-begin');
addpath([pwd,'/lib/algorithm/gs'],'-begin');
addpath([pwd,'/lib/algorithm/s2g'],'-begin');
addpath([pwd,'/lib/algorithm/opt'],'-begin');
addpath([pwd,'/lib/algorithm/opt/IPOPT'],'-begin');
addpath([pwd,'/lib/algorithm/opt/IPOPT_Handles'],'-begin');
addpath([pwd,'/lib/algorithm/opt/OCP_NLP'],'-begin');
addpath([pwd,'/lib/algorithm/opt/OCP_FML'],'-begin');
addpath([pwd,'/lib/algorithm/opt/OCP_FCN_EP'],'-begin');
addpath([pwd,'/lib/algorithm/opt/OCP_FCN_PAC2002/data'],'-begin');
addpath([pwd,'/lib/algorithm/opt/OCP_FCN_PAC2002/m'],'-begin');
addpath([pwd,'/lib/algorithm/opt/OCP_FCN_PAC2002/cpp'],'-begin');
addpath([pwd,'/lib/algorithm/opt/OCP_FCN_2CF'],'-begin');
addpath([pwd,'/lib/algorithm/opt/OCP_FCN_2VM'],'-begin');
addpath([pwd,'/lib/algorithm/opt/OCP_FCN_2VM/cpp'],'-begin');
addpath([pwd,'/lib/algorithm/ldp'],'-begin');
addpath([pwd,'/lib/algorithm/ldp/Basic'],'-begin');
addpath([pwd,'/lib/algorithm/ldp/FeatureExtraction'],'-begin');
addpath([pwd,'/lib/algorithm/ldp/Clipper'],'-begin');
addpath([pwd,'/lib/algorithm/ldp/PartitionPolar'],'-begin');
addpath([pwd,'/lib/algorithm/ldp/PartitionConvex'],'-begin');
addpath([pwd,'/lib/algorithm/ldp/PartitionConvex/KeilSnoeyink'],'-begin');
addpath([pwd,'/lib/algorithm/ldp/GraphSearch'],'-begin');
addpath([pwd,'/lib/algorithm/ldp/PrintnPlot'],'-begin');
addpath([pwd,'/lib/algorithm/alt'],'-begin');
addpath([pwd,'/lib/algorithm/res'],'-begin');

disp('Completed');
