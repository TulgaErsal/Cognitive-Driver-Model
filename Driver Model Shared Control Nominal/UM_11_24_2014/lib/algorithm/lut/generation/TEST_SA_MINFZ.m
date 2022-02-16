clear all; clc; close all; 

addpath([pwd,'/Data'],'-begin');
addpath([pwd,'/PAC2002'],'-begin');
addpath([pwd,'/VEHICLE_14DOF'],'-begin');

U_SEQ   = 31:-1:9;
SA_MAG  = 0:0.1:20;

figure(1)
hold on;

for iU = 1:length(U_SEQ)
    U_INIT  = U_SEQ(iU);
    
    minFZ = nan*ones(size(SA_MAG));

    for iSA = 1:length(SA_MAG)
        [minFZ(iSA), INPUT, OUTPUT] = RUN_14DOF(U_INIT, SA_MAG(iSA)*pi/180);
        plot(SA_MAG(iSA), minFZ(iSA), 'ko')
        save([pwd, '\Results\U_', num2str(U_INIT), '_A_', num2str(SA_MAG(iSA)*10),'.mat'])
    end
end