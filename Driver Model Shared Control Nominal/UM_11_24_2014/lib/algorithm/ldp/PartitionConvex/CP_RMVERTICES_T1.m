function CVX_O = CP_RMVERTICES_T1(CVX)

%% Basic info
PTS         = CVX.PTS;
X_SEQ       = PTS(:, 1);
Y_SEQ       = PTS(:, 2);
AREA        = CVX.AREA;
AREA_THLD   = CVX.AREA_THLD;
SG_INFO     = CVX.SG_INFO;

NNode       = length(X_SEQ);

if CVX.LOGS == YES
    fid     = CVX.log_fid;
    fprintf(fid, '###########################################################################\n');
    fprintf(fid, '# List of polygon nodes:\n');
    fprintf(fid, 'IDX           x               y\n');
    fspec = '%d \t %10.2f \t %10.2f \n';
    for i = 1:NNode
        fprintf(fid, fspec, i, X_SEQ(i), Y_SEQ(i));
    end
    fprintf(fid, '\n');

    fprintf(fid, '# Polygon area: %10.2f \n\n', AREA);

    fprintf(fid, '# Line segments type:\n');
    fprintf(fid, '  PT1   PT2     TYPE\n');
    fspec = '%5.0d %5.0d \t %3.0f\n';
    for i = 1:NNode-1
        fprintf(fid, fspec, SG_INFO(i, 1:3));
    end
    fprintf(fid, '\n');
end

%% Calculate variables for deciding wether remove verticies or not
% list all combinations of points
PT_LIST             = nchoosek(1:NNode, 2);

% excluding adjacent points
DIFF                = abs(PT_LIST(:, 1) - PT_LIST(:, 2));
tmp                 = DIFF == 1;
PT_LIST(tmp,:)      = [];

% number of lines
NLN                 = length(PT_LIST(:, 1));

% matrix used to store the information
INFO                = zeros(NLN, 6);
INFO(:, 4)          = 100; % initial area removed as 100% 

% figure(200)
% hold on;
% plot(X_SEQ, Y_SEQ, 'ko-', 'LineWidth', 2)
% hold off;

for i = 1:NLN
    I1              = PT_LIST(i, 1);
    I2              = PT_LIST(i, 2);
    
    PT1             = [X_SEQ(I1), Y_SEQ(I1)];
    PT2             = [X_SEQ(I2), Y_SEQ(I2)];
    
    INFO(i, 1)      = I1;
    INFO(i, 2)      = I2;
    
    [LNX, LNY]      = line_segment_seq(PT1, PT2, 100); %#THLD#
    
    IN              = inpolygonf(LNX, LNY, X_SEQ, Y_SEQ);
    
    VAR1            = sum(IN)/length(LNX);
    
    INFO(i, 3)      = VAR1;

    % check whether the line connecting the two nodes is inside the polygon or not
    if VAR1 >= 0.95

        X_SEQ_SUB	= [X_SEQ(1:PT_LIST(i, 1)); X_SEQ(PT_LIST(i, 2):NNode)];
        Y_SEQ_SUB	= [Y_SEQ(1:PT_LIST(i, 1)); Y_SEQ(PT_LIST(i, 2):NNode)];
        AREA_SUB	= polyarea(X_SEQ_SUB, Y_SEQ_SUB);

        % area removed
        VAR2        = 100-100*AREA_SUB/AREA;
        % number of nodes to be removed
        VAR3        = NNode - length(X_SEQ_SUB);
        % direction of center of the line segment
        [X_C, Y_C]  = xycentroid(X_SEQ(I1:I2), Y_SEQ(I1:I2));
        
        VAR4        = abs(atan2(Y_C, X_C)*180/pi  - 90) + 10;
        
        INFO(i, 4)  = VAR2;
        INFO(i, 5)  = VAR3;
        INFO(i, 6)  = VAR4;
        
        % if DEBUG == 1
        %     figure
        %     hold on;
        %     plot(X_C, Y_C, 'ro', 'LineWidth', 2)
        %     plot(X_SEQ, Y_SEQ, 'ko-', 'LineWidth', 2)
        %     plot(X_SEQ_SUB, Y_SEQ_SUB, 'ro--', 'LineWidth', 2)
        %     plot(LNX, LNY, 'b.', 'LineWidth', 2)
        %     hold off;
        % end
        % 
        % if VAR2 < AREA_THLD
        %     figure(200)
        %     hold on;
        %     plot(LNX, LNY, 'b.', 'LineWidth', 2)
        %     hold off;
        % end
    end
end

if CVX.LOGS == YES
    fprintf(fid, '# List of line segments for finding verticies to be removed: \n');
    fprintf(fid, 'N1     N2         IN%%    AREA%%      #RM    ANGLE\n');
    fspec = '#%3.0f - #%3.0f: %8.2f %8.2f %8.0f %8.2f\n';
    for i = 1:length(INFO(:, 1));
        if INFO(i, 4) ~= 100
            fprintf(fid, fspec, INFO(i, :));
        end
    end
    fprintf(fid, '\n');
end

CVX_O.INFO = INFO;

%% Decide wether remove verticies or not
IDX                 = find(INFO(:, 4) <= AREA_THLD);

if ~isempty(IDX)
    [~, SORT_IDX]       = sort(INFO(IDX, 2) - INFO(IDX, 1), 'descend');
    IDX                 = IDX(SORT_IDX);

    LN_IDX              = 1;
    RM_IDX              = INFO(IDX(1), 1)+1:INFO(IDX(1), 2)-1;

    if length(IDX) >= 2
        for i = 2:length(IDX)
            idx_seq         = INFO(IDX(i), 1)+1:INFO(IDX(i), 2)-1;
            idx_intersect   = intersect(RM_IDX, idx_seq);
            idx_setdiff     = setdiff(idx_seq, idx_intersect);

            if isempty(idx_intersect) && isempty(idx_setdiff)
                LN_IDX      = [LN_IDX, IDX(i)]; %#ok<AGROW>
                RM_IDX      = idx_union;
            elseif isempty(idx_intersect) && ~isempty(idx_setdiff)
                if DEBUG == 1
                    disp('CP_RMVERTICIES_T1')
                    pause
                end
            end
        end
    end
    RM_IDX              = sort(RM_IDX);

    RMG_CNT             = 1;
    RMG_IDX{RMG_CNT}    = RM_IDX(1);

    if length(RM_IDX) >= 2
        for i = 2:length(RM_IDX)
            if RM_IDX(i) == RMG_IDX{RMG_CNT}(end) + 1
                RMG_IDX{RMG_CNT} = [RMG_IDX{RMG_CNT}, RM_IDX(i)];
            else
                RMG_CNT = RMG_CNT + 1;
                RMG_IDX{RMG_CNT} = RM_IDX(i);
            end
        end
    end

    if CVX.LOGS == YES
        fprintf(fid, '# Threshold is AREA%% <= %2.1f%%\n', AREA_THLD);
        fprintf(fid, '	   N1     N2       IN%%    AREA%%      #RM    ANGLE\n');
        fspec = '%d \t #%3.0f - #%3.0f: %8.2f %8.2f %8.0f %8.2f\n';
        for i = 1:length(IDX)
            fprintf(fid, fspec, IDX(i), INFO(IDX(i), :));
        end
        fprintf(fid, '\n');

        fprintf(fid, '# %d groups of nodes to be removed\n', length(RMG_IDX));
        for i = 1:length(RMG_IDX)
            fprintf(fid, 'Group #%d: ', i);
            fprintf(fid, '%d  ', RMG_IDX{i});
            fprintf(fid, '\n');
        end
        fprintf(fid, '\n');
    end

    RM_FINAL                        = [];
    for i = 1:length(RMG_IDX)
        IDXs                    = RMG_IDX{i}(1) - 1;
        IDXe                    = RMG_IDX{i}(end) + 1;
        SEQ                     = [IDXs, RMG_IDX{i}];
        SG_INFO(IDXs, 2)        = IDXe;
        idx_op                  = find(SG_INFO(SEQ, 3) ~= 1, 1);
        if ~isempty(idx_op)
            SG_INFO(IDXs, 3)    = 0;
        else
            SG_INFO(IDXs, 1)    = 0;
        end
        RM_FINAL                = [RM_FINAL, RMG_IDX{i}]; %#ok<AGROW>
    end

    if DEBUG == 1
        figure
        hold on;
        patch(X_SEQ, Y_SEQ, [1, 0, 0])
    end

    PTS(RM_FINAL, :)        = [];
    X_SEQ(RM_FINAL, :)      = [];
    Y_SEQ(RM_FINAL, :)      = [];
    SG_INFO(RM_FINAL, :)    = [];
    
    SG_INFO(:, 1)           = (1:length(PTS) - 1);
    SG_INFO(:, 2)           = (2:length(PTS));

    if DEBUG == 1
        patch(X_SEQ, Y_SEQ, [0, 1, 0])
        plot(X_SEQ, Y_SEQ, 'ko', 'LineWidth', 2)
    end
    
    CVX_O.RM_IDX    = RM_IDX;
    CVX_O.RMG_IDX   = RMG_IDX;
    CVX_O.RM_FINAL  = RM_FINAL;
end

if CVX.LOGS == YES
    fprintf(fid, '###########################################################################\n');
    fprintf(fid, '\n');
    fprintf(fid, '\n');
end

CVX_O.LOGS          = CVX.LOGS;
CVX_O.log_fid       = CVX.log_fid;
CVX_O.PTS           = PTS;
CVX_O.AREA          = polyarea(PTS(:, 1), PTS(:, 2));
CVX_O.AREA_THLD     = AREA_THLD;
CVX_O.SG_INFO       = SG_INFO;