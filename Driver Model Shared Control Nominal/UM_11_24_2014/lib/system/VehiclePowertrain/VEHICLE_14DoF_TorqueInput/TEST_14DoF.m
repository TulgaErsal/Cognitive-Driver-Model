% inputs
VESIM_init;
VEHICLE14DoF_init;


T_TOTAL     = 20;
U_INIT      = 0.01;
TS          = 0.01;
T_VEH       = 0:TS:T_TOTAL;
MS          = 1*pi/180;
TT          = round(MS/(10*pi/180)/TS)*TS;
CMD_T_SEQ  	= [0 TT T_TOTAL/2 T_TOTAL/2+2*TT T_TOTAL];
CMD_SA_SEQ 	= [0 MS MS -MS -MS];
CMD_SA      = interp1(CMD_T_SEQ, CMD_SA_SEQ, T_VEH);

ACC         = ones(size(T_VEH));
DEC         = zeros(size(T_VEH));
SA          = CMD_SA;


% Full Brake
% ACC        = zeros(size(T_VEH));
% ACC(1:1000)= 1;
% DEC        = zeros(size(T_VEH));
% DEC(1500:1700)= linspace(0,1,201);
% DEC(1700:end) = 1;
% SA         = zeros(size(T_VEH));


% initial consitions    
STATES_INIT          = zeros(1,32);
STATES_INIT(3)       = DATA_HMMWV.HG;
STATES_INIT(6)       = pi/2;
STATES_INIT(7)       = U_INIT;
STATES_INIT(17:20)   = DATA_HMMWV.XT_INIT;
STATES_INIT(21:24)   = DATA_HMMWV.XS_INIT;
STATES_INIT(25:28)   = U_INIT./DATA_HMMWV.ZT_INIT;

ACCELS_INIT         = zeros(1,32)';

INPUT.DATA_HMMWV    = DATA_HMMWV;
INPUT.T_TOTAL       = T_TOTAL;
INPUT.STATES_INIT   = STATES_INIT;
INPUT.ACCELS_INIT   = ACCELS_INIT;
INPUT.T_VEH         = T_VEH;
INPUT.ACC           = ACC;
INPUT.DEC           = DEC;
INPUT.SA            = SA;

figure(1)
hold on;
plot(T_VEH, ACC,'b','LineWidth',2)
plot(T_VEH, DEC,'r','LineWidth',2)
xlabel('Time (s)')
ylabel('ACC, DEC [m/s^2]')
hold off

figure(2)
hold on;
xlabel('Time (s)')
ylabel('Steering Angle (degree)')
plot(T_VEH, SA*180/pi,'k','LineWidth',2)

% =========================================================================
OUTPUT = SIM_14DoF(INPUT);
% =========================================================================

% outputs
TIME            = OUTPUT.TIME;
STATE           = OUTPUT.STATE;
ACCEL           = OUTPUT.ACCEL;
SLIP            = OUTPUT.SLIP;
FORCE           = OUTPUT.FORCE;
SUSP            = OUTPUT.SUSP;
TIRE            = OUTPUT.TIRE;
COMMAND         = OUTPUT.COMMAND;
UG              = OUTPUT.UG;
MPC_STATES_INIT = OUTPUT.MPC_STATES_INIT;


figure(3)
plot(MPC_STATES_INIT(:,1), MPC_STATES_INIT(:,2),'b','LineWidth',2)
xlabel('X [m]')
ylabel('Y [m]')

figure(4)
plot(TIME, MPC_STATES_INIT(:,5)*180/pi,'b','LineWidth',2)
xlabel('Time [s]')
ylabel('Heading angle [deg]')

figure(5)
plot(TIME, UG,'b','LineWidth',2)
xlabel('Time [s]')
ylabel('Vehicle speed [m/s]')



