function OUTPUT = SIM_14DoF(INPUT)

warning off all
warning on Simulink:actionNotTaken

% http://www.mathworks.com/matlabcentral/answers/94215
load_system('VEHICLE_14DoF');
hws = get_param('VEHICLE_14DoF', 'modelworkspace');

global DATA_HMMWV STATES_INIT

T_TOTAL                 = INPUT.T_TOTAL;
DATA_HMMWV              = INPUT.DATA_HMMWV;

KVEL                    = INPUT.KVEL; %#ok<NASGU>
STATES_INIT             = INPUT.STATES_INIT;
CMD_T                   = INPUT.CMD_TM; %#ok<NASGU>
CMD_U                   = INPUT.CMD_UX; %#ok<NASGU>
CMD_SAFL                = INPUT.CMD_SAFL; %#ok<NASGU>
CMD_SAFR                = INPUT.CMD_SAFR; %#ok<NASGU>
CMD_SARL                = INPUT.CMD_SARL; %#ok<NASGU>
CMD_SARR                = INPUT.CMD_SARR; %#ok<NASGU>

% hws.assignin('DATA_HMMWV',  eval('DATA_HMMWV'));
hws.assignin('KVEL',        eval('KVEL'));
% hws.assignin('STATES_INIT', eval('STATES_INIT'));
hws.assignin('CMD_T',       eval('CMD_T'));
hws.assignin('CMD_U',       eval('CMD_U'));
hws.assignin('CMD_SAFL',    eval('CMD_SAFL'));
hws.assignin('CMD_SAFR',    eval('CMD_SAFR'));
hws.assignin('CMD_SARL',    eval('CMD_SARL'));
hws.assignin('CMD_SARR',    eval('CMD_SARR'));

Param.Solver            = 'ode45';
Param.SimulationMode    = 'normal';
Param.StopTime          = num2str(T_TOTAL);

% fprintf('@Simulating the 14 DoF Vehicle Model...\n')
simout = sim('VEHICLE_14DoF.slx',Param);
% fprintf('\n')

OUTPUT.TIME             = simout.get('TIME');
OUTPUT.STATE            = simout.get('STATE');
OUTPUT.ACCEL            = simout.get('ACCEL');
OUTPUT.SLIP             = simout.get('SLIP');
OUTPUT.FORCE            = simout.get('FORCE');
OUTPUT.SUSP             = simout.get('SUSP');
OUTPUT.TIRE             = simout.get('TIRE');
OUTPUT.COMMAND          = simout.get('COMMAND');

% save_system('VEHICLE_14DoF');
% close_system('VEHICLE_14DoF');