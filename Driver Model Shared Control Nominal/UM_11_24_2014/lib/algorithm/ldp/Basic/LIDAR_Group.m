function [OBSI, OBEI, OPSI, OPEI] = LIDAR_Group(RANGE, LASER_RANGE)

% OBSI: start indexes of obstacles
% OBEI: end indexes of obstacles
% OPSI: start indexes of openings
% OPEI: end indexes of openings

IND     = (LASER_RANGE - 0.1) - RANGE;
IND     = sign(IND);
IND     = max(IND, 0);

TMP     = diff([0 IND 0]);
OBSI    = find(TMP == 1);
OBEI    = find(TMP == -1);
OBEI    = OBEI - 1;

TMP     = diff([0 1-IND 0]);
OPSI    = find(TMP == 1);
OPEI    = find(TMP == -1);
OPEI    = OPEI - 1;