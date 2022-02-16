clear all; clc; close all;

restoredefaultpath;
cd ../
addpath([pwd,'/Tire/PAC2002/cpp'],'-begin');
cd('Vehicle')
addpath([pwd,'/Data'],'-begin');
addpath([pwd,'/VEHICLE_14DoF'],'-begin');

% inputs
load DATA_HMMWV_14DoF.mat

U_INIT      = 30;

[CMD_TM, CMD_SA, CMD_UX] = sample_input(U_INIT);

CMD_SAFL    = CMD_SA;
CMD_SAFR    = CMD_SA;
CMD_SARL    = zeros(size(CMD_TM));
CMD_SARR    = zeros(size(CMD_TM));

KVEL = 100;

% initial consitions    
STATES_INIT          = zeros(1,32);
STATES_INIT(3)       = DATA_HMMWV_14DoF.HG;
STATES_INIT(6)       = pi/2;
STATES_INIT(7)       = U_INIT;
STATES_INIT(17:20)   = DATA_HMMWV_14DoF.XT_INIT;
STATES_INIT(21:24)   = DATA_HMMWV_14DoF.XS_INIT;
STATES_INIT(25:28)   = U_INIT./DATA_HMMWV_14DoF.ZT_INIT;

INPUT.DATA_HMMWV    = DATA_HMMWV_14DoF;
INPUT.KVEL          = KVEL;
INPUT.T_TOTAL       = CMD_TM(end);
INPUT.STATES_INIT   = STATES_INIT;
INPUT.CMD_TM        = CMD_TM;
INPUT.CMD_UX        = CMD_UX;
INPUT.CMD_SAFL      = CMD_SAFL;
INPUT.CMD_SAFR      = CMD_SAFR;
INPUT.CMD_SARL      = CMD_SARL;
INPUT.CMD_SARR      = CMD_SARR;

figure(1)
hold on;
xlabel('Time (s)')
ylabel('Longitudinal Speed (m/s)')
plot(CMD_TM, CMD_UX,'k','LineWidth',2)

figure(2)
hold on;
xlabel('Time (s)')
ylabel('Steering Angle (degree)')
plot(CMD_TM, CMD_SA*180/pi,'k','LineWidth',2)

% =========================================================================
OUTPUT = SIM_14DoF(INPUT);
% =========================================================================

% outputs
TIME    = OUTPUT.TIME;
STATE   = OUTPUT.STATE;
ACCEL   = OUTPUT.ACCEL;
SLIP    = OUTPUT.SLIP;
FORCE   = OUTPUT.FORCE;
SUSP    = OUTPUT.SUSP;
TIRE    = OUTPUT.TIRE;
COMMAND = OUTPUT.COMMAND;

FZFL = FORCE(:,9);
FZFR = FORCE(:,10);
FZRL = FORCE(:,11);
FZRR = FORCE(:,12);

FZFL(1) = FZFL(2);
FZFR(1) = FZFR(2);
FZRL(1) = FZRL(2);
FZRR(1) = FZRR(2);

figure(1)
plot(TIME, STATE(:,7),'r','LineWidth',2)

figure(3)
hold on;
plot(TIME, FORCE(:,9)/1000,'r','LineWidth',2)
plot(TIME, FORCE(:,10)/1000,'k','LineWidth',2)
plot(TIME, FORCE(:,11)/1000,'c','LineWidth',2)
plot(TIME, FORCE(:,12)/1000,'b','LineWidth',2)
xlabel('Time (s)')
ylabel('Vertical Load (kN)')

figure(4)
hold on;
plot(TIME, FORCE(:,1)/1000,'r','LineWidth',2)
plot(TIME, FORCE(:,2)/1000,'k','LineWidth',2)
plot(TIME, FORCE(:,3)/1000,'c','LineWidth',2)
plot(TIME, FORCE(:,4)/1000,'b','LineWidth',2)
xlabel('Time (s)')
ylabel('Longitudinal Force (kN)')

figure(5)
hold on;
plot(TIME, FORCE(:,5)/1000,'r','LineWidth',2)
plot(TIME, FORCE(:,6)/1000,'k','LineWidth',2)
plot(TIME, FORCE(:,7)/1000,'c','LineWidth',2)
plot(TIME, FORCE(:,8)/1000,'b','LineWidth',2)
xlabel('Time (s)')
ylabel('Lateral Force (kN)')

figure(6)
hold on;
plot(TIME, FORCE(:,13),'r','LineWidth',2)
plot(TIME, FORCE(:,14),'k','LineWidth',2)
plot(TIME, FORCE(:,15),'c','LineWidth',2)
plot(TIME, FORCE(:,16),'b','LineWidth',2)
xlabel('Time (s)')
ylabel('Aligning Moment (N-m)')


