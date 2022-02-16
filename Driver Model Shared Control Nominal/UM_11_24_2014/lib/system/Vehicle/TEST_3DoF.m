clear all; clc; close all;

restoredefaultpath;
cd ../
addpath([pwd,'/Tire/PAC2002/cpp'],'-begin');
cd('Vehicle')
addpath([pwd,'/Data'],'-begin');
addpath([pwd,'/VEHICLE_3DoF'],'-begin');

% inputs
load DATA_HMMWV_MODEL.mat

T_TOTAL     = 10;
U_INIT      = 21;

TS          = 0.01;
CMD_TM      = 0:TS:T_TOTAL;

MS          = 2*pi/180;
TT          = round(MS/(10*pi/180)/TS)*TS;
CMD_TM_SEQ  = [0 TT T_TOTAL/2 T_TOTAL/2+2*TT T_TOTAL];
CMD_SA_SEQ 	= [0 MS MS -MS -MS];
CMD_SA      = interp1f(CMD_TM_SEQ, CMD_SA_SEQ, CMD_TM, 'linear');
CMD_AX      = -1*ones(size(CMD_TM));

INPUT.DATA_HMMWV    = DATA_HMMWV_MODEL;
INPUT.T_TOTAL       = T_TOTAL;
INPUT.CMD_TM        = CMD_TM;
INPUT.CMD_SA        = CMD_SA;
INPUT.CMD_AX     	= CMD_AX;
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
U0      = U_INIT;
INPUT.STATES_INIT   = [X0, Y0, V0, R0, PSI0, U0];

OUTPUT  = SIM_3DoF(INPUT);

TIME    = OUTPUT.TIME;
STATE   = OUTPUT.STATE;
ACCEL   = OUTPUT.ACCEL;
ALPHAF 	= OUTPUT.ALPHAF;
ALPHAR 	= OUTPUT.ALPHAR;
FYF     = OUTPUT.FYF;
FYR     = OUTPUT.FYR;
FZF     = OUTPUT.FZF;
FZR     = OUTPUT.FZR;

figure(1)
hold on;
axis equal
xlabel('x (m)')
ylabel('y (m)')
plot(STATE(:,1), STATE(:,2), 'k', 'LineWidth', 2)

save(['Test_3DoF_', INPUT.TIRE_MODEL, '_LT', INPUT.LOAD_TRANSFER, '.mat'])