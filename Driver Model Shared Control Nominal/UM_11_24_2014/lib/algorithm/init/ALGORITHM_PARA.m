function [PARA, ERROR] = ALGORITHM_PARA(INPUT, OBS)

% algorithm parameters

ERROR                       = false;

%% Navigation Task

% MODE: Constant Speed or Variable Speed
MODE                        = INPUT.MODE;
% Initial vehicle position (m, m)
VP_INIT                     = [OBS.X, OBS.Y]; 
% Initial heading angle (rad)
HA_INIT                     = OBS.PSI; 
% navigation goal, final position (m, m)
VP_GOAL                     = INPUT.VP_GOAL; 
% navigation goal, final heading angle (rad)
if isfield(INPUT, 'HA_GOAL')
    HA_GOAL                 = INPUT.HA_GOAL; 
else
    HA_GOAL                 = [];                   
end

% initial distance to goal
D2G_INIT                    = norm(VP_GOAL - VP_INIT, 2);

PARA.MODE                   = MODE;
PARA.VP_INIT                = VP_INIT;
PARA.HA_INIT                = HA_INIT;
PARA.VP_GOAL                = VP_GOAL;
PARA.HA_GOAL                = HA_GOAL;
PARA.D2G_INIT               = D2G_INIT;

%% Vehicle Parameters and Limits

% vehicle parameters for the controller
load DATA_HMMWV_MODEL.mat;
load DATA_HMMWV_14DoF.mat;
KVEL                        = 100;

PARA.DATA_HMMWV_MODEL      	= DATA_HMMWV_MODEL;
PARA.DATA_HMMWV_14DoF   	= DATA_HMMWV_14DoF;
PARA.KVEL                   = KVEL;

% initial speed (m/s), 10<=U_INIT<=30
U_INIT                      = OBS.U; 

if U_INIT < 10 || U_INIT > 30
    disp('error: U_INIT should be within the range [10, 30]')
    ERROR = true;
end

% initial acceleration (m/s^2)
AX_INIT                     = OBS.AX;
% initial steering angle (radian)
SA_INIT                     = OBS.SA;
% initial steering rate (radian/sec)
SR_INIT                     = OBS.SR;

PARA.U_INIT                 = U_INIT;
PARA.AX_INIT                = AX_INIT;
PARA.SA_INIT                = SA_INIT;
PARA.SR_INIT                = SR_INIT;

% acceleration limits (m/s^2), % -1<=AX_MIN<=AX_MAX<=1
AX_MAX                      = 1; 
AX_MIN                      = - AX_MAX;

% longitudinal speed limits (m/s), 10<=U_MIN<=U_MAX<=30
U_MAX                       = U_INIT;
if MODE == ConstantSpeed
    U_MIN                 	= U_INIT;
elseif MODE == VariableSpeed
    U_MIN                   = INPUT.U_MIN;
end

if U_MIN < 10 || U_MIN > 30
    disp('error: U_MIN should be within the range [10, 30]')
    ERROR = true;
end

% maximum steering rate (radian/sec)
SR_SYS_MAX                  = 10*pi/180; 
SR_SYS_MIN                  = - SR_SYS_MAX;

% maximum steering angle (radian)
SA_SYS_MAX                  = 30*pi/180; 
SA_SYS_MIN                  = - SA_SYS_MAX;

PARA.AX_MAX                 = AX_MAX;
PARA.AX_MIN                 = AX_MIN;
PARA.U_MAX                  = U_MAX;
PARA.U_MIN                  = U_MIN;
PARA.SR_SYS_MAX             = SR_SYS_MAX;
PARA.SR_SYS_MIN             = SR_SYS_MIN;
PARA.SA_SYS_MAX             = SA_SYS_MAX;
PARA.SA_SYS_MIN             = SA_SYS_MIN;

load LUT_MAXSA_300.mat
% maximum steering angle (radian)
% the maximum steering angle is related to the constant speed
U_SEQ                       = LUT.VX_SEQ;
SA_MAX_SEQ                  = LUT.SA_MAX_SEQ;
SA_MAX                      = interp1f(U_SEQ, SA_MAX_SEQ, U_INIT, 'pchip');
SA_MIN                      = - SA_MAX;

PARA.LUT                    = LUT;
PARA.SA_MAX                 = SA_MAX;
PARA.SA_MIN                 = SA_MIN;

%% Thresholds 

% minimum distance to obstacle threshold (m)
MINDIST_THLD                = 6.0; %#THLD#

% threshold for goal arrival: if the distance between the vehicle and the
% goal is less than this threshold, the vehicle is considered as arriving
% the goal. (m)
% DIST2GOAL_THLD              = 3.0; %#THLD#
DIST2GOAL_THLD              = INPUT.EXECUTION_TIME*INPUT.U_INIT; %#THLD#

% obstacle line simplification tolerance
% used by the function dpsimplify()
LINE_SIMP_THLD              = 0.1; %#THLD#

% smallest angle in vehicle's local coordinates that need to be handled
% ANGLE_MIN                   = 50*pi/180; %#THLD#

% largest angle in vehicle's local coordinates that need to be handled
% ANGLE_MAX                   = 130*pi/180; %#THLD#

PARA.MINDIST_THLD           = MINDIST_THLD;
PARA.DIST2GOAL_THLD         = DIST2GOAL_THLD;
PARA.LINE_SIMP_THLD         = LINE_SIMP_THLD;
% PARA.ANGLE_MIN              = ANGLE_MIN;
% PARA.ANGLE_MAX              = ANGLE_MAX;

%% Delays
% Estimated sensor delay
SENSING_DELAY_EST          	= INPUT.SENSING_DELAY_EST;
% Estimated controller delay
CONTROL_DELAY_EST           = INPUT.CONTROL_DELAY_EST;

PARA.SENSING_DELAY_EST     	= SENSING_DELAY_EST;
PARA.CONTROL_DELAY_EST      = CONTROL_DELAY_EST;

%% Planning and Execution Horizon
% excution time (s)
EXECUTION_TIME           	= INPUT.EXECUTION_TIME;
% planning time (s)
PLANNING_TIME               = INPUT.PLANNING_TIME;
% planning distance (m)
PLANNING_DIST               = U_INIT*PLANNING_TIME;

if EXECUTION_TIME > PLANNING_TIME
    disp('error: EXECUTION_TIME should be smaller than PLANNING_TIME')
    ERROR                   = true;
    return;
end

PARA.EXECUTION_TIME         = EXECUTION_TIME;
PARA.PLANNING_TIME          = PLANNING_TIME;
PARA.PLANNING_DIST          = PLANNING_DIST;

%% LIDAR
% check whether LIDAR detection range is enough or not
LR_THLD                     = (PLANNING_TIME + SENSING_DELAY_EST + CONTROL_DELAY_EST)*U_INIT;

if INPUT.LASER_RANGE < LR_THLD
    disp(['error: LASER_RANGE should be larger than ', num2str(LR_THLD) ,'m'])
    ERROR                   = true;
    return;
end

PARA.LASER_RANGE            = INPUT.LASER_RANGE;
PARA.ANGULAR_RES            = INPUT.ANGULAR_RES;
