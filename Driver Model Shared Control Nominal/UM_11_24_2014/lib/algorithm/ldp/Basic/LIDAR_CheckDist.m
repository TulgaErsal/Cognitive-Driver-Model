function [CHECK, MINDIST] = LIDAR_CheckDist(TRAJECTORY, PTS_OB, MINDIST_THLD)

MINDIST = inf;

CHECK   = true;
if ~isempty(PTS_OB)
    N = size(TRAJECTORY,1);
    MINDIST = zeros(1, N);
    for i = 1:N;
        DIST = sqrt((PTS_OB(:,1) - TRAJECTORY(i,1)).^2 + ...
                    (PTS_OB(:,2) - TRAJECTORY(i,2)).^2);
        MINDIST(i) = min(DIST);
    end
    
    MINDIST = min(MINDIST);

    if MINDIST < MINDIST_THLD
        CHECK = false;
    end
end