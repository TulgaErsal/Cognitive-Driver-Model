function LI = LIDAR_MODEL(SPEC, TST)

% Simulated LIDAR with potential sensing delay

% In the simulation, the LIDAR model is used to get the detection data
% at the position where the vehicle locates SPEC.SENSING_DELAY seconds
% ago to simulate the delay.

LI.LR = SPEC.LASER_RANGE;
LI.AR = SPEC.ANGULAR_RES;

% position of the vehicle where the LIDAR data is obtained
if SPEC.SENSING_DELAY > 0
    
    % time when the LIDAR data is obtained
    LI.T            = TST.TIME_PRE - SPEC.SENSING_DELAY;
    
    if LI.T <= 0
        LI.VP(1)  	= TST.X_SEQ(1);
        LI.VP(2)  	= TST.Y_SEQ(1);
        LI.HA       = TST.A_SEQ(1);
    else
        LI.VP(1)    = interp1f(TST.T_SEQ, TST.X_SEQ, LI.T, 'linear');
        LI.VP(2)    = interp1f(TST.T_SEQ, TST.Y_SEQ, LI.T, 'linear');
        LI.HA       = interp1f(TST.T_SEQ, TST.A_SEQ, LI.T, 'linear');
    end
else
    LI.VP(1)        = TST.STATES_INIT(1);
    LI.VP(2)        = TST.STATES_INIT(2);
    LI.HA           = TST.STATES_INIT(6);
end

if FRONT == 1
    % if the sensor is mounted in front of the vehicle
    RA      = LI.HA - pi/2;
    RM_L2G  = [   cos(RA),   sin(RA); -sin(RA),  cos(RA) ];
    LI.VP   = LI.VP + [0, SPEC.DATA_HMMWV.LA]*RM_L2G;
end

% LIDAR MODEL
[LI.ANGLE, LI.RANGE] = LIDAR(   LI.VP, ...
                                LI.HA, ...
                            	LI.LR, ...
                              	LI.AR, ...
                              	SPEC.MAP );