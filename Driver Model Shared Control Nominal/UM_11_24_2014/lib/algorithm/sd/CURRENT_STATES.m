function VCS = CURRENT_STATES(PARA, OBS, CMP, SIM)

% get initial states for planning

% vehicle controller delay is compensated by shifting the initial states
% Tdc seconds later using a high-fidelity vehicle model
if PARA.CONTROL_DELAY_EST ~= 0
    [STATES_INIT, SA_INIT, SR_INIT, AX_INIT] ...
                        = RUN_14DoF_CD(PARA, OBS, CMP);
else
    STATES_INIT         = OBS.STATES_INIT;
    SA_INIT             = CMP.CMD_SA(1);
    SR_INIT             = CMP.CMD_SR(1);
    AX_INIT             = CMP.CMD_AX(1);
end

% initial states
VCS.STATES_INIT         = STATES_INIT;
% vehicle position
VCS.VP                  = STATES_INIT(1:2);
% vehicle heading angle
VCS.HA                  = STATES_INIT(6);       

% coordinate transformation: LIDAR is mounted in front
if FRONT == 1
    LA                  = PARA.DATA_HMMWV_MODEL.LA;
    RA                  = VCS.HA - pi/2;
    RM_L2G              = [ cos(RA), sin(RA); - sin(RA), cos(RA) ];
    VCS.VP              = VCS.VP + [0, LA]*RM_L2G;
end

% initial states for the single track vehicle model
VCS.X0                  = STATES_INIT(1);
VCS.Y0                  = STATES_INIT(2);
VCS.V0                  = STATES_INIT(8);
VCS.R0                  = STATES_INIT(12);
VCS.PSI0                = STATES_INIT(6);
VCS.U0                  = STATES_INIT(7);

% initial steering angle
VCS.SA0                 = SA_INIT;  
% initial steering rate
VCS.SR0                 = SR_INIT;
% initial acceleration
VCS.AX0                 = AX_INIT;

% distance to goal
VCS.DIST2GOAL           = sqrt(  (PARA.VP_GOAL(2) - VCS.VP(2))^2 +...
                                 (PARA.VP_GOAL(1) - VCS.VP(1))^2);
% angle to goal
VCS.ANGLE2GOAL          = atan2( (PARA.VP_GOAL(2) - VCS.VP(2)), ...
                                 (PARA.VP_GOAL(1) - VCS.VP(1)));
                             
% vehicle projected position
VCS.VPP                 = VCS.VP + VCS.DIST2GOAL*[cos(VCS.HA), sin(VCS.HA)];

% planning distance for analysis of LIDAR detection
if VCS.DIST2GOAL < PARA.PLANNING_DIST
    VCS.PLANNING_DIST   = VCS.DIST2GOAL;
else
    VCS.PLANNING_DIST   = PARA.PLANNING_DIST;
end

% vehicle heading angle in local coordinate
PSI0_LOCAL              = pi/2;

% rotation matrix: global coordinates to local coordinates
RA                      = PSI0_LOCAL - VCS.HA; % rotation angle
VCS.RM_G2L              = [ cos(RA), sin(RA); - sin(RA), cos(RA) ];

% rotation matrix: local coordinates to global coordinates
RA                      = VCS.HA - PSI0_LOCAL; % rotation angle
VCS.RM_L2G              = [ cos(RA), sin(RA); - sin(RA), cos(RA) ];

% goal position in local coordinate
VCS.VP_GOAL_LOCAL       = (PARA.VP_GOAL - VCS.VP) * VCS.RM_G2L;

% goal heading in local coordinate 
if ~isempty(PARA.HA_GOAL)
    VCS.HA_GOAL_LOCAL   = PARA.HA_GOAL + PSI0_LOCAL - VCS.HA;
else
    VCS.HA_GOAL_LOCAL   = [];
end

% two extreme trajectories
XTM                     = RUN_3DOF_XTM(PARA, VCS);

VCS.XTM                 = XTM;
VCS.ANGLE_MIN           = XTM.R.AG - 5*pi/180; %#THLD#
VCS.ANGLE_MAX           = XTM.L.AG + 5*pi/180; %#THLD#

if (abs(XTM.T_TOTAL - PARA.PLANNING_TIME) < 1e-6 && (VCS.ANGLE_MIN > pi/2 || VCS.ANGLE_MAX < pi/2 || VCS.ANGLE_MIN > VCS.ANGLE_MAX)) || ...
   (abs(XTM.T_TOTAL - PARA.PLANNING_TIME) > 1e-6 && VCS.ANGLE_MIN > VCS.ANGLE_MAX)
    VCS.ANGLE_MIN
    VCS.ANGLE_MAX
    error('CURRENT_STATES')
end

VCS.XLB                 = - VCS.PLANNING_DIST * 1.1; %#THLD#
VCS.XUB                 =   VCS.PLANNING_DIST * 1.1; %#THLD#
VCS.YLB                 =   0 - 1;                   %#THLD#
VCS.YUB                 =   VCS.PLANNING_DIST * 1.1; %#THLD#

VCS.VLB                 = min([XTM.L.ST(:, 3); XTM.R.ST(:, 3)]) * 1.1; %#THLD#
VCS.VUB                 = max([XTM.L.ST(:, 3); XTM.R.ST(:, 3)]) * 1.1; %#THLD#
VCS.RLB                 = min([XTM.L.ST(:, 4); XTM.R.ST(:, 4)]) * 1.1; %#THLD#
VCS.RUB                 = max([XTM.L.ST(:, 4); XTM.R.ST(:, 4)]) * 1.1; %#THLD#

VCS.PLB                 = 0;
VCS.PUB                 = pi;
%--------------------------------------------------------------------------

if DEBUG == 1
    if FRONT == 1
        figure(2)
        hold on;
        
        RA              = VCS.HA - pi/2;
        VCS.RM_L2G      = [ cos(RA),   sin(RA); -sin(RA), cos(RA) ];
        
        XY1             = XTM.L.XY*VCS.RM_L2G;
        XY1(:, 1)       = XY1(:, 1) + VCS.VP(1);
        XY1(:, 2)       = XY1(:, 2) + VCS.VP(2);
        
        plot(XY1(:, 1), XY1(:, 2), 'k', 'LineWidth', 3)

        XY2             = XTM.R.XY*VCS.RM_L2G;
        XY2(:, 1)       = XY2(:, 1) + VCS.VP(1);
        XY2(:, 2)       = XY2(:, 2) + VCS.VP(2);
        
        plot(XY2(:, 1), XY2(:, 2), 'k', 'LineWidth', 3)
    else
        figure(2)
        hold on;
        
        plot(XTM.L.XY(:, 1), XTM.L.XY(:, 2), 'k', 'LineWidth', 3)
        plot(XTM.R.XY(:, 1), XTM.R.XY(:, 2), 'k', 'LineWidth', 3)
    end
end

if SIM.FIG1 == YES
    figure(1)
    plot(VCS.VP(1), VCS.VP(2),'o','Color',SIM.C10(1,:))
end

if SIM.FIG2 == YES
    figure(2)
    plot(VCS.VP(1), VCS.VP(2),'o','Color',SIM.C10(1,:))
end

if SIM.FIG3 == YES
    figure(3)
    plot(VCS.VP(1), VCS.VP(2),'o','Color',SIM.C10(1,:))
end

if SIM.FIG4 == YES
    figure(4)
    plot(VCS.VP(1), VCS.VP(2),'o','Color',SIM.C10(1,:))
end

if SIM.LOGS == YES
    fprintf(SIM.fid, '## MPC-based Obstacle Avoidance:\n');
    fprintf(SIM.fid, '\n');
    fprintf(SIM.fid, '# Optimization initial states:\n');
    formatSpec = '\t Position: \t \t \t \t \t(%3.2f, %3.2f) m \n';
    fprintf(SIM.fid, formatSpec, VCS.VP(1), VCS.VP(2));
    formatSpec = '\t Heading Angle: \t \t \t %3.1f deg \n';
    fprintf(SIM.fid, formatSpec, VCS.HA*180/pi);
    formatSpec = '\t Yaw Rate: \t \t \t \t \t %3.2f deg/s \n';
    fprintf(SIM.fid, formatSpec, VCS.R0*180/pi);
    formatSpec = '\t Longitudinal Speed: \t \t %2.2f m/s \n';
    fprintf(SIM.fid, formatSpec, VCS.U0);
    formatSpec = '\t Lateral Speed: \t \t \t %2.2f m/s \n';
    fprintf(SIM.fid, formatSpec, VCS.V0);
    formatSpec = '\t Initial Steering Angle: \t %3.2f deg \n';
    fprintf(SIM.fid, formatSpec, VCS.SA0*180/pi);
    fprintf(SIM.fid, '\n');
end