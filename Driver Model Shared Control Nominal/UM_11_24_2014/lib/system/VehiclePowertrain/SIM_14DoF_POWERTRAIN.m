function OUTPUT = SIM_14DoF_POWERTRAIN(INPUT)
open_system('VEHICLE_DYN_TRAIN')
%load_system('VEHICLE_DYN_TRAIN')
% Takes the simulation to time 0.0 and pauses it
set_param('VEHICLE_DYN_TRAIN','SimulationCommand','start','SimulationCommand','pause')


hws = get_param('VEHICLE_DYN_TRAIN', 'modelworkspace');
%global DATA_VESIM_CC_BRAKE STATES_INIT
% load('DATA_VESIM_CC_BRAKE.mat')
% structvars(DATA_VESIM_CC_BRAKE);

% Test
% T_STEP = 0.01;
% T_TOTAL = 20;
% CMD_T = 0:T_STEP:T_TOTAL;
% T_LENGTH = length(CMD_T);
% 
% CMD_MODE = 0*ones(1,T_LENGTH);
% 
% CMD_U = 10*ones(1,T_LENGTH);
% CMD_TH = [0:0.01:1 ones(1,T_LENGTH-101)];
% CMD_BR = 0*ones(1,T_LENGTH);
% CMD_ST = 0*ones(1,T_LENGTH);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T_TOTAL                 = INPUT.T_TOTAL;

global DATA_HMMWV STATES_INIT
DATA_HMMWV              = INPUT.DATA_HMMWV;
STATES_INIT             = INPUT.STATES_INIT;

CMD_T                   = INPUT.CMD_TM;
CMD_U                   = INPUT.CMD_UX;
CMD_MODE                = INPUT.MODE;
CMD_TH                  = INPUT.CMD_TH; 
CMD_BR                  = INPUT.CMD_BR; 
CMD_ST                  = INPUT.CMD_ST; 
CMD_TSTOP               = INPUT.CMD_TSTOP;

% CMD_SAFL                = INPUT.CMD_SAFL; %#ok<NASGU>
% CMD_SAFR                = INPUT.CMD_SAFR; %#ok<NASGU>
% CMD_SARL                = INPUT.CMD_SARL; %#ok<NASGU>
% CMD_SARR                = INPUT.CMD_SARR; %#ok<NASGU>

hws.assignin('T_TOTAL',  eval('T_TOTAL'));
hws.assignin('CMD_T',    eval('CMD_T'));
hws.assignin('CMD_U',    eval('CMD_U'));
hws.assignin('CMD_MODE', eval('CMD_MODE'));
hws.assignin('CMD_TH',   eval('CMD_TH'));
hws.assignin('CMD_BR',   eval('CMD_BR'));
hws.assignin('CMD_ST',   eval('CMD_ST'));
hws.assignin('CMD_TSTOP',eval('CMD_TSTOP'));

DATA_VESIM_CC_BRAKE = INPUT.DATA_VESIM_CC_BRAKE;  
v2struct(DATA_VESIM_CC_BRAKE)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% open_system('VEHICLE_DYN_TRAIN')
% % Takes the simulation to time 0.0 and pauses it
% set_param('VEHICLE_DYN_TRAIN','SimulationCommand','start','SimulationCommand','pause')
for i = 1:5
% Runs the simulation for 1 time step and pauses it
    set_param('VEHICLE_DYN_TRAIN','SimulationCommand','continue','SimulationCommand','pause')
end
%get_param('VEHICLE_DYN_TRAIN','STATE');
OUTPUT.TIME = 0;
% OUTPUT.TIME             = simout.get('TIME');
% OUTPUT.STATE            = simout.get('STATE');
% OUTPUT.ACCEL            = simout.get('ACCEL');
% OUTPUT.SLIP             = simout.get('SLIP');
% OUTPUT.FORCE            = simout.get('FORCE');
% OUTPUT.SUSP             = simout.get('SUSP');
% OUTPUT.TIRE             = simout.get('TIRE');
% OUTPUT.COMMAND          = simout.get('COMMAND');
end