function LID = LIDAR_DATA(LIO, PARA, OBS, SIM)

ANGLE               = LIO.ANGLE;    % - angle sequence in local coordinates
RANGE               = LIO.RANGE;    % - distance to closest obstacle
AR                  = LIO.AR;       % - angular resolution
LR                  = LIO.LR;       % - LIDAR detection range

% modify the original LIDAR data to make them seem like to be
% obtained using a LIDAR of reduced range (minimum necessary range)

% minimum necessary range
LR_REQUIRED         = ( PARA.PLANNING_TIME + ...
                        PARA.SENSING_DELAY_EST + ...
                        PARA.CONTROL_DELAY_EST ) * PARA.U_MAX;
% a small margin
LR_MARGIN           = 0.5*PARA.U_MAX; %#THLD#
LR_REQUIRED         = LR_REQUIRED + LR_MARGIN;

if  LR_REQUIRED < PARA.LASER_RANGE
    LID.AR          = AR;
    LID.LR          = LR_REQUIRED;
    LID.ANGLE       = ANGLE;
    LID.RANGE       = [];
    for i = 1:length(RANGE)
        LID.RANGE(i) = min([RANGE(i), LID.LR]);
    end
else
    LID.AR          = AR;
    LID.LR          = LR;
    LID.ANGLE       = ANGLE;
    LID.RANGE       = RANGE;
end

% use the PARA.SENSING_DELAY_EST to estimate the position and the heading 
% angle of the vehicle where the sensor

if  PARA.SENSING_DELAY_EST > 0
    LID.T           = OBS.TIME_PRE - PARA.SENSING_DELAY_EST;
    
    if LID.T < 0
        LID.VP(1)   = OBS.STATES_INIT(1);
        LID.VP(2)   = OBS.STATES_INIT(2);
        LID.HA      = OBS.STATES_INIT(6);
    else
        LID.VP(1) 	= interp1f(OBS.T_SEQ, OBS.X_SEQ, LID.T, 'linear');
        LID.VP(2) 	= interp1f(OBS.T_SEQ, OBS.Y_SEQ, LID.T, 'linear');
        LID.HA   	= interp1f(OBS.T_SEQ, OBS.A_SEQ, LID.T, 'linear');
    end
else
    LID.VP(1)       = OBS.STATES_INIT(1);
    LID.VP(2)       = OBS.STATES_INIT(2);
    LID.HA          = OBS.STATES_INIT(6);
end

if FRONT == 1
    LA           	= PARA.DATA_HMMWV_MODEL.LA;
    RA              = LID.HA - pi/2;
    RM_L2G          = [ cos(RA), sin(RA); - sin(RA), cos(RA) ];
    LID.VP          = LID.VP + [0, LA]*RM_L2G;
end

% - points in Cartesian coordinates
LID.PTS             = LIDAR_PTS(LID.VP, LID.HA, LID.ANGLE, LID.RANGE);

% - points representing the obstacles
LID.PTS_OB          = LIDAR_PTS_OB(LID.VP, LID.HA, LID.ANGLE, LID.RANGE, LID.LR);

% - group obstacles and openings
[LID.OBSI, LID.OBEI, LID.OPSI, LID.OPEI] = LIDAR_Group(LID.RANGE, LID.LR);

% -------------------------------------------------------------------------
SIM.FIG1_LIDAR      = YES;
SIM.FIG2_LIDAR      = YES;
SIM.FIG3_LIDAR      = YES;
FIGURE_LIDAR(SIM, LID, SIM.C10(7,:));