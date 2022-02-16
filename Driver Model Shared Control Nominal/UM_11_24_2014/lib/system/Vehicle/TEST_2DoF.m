clear all; clc; close all;

restoredefaultpath;
cd ../
addpath([pwd,'/Tire/PAC2002/cpp'],'-begin');
cd('Vehicle')
addpath([pwd,'/Data'],'-begin');
addpath([pwd,'/VEHICLE_2DoF'],'-begin');

% inputs
load DATA_HMMWV_MODEL.mat

U_INIT      = 20;

SA          = 3*pi/180;
TT          = SA/(10*pi/180);

CMD_TM_SP   = [0, 1, 1+TT, 5+TT, 5+3*TT, 20+3*TT];
CMD_SA_SP   = [0, 0, -SA, -SA, SA, SA];

T_TOTAL     = CMD_TM_SP(end);

CMD_TM      = 0:0.001:CMD_TM_SP(end);
CMD_SA      = interp1f(CMD_TM_SP, CMD_SA_SP, CMD_TM, 'linear');

INPUT.DATA_HMMWV    = DATA_HMMWV_MODEL;
INPUT.T_TOTAL       = T_TOTAL;
INPUT.CMD_TM        = CMD_TM;
INPUT.CMD_SA        = CMD_SA;
INPUT.U0            = U_INIT;
INPUT.TIRE_MODEL    = 'LINEAR';
INPUT.LOAD_TRANSFER = 'NO';
INPUT.TIRE_MODEL    = 'NONLINEAR';
INPUT.LOAD_TRANSFER = 'NO';
INPUT.TIRE_MODEL    = 'LINEAR';
INPUT.LOAD_TRANSFER = 'YES';
INPUT.TIRE_MODEL    = 'NONLINEAR';
INPUT.LOAD_TRANSFER = 'YES';

X0      = 0;
Y0      = 0;
V0      = 0;
R0      = 0;
PSI0    = pi/2;
INPUT.STATES_INIT   = [X0, Y0, V0, R0, PSI0];

OUTPUT  = SIM_2DoF(INPUT);

TIME    = OUTPUT.TIME;
STATE   = OUTPUT.STATE;
ACCEL   = OUTPUT.ACCEL;
ALPHAF 	= OUTPUT.ALPHAF;
ALPHAR 	= OUTPUT.ALPHAR;
FYF     = OUTPUT.FYF;
FYR     = OUTPUT.FYR;

figure(1)
hold on;
axis equal
xlabel('x (m)')
ylabel('y (m)')
plot(STATE(:,1), STATE(:,2), 'k', 'LineWidth', 2)

save(['Test_2DoF_', INPUT.TIRE_MODEL, '_LT', INPUT.LOAD_TRANSFER, '.mat'])