function PTS = LIDAR_PTS_OB(VP, HA, ANGLE, RANGE, LASER_RANGE)

IND         = (LASER_RANGE - 0.1) - RANGE; %#THLD#
IND         = sign(IND);
IND         = max(IND, 0);
IDX         = find(IND == 0);

ANGLE(IDX)  = [];
RANGE(IDX)  = [];

if ~isempty(ANGLE)
    X       = VP(1) + RANGE.*cos(ANGLE + HA);
    Y       = VP(2) + RANGE.*sin(ANGLE + HA);
    PTS     = [X',Y'];
else
    PTS     = [];
end