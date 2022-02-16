function CHECK = LIDAR_CheckInside(TRAJECTORY, PTS)

IN = inpolygonf(TRAJECTORY(:,1), TRAJECTORY(:,2), PTS(:,1), PTS(:,2));

MARGIN = 5;

if length(IN) < 2* MARGIN + 1
    TMP = find(IN == 0);
else
    TMP = find(IN(MARGIN : length(IN) - MARGIN) == 0);
end

if ~isempty(TMP)
    CHECK = false;
else
    CHECK = true;
end


