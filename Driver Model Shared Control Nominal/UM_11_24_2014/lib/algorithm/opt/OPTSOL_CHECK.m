function CHECK = OPTSOL_CHECK(TRAJECTORY, FINAL_HA, MINDIST_THLD, DIST2GOAL, LID, SIM)

% check the feasibility of the solution

% safe = true;

% polygon defining the safe region
XX1             = [LID.PTS(:,1); LID.PTS(1,1)];
YY1             = [LID.PTS(:,2); LID.PTS(1,2)];

% line along the final heading angle passing through the final position
XEND            = TRAJECTORY(end, 1);
YEND            = TRAJECTORY(end, 2);
XX2             = XEND + [-5, 1.2*LID.LR]*cos(FINAL_HA); %#THLD#
YY2             = YEND + [-5, 1.2*LID.LR]*sin(FINAL_HA); %#THLD#

% find the closest intersection point that is closest to the final position
[XI, YI, ~, ~]  = intersections(XX1, YY1, XX2, YY2, true);

if length(XI) > 1
    DIST        = (XI - XEND).^2 + (YI - YEND).^2;
    [~, IDX]    = min(DIST);
    XI          = XI(IDX);
    YI          = YI(IDX);
end

% target angle
TA              = atan2((YI - LID.VP(2)), (XI - LID.VP(1)));
TA              = mod(TA, 2*pi);
if 2*pi - TA < 0.01*pi
    TA = 0;
end

if isempty(TA)
    CHECK = false;
else
    if (TA == 0) || (TA == pi) || (TA == 2*pi)
        % if the intersection point is on the line passing throught the
        % vehicle initial position
        CHECK       = true;
    else
        LA          = mod((LID.ANGLE + LID.HA), 2*pi); % LIDAR angle
        LI_RANGE    = interp1f(LA, LID.RANGE, TA, 'linear');

        if LI_RANGE >= min(LID.LR - 1, DIST2GOAL - 0.5) %#THLD#
            CHECK   = true;
        else
            CHECK   = false;
        end
    end
end

if SIM.LOGS == YES
    if CHECK == true
        fprintf(SIM.fid, '\t Pointing to: opening\n');
    else
        fprintf(SIM.fid, '\t Pointing to: obstacle\n');
    end
end

if CHECK == true
    [CHECK, MINDIST] = LIDAR_CheckDist(TRAJECTORY, LID.PTS_OB, MINDIST_THLD);
    
    if SIM.LOGS == YES
        if CHECK == true
            fprintf(SIM.fid, '\t Distance: enough\n');
        else
            formatSpec = '\t Distance: too close (%5.5f m)\n';
            fprintf(SIM.fid, formatSpec, MINDIST);
        end
        fprintf(SIM.fid, '\n');
    end
end