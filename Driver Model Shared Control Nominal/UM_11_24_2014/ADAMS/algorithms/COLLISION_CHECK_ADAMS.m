function HIT = COLLISION_CHECK_ADAMS(SPEC, TST)

HIT         = false;

% check for collision
X_SEQ       = TST.X_SEQ;
Y_SEQ       = TST.Y_SEQ;

OBST        = SPEC.MAP.OBS;
DIST_i      = inf*ones(length(X_SEQ),1);

if ~isempty(OBST(1).PTS)
    for i = 1:length(X_SEQ)
        DIST_j = inf*ones(1, length(OBST));
        for j = 1:length(OBST)
            NLS = length(OBST(j).PTS(:, 1)) - 1;
            DIST_k = inf*ones(1, NLS);
            for k = 1:NLS
                DIST_k(k) = point_lineseg_dist([X_SEQ(i), Y_SEQ(i)], OBST(j).PTS(k,:), OBST(j).PTS(k+1,:));
            end
            DIST_j(j) = min(DIST_k);
        end
        DIST_i(i) = min(DIST_j);
    end
end

MINDIST = min(DIST_i);

%#CHECK#
MINDIST_THLD = 2.5; %#THLD#

if MINDIST < MINDIST_THLD
    HIT = true;
end