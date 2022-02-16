function INFO_C1 = LIDAR_DP_MGSECT2(IPT, LIMG, INFO, SIM)

ACTIVE      = false;

filename    = mfilename;
filename    = strrep(filename, '_', ' ');

if SIM.LOGS == YES
    fprintf(SIM.fid, '+ Merge small obstacles\n');
end

% copy inputs to be used as outputs
SECINFO     = INFO.SECINFO;
END_PTS     = INFO.END_PTS;
EP_LOCAL    = INFO.EP_LOCAL;
EP_POLAR    = INFO.EP_POLAR;

LIDPT_X     = [LIMG.PTS(:,1); LIMG.PTS(1,1)];
LIDPT_Y     = [LIMG.PTS(:,2); LIMG.PTS(1,2)];

%% Remove twisted small openings and obstacles

% replace consecutive small sectors including openings
% by an hypothetical opening

% initialize the loop
LOOP                = true; 

while(LOOP == true)
    LOOP            = false;

    % size of the sectors
    SZ              = SECTOR_SIZE(EP_POLAR);
    
    % find sectors whose size are smaller than the threshold
    IND             = SZ <= 2*pi/180; %#THLD#

    % find the consecutive ones
    TMP             = diff([0 IND' 0]);
    SI              = find(TMP == 1);
    EI              = find(TMP == -1);
    EI              = EI - 1;
    
    if ~isempty(SI)

    for i = 1:length(SI)
        
    % check whether there is an opening included in the sequence or not
    CHECK1          = SECINFO(SI(i):EI(i), 5) == -1;
        
    % at least two consecutive sectors are small
    if EI(i) - SI(i) + 1  >= 2 && sum(CHECK1) >= 1
        
        % points defining the line segments
        LN_PTS      = [EP_LOCAL(SI(i):EI(i),1:2); EP_LOCAL(EI(i),3:4)];

        % list of lines
        LN_N        = length(LN_PTS(:, 1));
        LN_LIST     = nchoosek(1:LN_N, 2);

        % sort the lines according to number of points in between
        [~, LN_IDX] = sort(abs(LN_LIST(:,2) - LN_LIST(:,1)), 'descend');
        LN_LIST     = LN_LIST(LN_IDX, :);
        
        LN_LIST     = LN_LIST(1:end - LN_N + 1, :);

        if DEBUG == 1
            figure
            title([filename, 'TWISTED'])
            hold on;
            plot(LN_PTS(:, 1), LN_PTS(:, 2), 'ko-')
            hold off;
        end
        
        % safe region in local coordinate
        X2          = LIDPT_X;
        Y2          = LIDPT_Y;
        X2          = X2 - IPT.VP(1);
        Y2          = Y2 - IPT.VP(2);
        REG2        = [X2, Y2] * IPT.RM_G2L;
        X2          = REG2(:, 1);
        Y2          = REG2(:, 2);

        % find the line that will remove the most sectors
        for j = 1:length(LN_LIST(:, 1))
            % line connection
            X1      = LN_PTS(LN_LIST(j, :), 1);
            Y1      = LN_PTS(LN_LIST(j, :), 2);
            [X1_SEQ, Y1_SEQ] = line_segment_seq([X1(1), Y1(1)], [X1(2), Y1(2)], 100); %#THLD#

            % line in polygon
            IN      = inpolygonf(X1_SEQ, Y1_SEQ, X2, Y2);
            
            RM_IDX  = min(LN_LIST(j, :)) : max(LN_LIST(j, :)) - 1;
            RM_IDX  = RM_IDX + SI(i) - 1;
            
            CHECK2  = SECINFO(RM_IDX, 5) == -1;
            
            if DEBUG == 1
                hold on;
                plot(X1_SEQ, Y1_SEQ, 'ro')
                % plot(X2, Y2, 'g')
                plot(X1_SEQ(IN), Y1_SEQ(IN), 'm.','Markersize',5)
                hold off;
            end
            
            % if most of the line is within the safe region
            % and at least one sector is an opening
            
            if sum(IN)/length(X1_SEQ) >= 0.95 && sum(CHECK2) >= 1 %#THLD#
                
               ACTIVE = true;

               if SIM.LOGS == YES
                    fprintf(SIM.fid, '\t --------------------\n');
                    fprintf(SIM.fid, '\t Consecutive small sectors \n');
                    formatSpec = '\t S%3.0f modified\n';
                    fprintf(SIM.fid, formatSpec, SECINFO(RM_IDX(1), 1));
                    for k = RM_IDX(2):RM_IDX(end)
                        formatSpec = '\t S%3.0f removed\n';
                        fprintf(SIM.fid, formatSpec, SECINFO(k, 1));
                    end
                    fprintf(SIM.fid, '\t --------------------\n');
                    fprintf(SIM.fid, '\n');
                end

                % modify the first sector
                SECINFO(RM_IDX(1), 3)           = SECINFO(RM_IDX(end), 3);

                if SECINFO(RM_IDX(1), 4) == -1
                    SECINFO(RM_IDX(1), 4)       = max(SECINFO(:, 4)) + 1;
                end

                % set it as a hypothetical opening
                SECINFO(RM_IDX(1), 5)           = 0;

                END_PTS(RM_IDX(1), 3:4)         = END_PTS(RM_IDX(end), 3:4);

                [END_PTS, EP_LOCAL, EP_POLAR]	= MODIFY_SEC(IPT, END_PTS, EP_LOCAL, EP_POLAR, RM_IDX(1));

                % remove the rest of them
                SECINFO(RM_IDX(2:end),:)        = [];
                END_PTS(RM_IDX(2:end),:)        = [];
                EP_LOCAL(RM_IDX(2:end),:)       = [];
                EP_POLAR(RM_IDX(2:end),:)       = [];

                LOOP = true;

                if DEBUG == 1
                    figure
                    % axis equal
                    title([filename, ' - Merge Twisted'])
                    hold on;
                    plot(LIMG.DPTS(:,1), LIMG.DPTS(:,2),'k')
                    plot(LIMG.PTS(:,1), LIMG.PTS(:,2),'r')

                    SECTOR_LINE(SECINFO, END_PTS)
                    PLOT_LINE(END_PTS(RM_IDX(1), 1:2), END_PTS(RM_IDX(1), 3:4), '-', 'k', 5);
                    hold off;
                end

                break;  % break the for j = 1:length(LN_LIST(:, 1))

            end % if sum(IN)/length(X1_SEQ) >= 0.95 && sum(CHECK2) >= 1

        end % for j = 1:length(LN_LIST(:, 1))

        if LOOP == true
            break; % break the for i = 1:length(SI)
        end
            
    end % if EI(i) - SI(i) + 1  >= 2 && sum(CHECK1) >= 1
        
    end % for i = 1:length(SI)

    end % if ~isempty(SI)
    
end

%% Combine small obstacles to its adjacent

% initialize the loop
LOOP                    = true; 

while(LOOP == true)
    LOOP                = false;
    
    % number of sectors
    NSEC                = size(SECINFO, 1);

    % size of the sectors
    SZ                  = SECTOR_SIZE(EP_POLAR);
    
    % SECTOR_AREA = zeros(1, NSEC);
    % for i = 1:NSEC
    %     SECTOR_AREA(i) = triangle_area(END_PTS(i,1:2), END_PTS(i,3:4), END_PTS(i,5:6));
    % end
    % SECTOR_AREA_THLD = pi*LIM.LR^2*(3/360); %#THLD#

    % SECTOR_LENGTH = END_PTS(:,7);
    % % SECTOR_LENGTH_THLD = 2 + 2*IPT.MINDIST_THLD;
    % SECTOR_LENGTH_THLD = 10; %#THLD#
    
    if NSEC >= 3
        
    for i = 2:NSEC - 1
        
    %#THLD#
	if (SECINFO(i, 5) == 1 && SZ(i) < 3*pi/180)  || ...
       (SECINFO(i, 5) == 0 && SZ(i) ~= 0 && SZ(i) < 3*pi/180 && max(EP_POLAR(i, 3:4)) < 0.9*IPT.LASER_RANGE)

        % the next sector is smaller than the current one
        % wait until next cycle to combine
        
        if SZ(i+1) < SZ(i) && SECINFO(i+1, 5) == 1
            continue; % continue for i = 1:NSEC
        end
        
        if DEBUG == 1
            figure
            axis equal
            hold on;
            patch([END_PTS(i, 1), END_PTS(i, 3), END_PTS(i, 5)], ...
                  [END_PTS(i, 2), END_PTS(i, 4), END_PTS(i, 6)], ...
                  rand(3,1)', 'FaceAlpha', 0.2)
            patch([END_PTS(i-1, 1), END_PTS(i-1, 3), END_PTS(i-1, 5)], ...
                  [END_PTS(i-1, 2), END_PTS(i-1, 4), END_PTS(i-1, 6)], ...
                  rand(3,1)', 'FaceAlpha', 0.2)
            patch([END_PTS(i+1, 1), END_PTS(i+1, 3), END_PTS(i+1, 5)], ...
                  [END_PTS(i+1, 2), END_PTS(i+1, 4), END_PTS(i+1, 6)], ...
                  rand(3,1)', 'FaceAlpha', 0.2)
            hold off;
        end

        % type of the sector before
        T1              = SECINFO(i-1, 5);
        % type of the sector after
        T2              = SECINFO(i+1, 5);

        MARGIN          = 0.1; %#THLD#
        
        % intersection with previous sector
        PTS             = [ END_PTS(i-1, 1:2); END_PTS(i-1, 3:4); ...
                            END_PTS(i, 3:4); IPT.VP];
        I1              = linlinintersect(PTS);

        % shift intersection point a little bit for feasiblity checking
        DIST            = norm(END_PTS(i-1, 1:2) - I1);
        ANGLE           = atan2(I1(2) - END_PTS(i-1, 2), I1(1) - END_PTS(i-1, 1));
        if DIST > MARGIN
            I1_M(1)     = END_PTS(i-1,1) + (DIST - MARGIN)*cos(ANGLE);
            I1_M(2)     = END_PTS(i-1,2) + (DIST - MARGIN)*sin(ANGLE);
        else
            I1_M        = I1;
        end
        IN1             = inpolygonf(I1_M(1), I1_M(2), LIDPT_X, LIDPT_Y);
        
        if DEBUG == 1
            hold on;
            plot([PTS(1, 1), PTS(2, 1)], [PTS(1, 2), PTS(2, 2)], 'r', 'LineWidth', 2)
            plot([PTS(3, 1), PTS(4, 1)], [PTS(3, 2), PTS(4, 2)], 'r', 'LineWidth', 2)
            plot(I1(1), I1(2), 'ro');
            plot(I1_M(1), I1_M(2), 'ro');
            hold off;
        end

        % intersection with previous sector
        PTS             = [END_PTS(i+1,1:2); END_PTS(i+1,3:4); END_PTS(i, 1:2); IPT.VP];
        I2              = linlinintersect(PTS);

        % shift intersection point a little bit for feasiblity checking
        DIST            = norm(END_PTS(i+1,1:2) - I2);
        ANGLE           = atan2(I2(2) - END_PTS(i+1,2), I2(1) - END_PTS(i+1,1));
        if DIST > MARGIN
            I2_M(1)     = END_PTS(i+1,1) + (DIST - MARGIN)*cos(ANGLE);
            I2_M(2)     = END_PTS(i+1,2) + (DIST - MARGIN)*sin(ANGLE);
        else
            I2_M = I2;
        end
        IN2 = inpolygonf(I2_M(1), I2_M(2), LIDPT_X, LIDPT_Y);
        
        if DEBUG == 1
            hold on;
            plot([PTS(1, 1), PTS(2, 1)], [PTS(1, 2), PTS(2, 2)], 'b', 'LineWidth', 2)
            plot([PTS(3, 1), PTS(4, 1)], [PTS(3, 2), PTS(4, 2)], 'b', 'LineWidth', 2)
            plot(I2(1), I2(2), 'bo');
            plot(I2_M(1), I2_M(2), 'bo');
            hold off;
        end
        
        COMB_IDX            = [];
        
        if      T1 == 1 && T2 ~= 1 && IN1 == 1    
            COMB_IDX        = i - 1;
        elseif  T1 ~= 1 && T2 == 1 && IN2 == 1
            COMB_IDX        = i + 1;
        elseif  T1 == 1 && T2 == 1 && IN1 == 1 && IN2 ~= 1
            COMB_IDX        = i - 1;
        elseif  T1 == 1 && T2 == 1 && IN1 ~= 1 && IN2 == 1
            COMB_IDX        = i + 1;
        elseif  T1 == 1 && T2 == 1 && IN1 == 1 && IN2 == 1
            A1              = triangle_area(END_PTS(i,1:2), END_PTS(i,3:4), I1);
            A2              = triangle_area(END_PTS(i,1:2), END_PTS(i,3:4), I2);
            if A1 <= A2
                COMB_IDX    = i - 1;
            else
                COMB_IDX    = i + 1;
            end
        elseif  T1 == 1 && T2 == 1 && IN1 ~= 1 && IN2 ~= 1
        elseif  IN1 == 1 && IN2 ~= 1 && T1 ~= 1
            A1              = triangle_area(END_PTS(i,1:2), END_PTS(i,3:4), I1);
            if A1 < 0.01*polyarea(LIDPT_X, LIDPT_Y)
                COMB_IDX 	= i - 1;
            end
        elseif  IN1 ~= 1 && IN2 == 1 && T2 ~= 1
            A2              = triangle_area(END_PTS(i,1:2), END_PTS(i,3:4), I2);
            if A2 < 0.01*polyarea(LIDPT_X, LIDPT_Y)
                COMB_IDX 	= i + 1;
            end
        else
        end

        if ~isempty(COMB_IDX) && SECINFO(i, 5) == 1
            ACTIVE = true;
            
            LOOP  = true;

            % log
            if SIM.LOGS == YES
                fprintf(SIM.fid, '\t --------------------\n');
                if COMB_IDX == i-1
                    fprintf(SIM.fid, '\t S%3.0f combined to the right\n', SECINFO(i, 1));
                end
                if COMB_IDX == i+1
                    fprintf(SIM.fid, '\t S%3.0f combined to the left\n', SECINFO(i, 1));
                end
                formatSpec = '\t - S%3.0f removed\n';
                fprintf(SIM.fid, formatSpec, SECINFO(i, 1));
                formatSpec = '\t - S%3.0f modified\n';
                fprintf(SIM.fid, formatSpec, SECINFO(COMB_IDX, 1));
            end

            % modify
            if      COMB_IDX == i - 1
                END_PTS(i-1, 3:4)           = I1;
            elseif  COMB_IDX == i + 1
                END_PTS(i+1, 1:2)           = I2; 
            end
            
            [END_PTS, EP_LOCAL, EP_POLAR]   = MODIFY_SEC(IPT, END_PTS, EP_LOCAL, EP_POLAR, COMB_IDX);
            
            % remove
            SECINFO(i,:)   = [];
            END_PTS(i,:)   = [];
            EP_LOCAL(i,:)  = [];
            EP_POLAR(i,:)  = [];
            
            break;
        end
        
        %#UPDATE# 1104
        if ~isempty(COMB_IDX) && SECINFO(i, 5) == 0
            ACTIVE = true;
            
            % log
            if SIM.LOGS == YES
                fprintf(SIM.fid, '\t --------------------\n');
                if COMB_IDX == i-1
                    fprintf(SIM.fid, '\t S%3.0f combined to the right\n', SECINFO(i, 1));
                end
                if COMB_IDX == i+1
                    fprintf(SIM.fid, '\t S%3.0f combined to the left\n', SECINFO(i, 1));
                end
                formatSpec = '\t - S%3.0f modified\n';
                fprintf(SIM.fid, formatSpec, SECINFO(i, 1));
                formatSpec = '\t - S%3.0f modified\n';
                fprintf(SIM.fid, formatSpec, SECINFO(COMB_IDX, 1));
            end

            % modify
            if      COMB_IDX == i - 1
                END_PTS(i-1, 3:4)           = I1;
                END_PTS(i, 1:2)             = I1;
            elseif  COMB_IDX == i + 1
                END_PTS(i, 3:4)             = I2;
                END_PTS(i+1, 1:2)           = I2; 
            end
            
            [END_PTS, EP_LOCAL, EP_POLAR]   = MODIFY_SEC(IPT, END_PTS, EP_LOCAL, EP_POLAR, i);
            [END_PTS, EP_LOCAL, EP_POLAR]   = MODIFY_SEC(IPT, END_PTS, EP_LOCAL, EP_POLAR, COMB_IDX);
            
            EP_POLAR(i, 1)                  = EP_POLAR(i, 2);
        end
        
	end % if SECINFO(i, 5) == 1 && SZ(i) < 3*pi/180
        
    end % for i = 2:NSEC-1
        
    end % if NSEC >= 3
    
end

% % make the end points consistent
% for i = 1:NSEC
%     if SECINFO(i, 5) == 0
%         if i > 1
%             END_PTS(i,1:2)  = END_PTS(i-1,3:4);
%             EP_LOCAL(i,1:2) = EP_LOCAL(i-1,3:4);
%             EP_POLAR(i,1)   = EP_POLAR(i-1,2);
%             EP_POLAR(i,3)   = EP_POLAR(i-1,4);
%         end
%         if i < NSEC
%             END_PTS(i,3:4)  = END_PTS(i+1,1:2);
%             EP_LOCAL(i,3:4) = EP_LOCAL(i+1,1:2);
%             EP_POLAR(i,2)   = EP_POLAR(i+1,1);
%             EP_POLAR(i,4)   = EP_POLAR(i+1,3);
%         end
%     end
% end

if SIM.LOGS == YES
    fprintf(SIM.fid, '\t --------------------\n');
    fprintf(SIM.fid, '\n');
end

EP_POLAR            = EP_POLAR_CORRECT(EP_POLAR);

INFO_C1.SECINFO     = SECINFO;
INFO_C1.END_PTS  	= END_PTS;
INFO_C1.EP_LOCAL	= EP_LOCAL;
INFO_C1.EP_POLAR	= EP_POLAR;
INFO_C1.ACTIVE      = ACTIVE;

if ACTIVE == true;
    filename = mfilename;
    DEBUG_FIGURES(filename, IPT, LIMG, INFO_C1);
end
