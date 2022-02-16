function PTS = LIDAR_PTS(VP, HA, ANGLE, RANGE)

X   = VP(1) + RANGE.*cos(ANGLE + HA);
Y   = VP(2) + RANGE.*sin(ANGLE + HA);

PTS = [X',Y'];