function CVX_O = CP_RMVERTICES_T2(CVX)

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
    fprintf(fid, '  PT1   PT2     TYPE        X           Y\n');
    fspec = '%5.0d %5.0d \t %3.0f %8.2f \t %8.2f \n';
    for i = 1:NNode-1
        fprintf(fid, fspec, SG_INFO(i, :));
    end
    fprintf(fid, '\n');
end

%% find intersection of all the edges
% list all combinations for finding the intersection
LS_LIST         = nchoosek(1:NNode - 1, 2);

% excluding adjacent lines
DIFF            = abs(LS_LIST(:, 1) - LS_LIST(:, 2));
tmp             = DIFF == 1;
LS_LIST(tmp,:)  = [];

% number of combinations
NCB             = length(LS_LIST(:, 1));

INFO            = zeros(NCB + max([0, NNode-3]), 11);
INFO(:, 9)      = 100; % initial area removed as 100% 

% find intersection of all the edges
for i = 1:NCB
    % line segment 1
    I_LS11      = LS_LIST(i, 1);
    LS1_PT1     = [X_SEQ(I_LS11), Y_SEQ(I_LS11)];
    I_LS12      = I_LS11 + 1;
    LS1_PT2     = [X_SEQ(I_LS12), Y_SEQ(I_LS12)];
    
    % line segment 2
    I_LS21      = LS_LIST(i, 2);
    LS2_PT1     = [X_SEQ(I_LS21), Y_SEQ(I_LS21)];
    I_LS22      = I_LS21 + 1;
    LS2_PT2     = [X_SEQ(I_LS22), Y_SEQ(I_LS22)];
    
    % intersect point
    IS_PT       = linlinintersect([LS1_PT1; LS1_PT2; LS2_PT1; LS2_PT2]);
    
    INFO(i, 1:6)        = [I_LS11, I_LS12, I_LS21, I_LS22, IS_PT];
    
    % check whether it is inside the polygon
   	[IN, ON]    = inpolygonf(IS_PT(1),IS_PT(2),X_SEQ,Y_SEQ);

    INFO(i, 7)          = IN;
    INFO(i, 8)          = ON;
    
    if IN == true && ON == false
        X_SEQ_SUB	= [X_SEQ(1:I_LS11); IS_PT(1); X_SEQ(I_LS22:NNode)];
        Y_SEQ_SUB	= [Y_SEQ(1:I_LS11); IS_PT(2); Y_SEQ(I_LS22:NNode)];
        AREA_SUB	= polyarea(X_SEQ_SUB, Y_SEQ_SUB);
        
        % area removed
        INFO(i, 9)      = 100-100*AREA_SUB/AREA;
        % number of nodes to be removed
        INFO(i, 10)     = NNode - length(X_SEQ_SUB);
        % angle of the intersection point
        INFO(i, 11)     = abs(atan2(IS_PT(2), IS_PT(1))*180/pi  - 90) + 10;
        
        if DEBUG == 1
            figure
            hold on;
            plot(X_SEQ, Y_SEQ, 'ko-', 'LineWidth', 2)
            plot(X_SEQ_SUB, Y_SEQ_SUB, 'ro--', 'LineWidth', 2)
            hold off;
        end
    end
end

if NNode >= 4
    N_SEQ = 2:NNode - 2;
    for i = 1:length(N_SEQ);
        I_LS11	= N_SEQ(i);
        I_LS12 	= N_SEQ(i)+1;
        I_LS21 	= NNode;
        I_LS22 	= 1;

        INFO(i+NCB, 1:4) = [I_LS11, I_LS12, I_LS21, I_LS22];
        
        % line segement - point
        LS1_PT1 = [X_SEQ(I_LS11), Y_SEQ(I_LS11)];
        LS1_PT2 = [X_SEQ(I_LS12), Y_SEQ(I_LS12)];
        LS2_PT1 = [X_SEQ(I_LS21), Y_SEQ(I_LS21)];
        LS2_PT2 = [X_SEQ(I_LS22), Y_SEQ(I_LS22)];
        
        % intersect point
        IS_PT  = linlinintersect([LS1_PT1; LS1_PT2; LS2_PT1; LS2_PT2]);

        INFO(i+NCB, 5:6) = IS_PT;

        % check whether it is on the line segment (#NNode - #1 or not)
        tol = 1e-6;
        P   = [IS_PT, 0];
        P1  = [LS2_PT1, 0];
        P2  = [LS2_PT2, 0];
        
        if (norm(cross(P-P1,P2-P1)) < tol) && ...
           (dot(P-P1,P2-P1))*(dot(P-P2,P2-P1)) <= 0
       
            if IS_PT(1) > 0
                X_SEQ_TMP = [IS_PT(1); X_SEQ(I_LS12:NNode)];
                Y_SEQ_TMP = [IS_PT(2); Y_SEQ(I_LS12:NNode)];
            end

            if IS_PT(1) < 0
                X_SEQ_TMP = [X_SEQ(1:I_LS11); IS_PT(1)];
                Y_SEQ_TMP = [Y_SEQ(1:I_LS11); IS_PT(2)];
            end
            
            AREA_TMP  = polyarea(X_SEQ_TMP, Y_SEQ_TMP);

            INFO(i+NCB, 7)  = 1;
            INFO(i+NCB, 8)  = 1;
            INFO(i+NCB, 9)  = 100-100*AREA_TMP/AREA;
            INFO(i+NCB, 10) = NNode - length(X_SEQ_TMP);
            INFO(i+NCB, 11) = abs(atan2(IS_PT(2), IS_PT(1))*180/pi  - 90) + 10;
        end
    end
end

if CVX.LOGS == YES
    fprintf(fid, '# List of line segments for checking intersection point: \n');
    fprintf(fid, 'LineSeg1  LineSeg1   Intersect_x Intersect_y     IN   ON  AREA%% #RM      ANGLE\n');
    fspec = '(#%d - #%d)&(#%d - #%d): (%10.2g, %10.2g) \t [%d   %d] %6.2f   %d \t %5.1f\n';
    for i = 1:length(INFO(:, 1))
        fprintf(fid, fspec, INFO(i, :));
    end
    fprintf(fid, '\n');
end

CVX_O.INFO = INFO;

%% 
IDX = find(INFO(:, 9) <= AREA_THLD);

if ~isempty(IDX)
    
    BENEFIT     = INFO(IDX, 9).*INFO(IDX, 10).*INFO(IDX, 11);
    [~, IDX2]   = max(BENEFIT);
    IDX3        = IDX(IDX2);
    
    if CVX.LOGS == YES
        fprintf(fid, 'The following intersection point is used: \n');
        fspec = '(#%d - #%d)&(#%d - #%d): (%10.2f, %10.2f) \t [%d   %d] %6.2f   %d \t %5.1f\n';
        fprintf(fid, fspec, INFO(IDX3, :));
        fprintf(fid, '\n');
    end
    
    I_LS11 = INFO(IDX3, 1);
    I_LS12 = INFO(IDX3, 2);
    I_LS21 = INFO(IDX3, 3);
    I_LS22 = INFO(IDX3, 4);
        
    if INFO(IDX3, 3) ~= NNode
        PTS_O(:, 1) = [X_SEQ(1:I_LS11); INFO(IDX3, 5); X_SEQ(I_LS22:NNode)];
        PTS_O(:, 2) = [Y_SEQ(1:I_LS11); INFO(IDX3, 6); Y_SEQ(I_LS22:NNode)];
        
        SG_INFO(I_LS11, 4) = X_SEQ(I_LS12);
        SG_INFO(I_LS11, 5) = Y_SEQ(I_LS12);
        SG_INFO(I_LS21, 4) = X_SEQ(I_LS21);
        SG_INFO(I_LS21, 5) = Y_SEQ(I_LS21);
        SG_INFO = SG_INFO([1:I_LS11, I_LS21:NNode-1],:);
    else
        if INFO(IDX3, 5) > 0
            PTS_O(:, 1) = [INFO(IDX3, 5); X_SEQ(I_LS12:NNode)];
            PTS_O(:, 2) = [INFO(IDX3, 6); Y_SEQ(I_LS12:NNode)];
            
            SG_INFO(I_LS11, 4) = X_SEQ(I_LS11);
            SG_INFO(I_LS11, 5) = Y_SEQ(I_LS11);
            SG_INFO = SG_INFO(I_LS11:NNode-1,:);
        end
        
        if INFO(IDX3, 5) < 0
            PTS_O(:, 1) = [X_SEQ(1:I_LS11); INFO(IDX3, 5)];
            PTS_O(:, 2) = [Y_SEQ(1:I_LS11); INFO(IDX3, 6)];
            
            SG_INFO(I_LS11, 4) = X_SEQ(I_LS12);
            SG_INFO(I_LS11, 5) = Y_SEQ(I_LS12);
            SG_INFO = SG_INFO(1:I_LS11,:);
        end
    end
    
    SG_INFO(:, 1) = 1:length(SG_INFO(:, 1));
    SG_INFO(:, 2) = SG_INFO(:, 1) + 1;
else
    PTS_O = PTS;
end

if CVX.LOGS == YES
    fprintf(fid, '###########################################################################\n');
    fprintf(fid, '\n');
    fprintf(fid, '\n');
end

if DEBUG == 1
    figure
    hold on;
    patch(PTS(:, 1), PTS(:, 2), [1, 0, 0])
    patch(PTS_O(:, 1), PTS_O(:, 2), [0, 1, 0])
    plot(PTS_O(:, 1), PTS_O(:, 2), 'ko', 'LineWidth', 2)
end

CVX_O.LOGS          = CVX.LOGS;
CVX_O.log_fid       = CVX.log_fid;
CVX_O.PTS           = PTS_O;
CVX_O.AREA          = polyarea(PTS_O(:, 1), PTS_O(:, 2));
CVX_O.AREA_THLD     = AREA_THLD;
CVX_O.SG_INFO       = SG_INFO;
