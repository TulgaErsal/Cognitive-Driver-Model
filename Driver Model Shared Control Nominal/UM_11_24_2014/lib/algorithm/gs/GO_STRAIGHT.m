function GS = GO_STRAIGHT(PARA, VCS, LID)

% thresholds
% FG: Facing the Goal
GS.FG_THLD  = PARA.DIST2GOAL_THLD; %#THLD#
% AD: Angle Difference
GS.AD_THLD  = pi/180; %#THLD#
% NO: No Obstacle
GS.AT    	= 30*pi/180; % AT: Angle Threshold
GS.NO_THLD  = min(LID.LR - 1, VCS.DIST2GOAL); %#THLD#

% values
GS.FG       = norm(PARA.VP_GOAL - VCS.VPP);

GS.CA      	= mod(VCS.HA, 2*pi); % CA: Current heading Angle
GS.AD       = 0;
if ~isempty(PARA.HA_GOAL)
    GS.FA  	= mod(PARA.HA_GOAL, 2*pi); % FA: required Final heading Angle
    GS.AD  	= abs(GS.CA - GS.FA);
end

GS.LA      	= mod((LID.ANGLE + pi/2), 2*pi); % LA: Lidar Angle
GS.AR     	= linspace(pi/2 - GS.AT, pi/2 + GS.AT, 100); % AR: Angle Range
GS.NO       = interp1f(GS.LA, LID.RANGE, GS.AR, 'linear');
GS.NO       = min(GS.NO);

% criteria
if GS.FG <= GS.FG_THLD && GS.AD <= GS.AD_THLD && GS.NO >= GS.NO_THLD
    GS.CHECK  = true;
else
    GS.CHECK  = false;
end