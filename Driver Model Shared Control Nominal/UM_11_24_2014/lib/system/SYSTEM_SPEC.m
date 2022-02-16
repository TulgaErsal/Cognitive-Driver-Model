function [SPEC, ERROR] = SYSTEM_SPEC(INPUT)

% System specifications
% 
% * parameters of the systems, including sensors and the vehicle platform
% * parameters that cannot be driectly used by the algorithm

ERROR                  	= false;

%% VEHICLE
% Vehicle parameters
load DATA_HMMWV_PLANT.mat
% Speed control: proportional constant
KVEL                    = 100; 

% initial states
% Initial vehicle position (m, m)
VP_INIT                	= INPUT.VP_INIT; 
% Initial heading angle (rad)
HA_INIT               	= INPUT.HA_INIT; 
% navigation goal, final position (m, m)
VP_GOAL             	= INPUT.VP_GOAL; 
% navigation goal, final heading angle (rad)
if isfield(INPUT, 'HA_GOAL')
    HA_GOAL            	= INPUT.HA_GOAL; 
else
    HA_GOAL          	= [];                   
end
% initial speed (m/s), 10<=U_INIT<=30
U_INIT                	= INPUT.U_INIT; 

if U_INIT < 10 || U_INIT > 30 %#THLD#
    disp('error: U_INIT should be within the range [10, 30]')
    ERROR = true;
    SPEC = [];
    return;
end

STATES_INIT          	= zeros(1,32);
STATES_INIT(1)       	= VP_INIT(1);
STATES_INIT(2)        	= VP_INIT(2);
STATES_INIT(3)       	= DATA_HMMWV.HG;
STATES_INIT(6)         	= HA_INIT;
STATES_INIT(7)       	= U_INIT;
STATES_INIT(17:20)   	= DATA_HMMWV.XT_INIT;
STATES_INIT(21:24)    	= DATA_HMMWV.XS_INIT;
STATES_INIT(25:28)   	= U_INIT./DATA_HMMWV.ZT_INIT;

SPEC.DATA_HMMWV         = DATA_HMMWV;
SPEC.KVEL               = KVEL;
SPEC.STATES_INIT        = STATES_INIT;
SPEC.VP_INIT          	= VP_INIT;
SPEC.HA_INIT           	= HA_INIT;
SPEC.VP_GOAL         	= VP_GOAL;
SPEC.HA_GOAL         	= HA_GOAL;

%% MAP
% Simulation MAP
SPEC.MAP                = INPUT.MAP;

%% DELAYS
% Actual sensing delay
SPEC.SENSING_DELAY      = INPUT.SENSING_DELAY;
% Actual control delayOr 
SPEC.CONTROL_DELAY      = INPUT.CONTROL_DELAY;

%% LIDAR
% LIDAR detection range (m)
SPEC.LASER_RANGE        = INPUT.LASER_RANGE;
% LIDAR scanning angular resolution (deg)
SPEC.ANGULAR_RES        = INPUT.ANGULAR_RES;