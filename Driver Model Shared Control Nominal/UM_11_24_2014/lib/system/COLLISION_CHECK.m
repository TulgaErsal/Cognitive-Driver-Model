function HIT = COLLISION_CHECK(SPEC, TST, SIM)

HIT         = false;

% check for collision
X_SEQ       = TST.ST(:, 1);
Y_SEQ       = TST.ST(:, 2);

OBS         = SPEC.MAP.OBS;
DIST_i      = inf*ones(length(X_SEQ),1);

if ~isempty(OBS(1).PTS)
    for i = 1:length(X_SEQ)
        DIST_j = inf*ones(1, length(OBS));
        for j = 1:length(OBS)
            NLS = length(OBS(j).PTS(:, 1)) - 1;
            DIST_k = inf*ones(1, NLS);
            for k = 1:NLS
                DIST_k(k) = point_lineseg_dist([X_SEQ(i), Y_SEQ(i)], OBS(j).PTS(k,:), OBS(j).PTS(k+1,:));
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

if HIT == true
    disp('* Vehicle hits the obstacle.')
    disp('* Simulation terminated.')

    if SIM.LOGS == YES
        fprintf(SIM.fid, '!! Vehicle hits the obstacle.\n');
        fprintf(SIM.fid, '!! Simulation terminated.\n');
    end
end

% A_SEQ = STATE(:, 6);
% for i = length(X_SEQ):-10:1
%     PTS = VEHICLE_SHAPE(X_SEQ(i), Y_SEQ(i), A_SEQ(i));
% 
%     OBS = SPEC.MAP.OBS;
%     if ~isempty(OBS(1).PTS)
%         for j = 1:length(OBS)
%             [XI, ~, ~, ~] = intersections(PTS(:, 1), PTS(:, 2), OBS(j).PTS(:, 1), OBS(j).PTS(:, 2));
% 
%             if ~isempty(XI)
%                 figure(4)
%                 hold on
%                 patch(PTS(:, 1), PTS(:, 2), 'r')
%                 pause
%                 HIT = true;
%                 break;
%             end
%         end
%     end
% 
%     if HIT == true;
%         break;
%     end
% end