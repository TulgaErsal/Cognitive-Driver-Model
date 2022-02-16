function PBM = CP_PBMINFO(IPT, PBM)

PTS         = PBM.PTS;
SG_INFO     = PBM.SG_INFO;
P_VERT_IX   = PBM.P_VERT_IX;

% number of nodes
NNode       = length(PTS(:, 1));
NPoly       = length(P_VERT_IX);

% vehicle start position line segment
LS_S        = [1, NNode];

for i = 1:NPoly
    NPolyi = length(P_VERT_IX{i});
    if length(union(LS_S, P_VERT_IX{i})) == NPolyi
        POLY_SI = i;
    end
end

if PBM.LOGS == YES
    fid = PBM.log_fid;
    fprintf(fid, '* The vehicle lies on the line segment\n--> %5.0d %5.0d\n', LS_S);
    fprintf(fid, '* This line segment lies on the edge of polygon %d\n', POLY_SI);
    fprintf(fid, '\n');
end

% adjacency matrix
AM          = zeros(NPoly, NPoly);

for i = 1:NPoly
    AM(i, i) = 1;
end

for i = 1:NPoly-1
    for j = i+1:NPoly
        IXi = P_VERT_IX{i};
        IXj = P_VERT_IX{j};
        Ni  = length(IXi);
        Nj  = length(IXj);
        if length(union(IXi, IXj)) <= Ni + Nj - 2
            AM(i, j) = 1;
            AM(j, i) = 1;
        end
    end
end

if PBM.LOGS == YES
    fprintf(fid, '* Adjacency matrix.\n');
    for i = 1:NPoly
        for j = 1:NPoly
            fprintf(fid, '%d ', AM(i, j));
        end
        fprintf(fid, '\n');
    end
    fprintf(fid, '\n');
end

% cost map
CM      = ones(size(AM))- AM;

IDX_OP  = find(SG_INFO(:,3) == -1);
% CNT_OP  = length(IDX_OP);
% LS_OP = [IDX_SEQ(IDX_OP), IDX_SEQ(IDX_OP+1)];

IDX_SEQ = (1:NNode)';

% remove openings that are outside the range (ANGLE_MIN ~ ANGLE_MAX)
OP_PT1  = PTS(IDX_SEQ(IDX_OP), :);
OP_PT2  = PTS(IDX_SEQ(IDX_OP+1), :);

ANGLE1  = atan2(OP_PT1(:, 2), OP_PT1(:, 1));
ANGLE2  = atan2(OP_PT2(:, 2), OP_PT2(:, 1));

IDX = ANGLE2 <= - pi + pi/180; %#THLD#
ANGLE2(IDX) = pi;

ANGLE_MIN = IPT.ANGLE_MIN;
ANGLE_MAX = IPT.ANGLE_MAX;

IDX_MIN = find(ANGLE2 < ANGLE_MIN);
IDX_MAX = find(ANGLE1 > ANGLE_MAX);

IDX_OP(union(IDX_MIN, IDX_MAX)) = [];
CNT_OP  = length(IDX_OP);

if CNT_OP ~= 0
    % line segments representing the openings
    LS_OP = [IDX_SEQ(IDX_OP), IDX_SEQ(IDX_OP+1)];

    OP_VERT_IDX = nan*ones(NPoly, 3);

    POLY_OPI = nan*ones(1, CNT_OP);
    
    for i = 1:CNT_OP
        for j = 1:NPoly
            NPolyi = length(P_VERT_IX{j});
            if length(union(LS_OP(i, :), P_VERT_IX{j})) == NPolyi
                POLY_OPI(i) = j;
                OP_VERT_IDX(i, :) = [j, LS_OP(i, :)];
            end
        end
    end

    TYPE = 'OP';
    VERT_IDX = OP_VERT_IDX;

    if PBM.LOGS == YES
        fprintf(fid, '* There are %d feasible opening(s).\n', CNT_OP);
        fprintf(fid, '* Line Segments  Polygon Index\n');
        fspec = '--> %5.0d %5.0d \t \t --> %d\n';
        for i = 1:CNT_OP
            fprintf(fid, fspec, LS_OP(i, :), POLY_OPI(i));
        end
        fprintf(fid, '\n');
    end

    % maximum number of shortestPaths calculated
    N_MAX = 10;

    N_SEQ = 0;
    POLY_SEQ = [];

    for i = 1:CNT_OP
        if POLY_SI ~= POLY_OPI(i)
            [shortestPaths, totalCosts] = kShortestPath(CM, POLY_SI, POLY_OPI(i), N_MAX);
            for j = 1:length(totalCosts)
                if totalCosts(j) == 0
                    N_SEQ = N_SEQ + 1;
                    POLY_SEQ{N_SEQ} = shortestPaths{j}; %#ok<AGROW>
                else
                    break;
                end
            end
        else
            N_SEQ = N_SEQ + 1;
            POLY_SEQ{N_SEQ} = POLY_SI; %#ok<AGROW>
        end
    end
end

if CNT_OP == 0
    IDX_HP = find(SG_INFO(:, 3) == 0);
    CNT_HP = length(IDX_HP);
    
    % line segments representing the openings
    LS_HP = [IDX_SEQ(IDX_HP), IDX_SEQ(IDX_HP+1)];

    HP_VERT_IDX = nan*ones(NPoly, 3);
    
    POLY_HPI = nan*ones(1, CNT_HP);
    
    for i = 1:CNT_HP
        for j = 1:NPoly
            NPolyi = length(P_VERT_IX{j});
            if length(union(LS_HP(i, :), P_VERT_IX{j})) == NPolyi
                POLY_HPI(i) = j;
                HP_VERT_IDX(i, :) = [j, LS_HP(i, :)];
            end
        end
    end

    TYPE = 'HP';
    VERT_IDX = HP_VERT_IDX;

    if PBM.LOGS == YES
        fprintf(fid, '* There are %d hypothetical opening(s).\n', CNT_HP);
        fprintf(fid, '* Line Segments  Polygon Index\n');
        fspec = '--> %5.0d %5.0d \t \t --> %d\n';
        for i = 1:CNT_HP
            fprintf(fid, fspec, LS_HP(i, :), POLY_HPI(i));
        end
        fprintf(fid, '\n');
    end

    % maximum number of shortestPaths calculated
    N_MAX = 10;

    N_SEQ = 0;
    POLY_SEQ = [];

    for i = 1:CNT_HP
        if POLY_SI ~= POLY_HPI(i)
            [shortestPaths, totalCosts] = kShortestPath(CM, POLY_SI, POLY_HPI(i), N_MAX);
            for j = 1:length(totalCosts)
                if totalCosts(j) == 0
                    N_SEQ = N_SEQ + 1;
                    POLY_SEQ{N_SEQ} = shortestPaths{j}; %#ok<AGROW>
                else
                    break;
                end
            end
        else
            N_SEQ = N_SEQ + 1;
            POLY_SEQ{N_SEQ} = POLY_SI; %#ok<AGROW>
        end
    end
end

if PBM.LOGS == YES
    fprintf(fid, '* There are %d polygon sequence(s): \n', N_SEQ);
    if N_SEQ ~= 0
        for i = 1:N_SEQ
            fspec = '%5.0d ';
            for j = 1:length(POLY_SEQ{i})
                fprintf(fid, fspec, POLY_SEQ{i}(j));
            end
            fprintf(fid, '\n');
        end
    end
    fprintf(fid, '\n');
end

PBM.TYPE        = TYPE;
PBM.POLY_SEQ    = POLY_SEQ;
PBM.VERT_IDX    = VERT_IDX;