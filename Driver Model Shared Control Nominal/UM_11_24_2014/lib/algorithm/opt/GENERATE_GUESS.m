function GUESS = GENERATE_GUESS(OCP, XTM)

REGION_X                = [];
REGION_Y                = [];

%% polar - basic
if OCP.OCPType == 1
    PhaseNum            = length(OCP.SecType);

    for j = 1:PhaseNum
        if     OCP.SecType(j) == 1 || OCP.SecType(j) == 0
            REGION_X{j} = [OCP.Points(j, 1), OCP.Points(j, 3), OCP.Points(j, 5)]; %#ok<AGROW>
            REGION_Y{j} = [OCP.Points(j, 2), OCP.Points(j, 4), OCP.Points(j, 6)]; %#ok<AGROW>
        elseif OCP.SecType(j) == -1
            AA1         = linspace(OCP.Polar(j, 1), OCP.Polar(j, 2), 100);
            RR1         = min(OCP.Polar(j, 3:4));
            XX1         = RR1*cos(AA1);
            YY1         = RR1*sin(AA1);
            REGION_X{j} = [XX1, OCP.Points(j, 5)]; %#ok<AGROW>
            REGION_Y{j} = [YY1, OCP.Points(j, 6)]; %#ok<AGROW>
        end
    end
end

%% polar - phase 1
if OCP.OCPType == 2
    PhaseNum            = length(OCP.SecType) + 1;
    
    A_SEQ               = linspace(OCP.P1_Angle(1), OCP.P1_Angle(2),100);
    REGION_X{1}         = [OCP.P1_Radius*cos(A_SEQ), 0];
    REGION_Y{1}         = [OCP.P1_Radius*sin(A_SEQ), 0];
    
    for j = 1:length(OCP.SecType)
        if     OCP.SecType(j) == 1 || OCP.SecType(j) == 0
            if norm(OCP.Points(j, 5:6)) < 1
                AA    	= linspace(OCP.Polar(j, 2), OCP.Polar(j, 1),100);
                XX      = OCP.P1_Radius*cos(AA);
                YY      = OCP.P1_Radius*sin(AA);
            	REGION_X{j+1} = [OCP.Points(j, 1), OCP.Points(j, 3), XX]; %#ok<AGROW>
                REGION_Y{j+1} = [OCP.Points(j, 2), OCP.Points(j, 4), YY]; %#ok<AGROW>
            else
                REGION_X{j+1} = [OCP.Points(j, 1), OCP.Points(j, 3), OCP.Points(j, 5)]; %#ok<AGROW>
                REGION_Y{j+1} = [OCP.Points(j, 2), OCP.Points(j, 4), OCP.Points(j, 6)]; %#ok<AGROW>
            end
        elseif OCP.SecType(j) == -1
            AA1         = linspace(OCP.Polar(j, 1), OCP.Polar(j, 2),100);
            RR1         = min(OCP.Polar(j, 3:4));
            XX1         = RR1*cos(AA1);
            YY1         = RR1*sin(AA1);
            if norm(OCP.Points(j, 5:6)) < 1
                AA2     = linspace(OCP.Polar(j, 2), OCP.Polar(j, 1),100);
                XX2     = OCP.P1_Radius*cos(AA2);
                YY2     = OCP.P1_Radius*sin(AA2);
                REGION_X{j+1} = [XX1, XX2]; %#ok<AGROW>
                REGION_Y{j+1} = [YY1, YY2]; %#ok<AGROW>
            else
                REGION_X{j+1} = [XX1, OCP.Points(j, 5)]; %#ok<AGROW>
                REGION_Y{j+1} = [YY1, OCP.Points(j, 6)]; %#ok<AGROW>
            end
        end
    end
end

%% hypothetical 
if OCP.OCPType == 3
    PhaseNum        = length(OCP.SecType);
    
    for j = 1:PhaseNum
        REGION_X{j} = [OCP.Points(j, 1), OCP.Points(j, 3), OCP.Points(j, 5)]; %#ok<AGROW>
        REGION_Y{j} = [OCP.Points(j, 2), OCP.Points(j, 4), OCP.Points(j, 6)]; %#ok<AGROW>
    end
end

%% convex
if OCP.OCPType == 4
    PhaseNum    = length(OCP.SecType);
    
    OP_I1       = OCP.OPVertIDX(2);
    OP_I2       = OCP.OPVertIDX(3);
    
    for j = 1:PhaseNum
        VS      = OCP.Indexes(OCP.PolySeq(j));
        VS      = VS{1};
        
        if     OCP.SecType(j) == 1
            REGION_X{j} = OCP.Points([VS, VS(1)], 1)'; %#ok<AGROW>
            REGION_Y{j} = OCP.Points([VS, VS(1)], 2)'; %#ok<AGROW>

        elseif OCP.SecType(j) == -1
            REGION_X{j} = OCP.Points(VS(1), 1); %#ok<AGROW>
            REGION_Y{j} = OCP.Points(VS(1), 2); %#ok<AGROW>
            
            for k = 1:length(VS)
                I1 = VS(k);
                if k ~= length(VS)
                    I2  = VS(k+1);
                else
                    I2  = VS(1);
                end
                
               	if (I1 == OP_I1 && I2 == OP_I2) || (I1 == OP_I2 && I2 == OP_I1)
                    PT1     = OCP.Points(I1, :);
                    PT2     = OCP.Points(I2, :);
                    A1      = atan2(PT1(2), PT1(1));
                    if A1 <= - pi + pi/180;
                        A1  = pi;
                    end
                    A2      = atan2(PT2(2), PT2(1));
                    if A2 <= - pi + pi/180;
                        A2  = pi;
                    end
                    AA      = linspace(A1, A2, 100);
                    RR      = min([norm(PT1), norm(PT2)]);
                    XX      = RR*cos(AA);
                    YY      = RR*sin(AA);
                    
                    REGION_X{j} = [REGION_X{j}, XX(2:end)]; %#ok<AGROW>
                    REGION_Y{j} = [REGION_Y{j}, YY(2:end)]; %#ok<AGROW>
                else
                    REGION_X{j} = [REGION_X{j}, OCP.Points(I2, 1)]; %#ok<AGROW>
                    REGION_Y{j} = [REGION_Y{j}, OCP.Points(I2, 2)]; %#ok<AGROW>
                end
            end
        end
    end
end

%% generate guess
GUESS.PH = [];

if DEBUG == 1
    figure
    hold on;
    axis equal
    plot(XTM.XY(:,1), XTM.XY(:,2),'ko', 'LineWidth', 2)
end

COLORS  = distinguishable_colors(PhaseNum);

for j = 1:PhaseNum

    IN = inpolygonf(XTM.XY(2:end,1),XTM.XY(2:end,2), REGION_X{j}, REGION_Y{j});

    if sum(IN) ~= 0
        if j == 1
            IN = [true; reshape(IN, length(IN), 1)];
        else
            IN = [false; reshape(IN, length(IN), 1)];
        end

        GUESS.PH(j).TM = XTM.TM(IN);
        GUESS.PH(j).ST = XTM.ST(IN, :);
        GUESS.PH(j).CT = XTM.CT(IN, :);
        GUESS.PH(j).IN = 0;

        if DEBUG == 1
            patch([REGION_X{j}, REGION_X{j}(1)], [REGION_Y{j}, REGION_Y{j}(1)], COLORS(j, :), 'FaceAlpha',0.1)
            plot(GUESS.PH(j).ST(:, 1), GUESS.PH(j).ST(:, 2), 'r.', 'MarkerSize', 5)
        end
    else
        break;
    end
end

if DEBUG == 1
    hold off;
end

if ~isempty(GUESS.PH)
    if length(GUESS.PH) == PhaseNum
        for i = 1:length(GUESS.PH) - 1
            
            IDX1 = find(GUESS.PH(i).TM(end) == XTM.TM);
            IDX2 = find(GUESS.PH(i + 1).TM(1) == XTM.TM);

            if IDX2 == IDX1 || IDX2 == IDX1 + 1
            else
                GUESS.PH = [];
                break;
            end
        end
    else
        GUESS.PH = [];
    end
end

if ~isempty(GUESS.PH)
    for i = 1:PhaseNum
        if length(GUESS.PH(i).TM) <= 5
            GUESS.PH = [];
            break;
        end
    end
end

if OCP.OCPType == 4 &&~isempty(GUESS.PH)
    OP_A    = atan2(GUESS.PH(end).ST(end, 2), GUESS.PH(end).ST(end, 1));

    OP_I1   = OCP.OPVertIDX(2);
    OP_I2   = OCP.OPVertIDX(3);
    OP_A1   = atan2(OCP.Points(OP_I1, 2), OCP.Points(OP_I1, 1));
    OP_A2   = atan2(OCP.Points(OP_I2, 2), OCP.Points(OP_I2, 1));

    if min([OP_A1, OP_A2]) <= OP_A && OP_A <= max([OP_A1, OP_A2])
    else
        GUESS.PH = [];
    end
end

if isempty(GUESS.PH)
    GUESS = [];
end