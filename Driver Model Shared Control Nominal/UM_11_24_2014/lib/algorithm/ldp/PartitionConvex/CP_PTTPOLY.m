function PBM = CP_PTTPOLY(CVX)

PTS = CVX.PTS;

% partition polygon
if length(PTS(:, 1)) > 3
    % partition

    CP_Writetxt(PTS, [CVX.fn, '.txt'])

    ConvexPartition(CVX.fn)

    % cell for storing polygon verticies coordinates
    P_VERT_XY       = CP_Readtxt([CVX.fn, '_res.txt']);
    
elseif length(PTS(:, 1)) == 3
    P_VERT_XY{1}    = PTS;
end

NPoly = length(P_VERT_XY);

if DEBUG == 1
    figure
    hold on;
    colors = distinguishable_colors(NPoly);
    for i = 1:NPoly
        patch(P_VERT_XY{i}(:, 1), P_VERT_XY{i}(:, 2), colors(i, :))
    end
    hold off;
end

% total area
AREA_T = polyarea(PTS(:, 1), PTS(:, 2));

% polygon areas
AREA_P = zeros(1, NPoly);
for i = 1:NPoly
    AREA_P(i) = polyarea(P_VERT_XY{i}(:, 1), P_VERT_XY{i}(:, 2));
end

% log
if CVX.LOGS == YES
    fid = CVX.log_fid;
    
    fprintf(fid, '# Convex partition info:\n');
    fprintf(fid, 'IDX        AREA          PERCENT\n');
    fspec = '%d \t %10.2f \t %10.2f%%\n';
    for i = 1:NPoly
        fprintf(fid, fspec, i, AREA_P(i), 100*AREA_P(i)/AREA_T);
    end
    fprintf(fid, '\n');
end

% polygon vertices indexes
for i = 1:NPoly
    for j = 1:length(P_VERT_XY{i}(:, 1))
        VT_X = P_VERT_XY{i}(j, 1);
        VT_Y = P_VERT_XY{i}(j, 2);
        
        IDX1 = find(abs(PTS(:, 1)-VT_X)<0.001);
        if length(IDX1) ~= 1
            IDX2 = abs(PTS(IDX1, 2)-VT_Y)<0.001;
            IDX = IDX1(IDX2);
        else
            IDX = IDX1;
        end
        P_VERT_IX{i}(j) = IDX; %#ok<AGROW>
    end
end

% log
if CVX.LOGS == YES
    for i = 1:NPoly
        fprintf(fid, ' \t Polygon #%d:\n', i);
        fspec = '%d \t %10.2f \t %10.2f\n';
        for j = 1:length(P_VERT_XY{i}(:, 1))
            VT_X = P_VERT_XY{i}(j, 1);
            VT_Y = P_VERT_XY{i}(j, 2);
            VT_I = P_VERT_IX{i}(j);
            fprintf(fid, fspec, VT_I, VT_X, VT_Y);
        end
        fprintf(fid, '\n');
    end
end

PBM.LOGS        = CVX.LOGS;
PBM.log_fid     = CVX.log_fid;
PBM.PTS         = CVX.PTS;
PBM.SG_INFO     = CVX.SG_INFO;
PBM.P_VERT_IX   = P_VERT_IX;