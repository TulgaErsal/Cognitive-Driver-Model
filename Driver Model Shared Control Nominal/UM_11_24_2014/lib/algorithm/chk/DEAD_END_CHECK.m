function ERROR = DEAD_END_CHECK(PARA, LI, SIM)

% check whether the vehicle is facing a dead end or not

% - there is no opening
% - the distance between the obstacles are small

ERROR = false;

% when there is no opening
if isempty(LI.OPSI)
    % check whether hypothetical opening exists or not
    
    % number of obstacle segments
    NOB = 0; 
    
    % loop through all obstacle groups
    for i = 1:length(LI.OBSI)
        % identify the line segments in the obstacle group
        [~, POINT_IDX]  = dpsimplify( LI.PTS(LI.OBSI(i):1:LI.OBEI(i),:),...
                                      PARA.LINE_SIMP_THLD);

        for k = 1:length(POINT_IDX) - 1
            NOB       	= NOB + 1;
            
            % start index of the line segment
            OBLSI(NOB) 	= POINT_IDX(k);     %#ok<AGROW>
            % end index of the line segment
            OBLEI(NOB) 	= POINT_IDX(k+1);   %#ok<AGROW>
        end
    end
    
    % remove all segments defined by 2 points or less
    IDX     = find((OBLEI - OBLSI) > 2);
    OBLSI   = OBLSI(IDX);
    OBLEI   = OBLEI(IDX);
    NOB     = length(OBLSI);
    
    if DEBUG == 1
        figure(1)
        plot(LI.PTS(OBLEI,1), LI.PTS(OBLEI,2),'ko')
        plot(LI.PTS(OBLSI,1), LI.PTS(OBLSI,2),'bo')
    end
    
    if NOB == 1
        % completely blocked, the obstacles are connected
        ERROR = true; 
        
    elseif NOB > 1
        % distance between adjcent line segments
        DIST = zeros(1, NOB - 1);
        
        for i = 1:NOB - 1
            DIST(i) = norm(LI.PTS(OBLEI(i),:) - LI.PTS(OBLSI(i+1),:));
        end

        if max(DIST) <= 2*PARA.MINDIST_THLD %#THLD#
            ERROR = true; 
        end
    end
end

% -------------------------------------------------------------------------
% display
if SIM.LOGS == YES
    fprintf(SIM.fid, '# CHECK: dead End\n');
end

% log
if SIM.LOGS == YES
    if ~isempty(LI.OPSI)
        fprintf(SIM.fid, '\t At least one opening exists\n');
    else
        if NOB == 1
            fprintf(SIM.fid, '\t Completely blocked\n');
        elseif NOB > 1
            if ERROR == true
                fprintf(SIM.fid, '\t All intervals between obstacles are small\n');
            else
                fprintf(SIM.fid, '\t One or more intervals between obstacles are large enough\n');
            end
        end
    end
    fprintf(SIM.fid, '\n');
end

if ERROR == true
    if SIM.LOGS == YES
        fprintf(SIM.fid, '!! The vehicle is facing a dead end.\n');
        fprintf(SIM.fid, '!! Simulation terminated.\n');
    end
    
    disp('* The vehicle is facing a dead end!')
    disp('* Simulation terminated!')
end