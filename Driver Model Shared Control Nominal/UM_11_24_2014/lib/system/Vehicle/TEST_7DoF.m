clear all; clc; close all;

restoredefaultpath;
cd ../
addpath([pwd,'/Tire/PAC2002/cpp'],'-begin');
cd('Vehicle')
addpath([pwd,'/Data'],'-begin');
addpath([pwd,'/VEHICLE_7DoF'],'-begin');

% inputs
load DATA_HMMWV_MODEL.mat
U_INIT      = 30;

[CMD_TM, CMD_SA, CMD_UX] = sample_input(U_INIT);

INPUT.DATA_HMMWV    = DATA_HMMWV_MODEL;
INPUT.T_TOTAL       = CMD_TM(end);
INPUT.CMD_TM        = CMD_TM;
INPUT.CMD_SA        = CMD_SA;
INPUT.CMD_UX    	= CMD_UX;

X0          = 0;
Y0          = 0;
V0          = 0;
R0          = 0;
PSI0        = pi/2;
U0          = U_INIT;
OMEGA_FL0   = U_INIT/DATA_HMMWV_MODEL.RW;
OMEGA_FR0   = U_INIT/DATA_HMMWV_MODEL.RW;
OMEGA_RL0   = U_INIT/DATA_HMMWV_MODEL.RW;
OMEGA_RR0   = U_INIT/DATA_HMMWV_MODEL.RW;
dFZX0       = 0;
dFZYF0      = 0;
dFZYR0      = 0;

INPUT.STATES_INIT   = [ X0, Y0, V0, R0, PSI0, U0, ...
                        OMEGA_FL0, OMEGA_FR0, OMEGA_RL0, OMEGA_RR0, ...
                        dFZX0, dFZYF0, dFZYR0];

OUTPUT  = SIM_7DoF(INPUT);

TIME    = OUTPUT.TIME;
STATE   = OUTPUT.STATE;
ACCEL   = OUTPUT.ACCEL;
ALPHAFL	= OUTPUT.ALPHAFL;
ALPHAFR	= OUTPUT.ALPHAFR;
ALPHARL	= OUTPUT.ALPHARL;
ALPHARR	= OUTPUT.ALPHARR;
FXFL    = OUTPUT.FXFL;
FXFR    = OUTPUT.FXFR;
FXRL    = OUTPUT.FXRL;
FXRR    = OUTPUT.FXRR;
FYFL    = OUTPUT.FYFL;
FYFR    = OUTPUT.FYFR;
FYRL    = OUTPUT.FYRL;
FYRR    = OUTPUT.FYRR;
FZFL    = OUTPUT.FZFL;
FZFR    = OUTPUT.FZFR;
FZRL    = OUTPUT.FZRL;
FZRR    = OUTPUT.FZRR;

figure(1)
hold on;
axis equal
xlabel('x (m)')
ylabel('y (m)')
plot(STATE(:,1), STATE(:,2), 'k', 'LineWidth', 2)