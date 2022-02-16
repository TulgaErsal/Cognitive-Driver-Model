%Initialize VEHICLE_DYN_TRAIN.slx
global DATA_HMMWV
load DATA_HMMWV_PLANT.mat
time_step = 0.01;
CMD_TM = 0:time_step:time_max;
CMD_TM = CMD_TM';
T_LENGTH = length(CMD_TM);
CMD_UX = U_START*ones(1,T_LENGTH)';
CMD_TH = zeros(T_LENGTH,1);
CMD_BR = zeros(T_LENGTH,1);
CMD_ST = zeros(T_LENGTH,1);
CMD_MODE = ones(T_LENGTH,1);
Tstop = time_max*ones(T_LENGTH,1);
J=0.075;
B=0.25;
K=0.075;
tau_a_in=0;
st_a_in=0;

Error_now = 0;
correction_switch = 0;

% From experiments
pid2tau_gain=2.5;

env_init;





open_system('VEHICLE_DYN_TRAIN')  %visible
%load_system('VEHICLE_DYN_TRAIN')  %invisible
hws = get_param('VEHICLE_DYN_TRAIN','modelworkspace');

load DATA_VESIM_CC_BRAKE.mat
VarNameAll = fieldnames(DATA_VESIM_CC_BRAKE);
for i = 1:length(VarNameAll)
    hws.assignin(VarNameAll{i}, eval(strcat('DATA_VESIM_CC_BRAKE.',VarNameAll{i})) );
end

hws.assignin('Tstop',eval('Tstop'))
hws.assignin('CMD_TM',eval('CMD_TM'))
hws.assignin('CMD_UX',eval('CMD_UX'))
hws.assignin('CMD_TH',eval('CMD_TH'))
hws.assignin('CMD_BR',eval('CMD_BR'))
hws.assignin('CMD_ST',eval('CMD_ST'))
hws.assignin('CMD_MODE',eval('CMD_MODE'))

set_param('VEHICLE_DYN_TRAIN','SimulationCommand','update')

set_param('VEHICLE_DYN_TRAIN','SimulationCommand','start','SimulationCommand','pause');
set_param('VEHICLE_DYN_TRAIN','SimulationCommand','continue')

pause(5);

try
    test = TIME(end);
catch
    warning('Variable "TIME" is not defined yet. Initialize "Time" array')
    TIME=0;
end

TIME_PASS = TIME(end);
STATE_PASS = STATE(end,:);
T_STOP_ALL = [T_STOP_ALL TIME(end)];

while TIME_PASS < 0.1
    pause(1)
    TIME_PASS = TIME(end);
end


display(TIME_PASS)