function [ANGLE_OUT,RANGE_OUT] = LIDAR(VP, HA, LASER_RANGE, ANGULAR_RES, MAP)

% Simulated LIDAR

% make sure the position of VP is feasible before calling this function

% VP: vehicle position
% HA: vehicle heading angle
% ANGULAR_RES Unit: Degree
% ANGLE       Unit: Radian

ANGULAR_RES     = ANGULAR_RES*pi/180;
ANGLE           = 0:ANGULAR_RES:(2*pi-ANGULAR_RES);
RANGE           = zeros(size(ANGLE));

for i = 1:length(ANGLE)
    X_RAY = VP(1) + [0; LASER_RANGE*cos(ANGLE(i))];
    Y_RAY = VP(2) + [0; LASER_RANGE*sin(ANGLE(i))];
    
    % intersection points
    MAX_ITS = 100; %#THLD# maximum number of intersection points
    X_ITS   = NaN*ones(MAX_ITS, 1);
    Y_ITS   = NaN*ones(MAX_ITS, 1);
    CNT     = 0;
    
    % [XI, YI] = intersections(X_RAY, Y_RAY, MAP.BDY(:, 1), MAP.BDY(:, 2));
    [XI, YI] = intersections_coder(X_RAY, Y_RAY, MAP.BDY(:, 1), MAP.BDY(:, 2));
    
    for k = 1:length(XI)
        CNT = CNT + 1;
        X_ITS(CNT) = XI(k);
        Y_ITS(CNT) = YI(k);
    end
    
    if ~isempty(MAP.OBS(1).PTS)
        for j = 1:length(MAP.OBS)
            % [XI, YI] = intersections(X_RAY, Y_RAY, MAP.OBS(j).PTS(:, 1), MAP.OBS(j).PTS(:, 2));
            [XI, YI] = intersections_coder(X_RAY, Y_RAY, MAP.OBS(j).PTS(:, 1), MAP.OBS(j).PTS(:, 2));
            
            for k = 1:length(XI)
                CNT = CNT + 1;
                X_ITS(CNT) = XI(k);
                Y_ITS(CNT) = YI(k);
            end
        end
    end

    X_ITS = X_ITS(1:CNT);
    Y_ITS = Y_ITS(1:CNT);
    
    if CNT > 0
        
        DIST = zeros(1, length(X_ITS));
        
        for j = 1:length(X_ITS)
            DIST(j) = norm([X_ITS(j) - VP(1), Y_ITS(j) - VP(2)]);
        end
        
        RANGE(i) = min(DIST);
    else
        RANGE(i) = LASER_RANGE;
    end
end

% including the heading angle
% only the front of the vehicle is scanned
% START_ANGLE range should be 0 to 360-ANGULAR_RES
START_ANGLE     = HA - pi/2;
START_ANGLE     = mod(START_ANGLE, pi*2);

% range of START_IDX should be 1 to 360/ANGULAR_RES
START_IDX       = floor(START_ANGLE/ANGULAR_RES) + 1;

IDX_180         = pi/ANGULAR_RES;
IDX_360         = 2*pi/ANGULAR_RES;

if START_IDX >= 1 && START_IDX <= IDX_180
    IDX_OUT     = START_IDX:1:START_IDX+IDX_180;
    ANGLE_OUT   = (IDX_OUT-1)*ANGULAR_RES;
    RANGE_OUT   = RANGE(IDX_OUT);
elseif START_IDX > IDX_180;
    IDX_OUT     = [START_IDX:1:IDX_360,1:1:(START_IDX-IDX_180)];
    ANGLE_OUT   = (IDX_OUT-1)*ANGULAR_RES;
    RANGE_OUT   = RANGE(IDX_OUT);
else
    ANGLE_OUT   = [];
    RANGE_OUT   = [];
end

% the output is in vehicle's local coordinates
ANGLE_OUT       = ANGLE_OUT - HA;
ANGLE_OUT       = mod(ANGLE_OUT, pi*2);
