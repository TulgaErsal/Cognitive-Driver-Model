crt_fpth = pwd;
addpath([pwd,'\Simulink_executive_control'])
dt = 0.01;
dtslow = 0.06;
dtText = 0.5;
vdes = 10;
VehInit = [0,0,0.8464];

Xobs = [950,980, 1000, 1100,1150,1160,1170,1180,1190,1200];
Yobs = [950,980,1000,1100,1150,1160,1170,1180,1190,1200];

Robs = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

testdate = 20190305;
testnum = 106;
evaluation_switch = 0;
plot_switch = 0;

steeringmodel_init;
