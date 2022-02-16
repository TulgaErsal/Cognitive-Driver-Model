clc;

XX = RESULT.STATE(:, 1);
YY = RESULT.STATE(:, 2);
AA = RESULT.STATE(:, 6);

% time to target
T_FINAL_1   = RESULT.TIME(end);
T_FINAL_2   = norm(RESULT.STATE(end, 1:2) - INPUT.VP_GOAL)/RESULT.STATE(end, 7);
T_FINAL     = T_FINAL_1 + T_FINAL_2;

disp(['Time to target is ', num2str(T_FINAL), ' s'])

% trajectory length
LENGTH = sqrt(diff(XX).^2 + diff(YY).^2);
TOTAL_LENGTH = sum(LENGTH);

disp(['Trajectory length is ', num2str(TOTAL_LENGTH), ' m'])

% minimum tire vertical load
MINFZ = min(min(RESULT.VERTICAL_LOAD));

disp(['Minimum tire vertical load is ', num2str(MINFZ), ' N'])

% control effort
CE = trapz(RESULT.TIME, abs(RESULT.STEERING_ANGLE*180/pi));

disp(['Control effort is ', num2str(CE), ' degree-s'])

% curvature
Curvature = LineCurvature2D([XX, YY]);
IDX = find(isnan(Curvature));
T_CVT = RESULT.TIME;
Curvature(IDX) = [];
T_CVT(IDX) = [];

CUM_CURV = trapz(T_CVT, abs(Curvature));

disp(['Cumulative curvature is ', num2str(CE), ' s/m'])

% minimum distance to obstacle
OBS         = INPUT.MAP.OBS;
DIST_i      = inf*ones(length(XX),1);

if ~isempty(OBS(1).PTS)
    for i = 1:length(XX)
        DIST_j = inf*ones(1, length(OBS));
        for j = 1:length(OBS)
            NLS = length(OBS(j).PTS(:, 1)) - 1;
            DIST_k = inf*ones(1, NLS);
            for k = 1:NLS
                DIST_k(k) = point_lineseg_dist([XX(i), YY(i)], OBS(j).PTS(k,:), OBS(j).PTS(k+1,:));
            end
            DIST_j(j) = min(DIST_k);
        end
        DIST_i(i) = min(DIST_j);
    end
end

[MINDIST, IDX] = min(DIST_i);

figure
DISPLAY_MAP(INPUT.MAP.BDY, INPUT.MAP.OBS)
plot(RESULT.X, RESULT.Y,'k','LineWidth',2)
plot(XX(IDX), YY(IDX), 'ro')

disp(['Minimum distance to obstacle is ', num2str(MINDIST), ' m'])

DIST_i      = inf*ones(length(XX),1);
if ~isempty(OBS(1).PTS)
    for i = 1:length(XX)
        DIST_j = inf*ones(1, length(OBS));
        for j = 1:length(OBS)
            VPTS = VEHICLE_SHAPE(XX(i), YY(i), AA(i));
            P1.x = VPTS(:, 1);
            P1.y = VPTS(:, 2);
            P2.x = OBS(j).PTS(:,1);
            P2.y = OBS(j).PTS(:,2);
            DIST_j(j) = polygons_min_dist(P1, P2);
        end
        DIST_i(i) = min(DIST_j);
   	end
end

[MINDIST, IDX] = min(DIST_i);
figure
DISPLAY_MAP(INPUT.MAP.BDY, INPUT.MAP.OBS)
plot(RESULT.X, RESULT.Y,'k','LineWidth',2)
VPTS = VEHICLE_SHAPE(XX(IDX), YY(IDX), AA(IDX));
patch(VPTS(:, 1), VPTS(:, 2), 'r')