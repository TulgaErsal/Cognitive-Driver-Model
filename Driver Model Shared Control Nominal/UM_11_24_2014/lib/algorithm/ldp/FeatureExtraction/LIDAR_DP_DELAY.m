function LIDL = LIDAR_DP_DELAY(IPT, LID)

% re-orient the sensor data based on the estimated delays

filename        = mfilename;
filename        = strrep(filename, '_', ' ');

% position and orientation of the re-oriented sensor data
LIDL.VP         = IPT.VP;
LIDL.HA         = IPT.HA;

% position and orientation of the original sensor data
LIDL.SVP        = LID.VP;
LIDL.SHA        = LID.HA;

LIDL.AR         = LID.AR;
LIDL.LR         = LID.LR;

if IPT.CONTROL_DELAY_EST == 0 && IPT.SENSING_DELAY_EST == 0
    % if there is no estimated delay, just pass the parameters
    LIDL.ANGLE	= LID.ANGLE;
    LIDL.RANGE	= LID.RANGE;
    
    LIDL.PTS	= LID.PTS;
    
    LIDL.OPSI	= LID.OPSI;         % opening start indexes
    LIDL.OPEI	= LID.OPEI;         % opening end indexes
    LIDL.OBSI	= LID.OBSI;         % obstacle start indexes
    LIDL.OBEI	= LID.OBEI;         % obstacle end indexes
    
    LIDL.XS    	= LIDL.PTS(1,1);   	% start point x
    LIDL.YS   	= LIDL.PTS(1,2);   	% start point y
    LIDL.XE     = LIDL.PTS(end,1); 	% end point x
    LIDL.YE    	= LIDL.PTS(end,2); 	% end point y
else
    LINE_LENGTH = 2*LID.LR; %#THLD#
    
    % points
    XXM       	= [LID.PTS(:,1); LID.PTS(1,1)];
    YYM       	= [LID.PTS(:,2); LID.PTS(1,2)];
    
    % start line
    XXS         = LIDL.VP(1) + [0, LINE_LENGTH*cos(LIDL.HA - pi/2)];
    YYS       	= LIDL.VP(2) + [0, LINE_LENGTH*sin(LIDL.HA - pi/2)];
    
    % end line
    XXE       	= LIDL.VP(1) + [0, LINE_LENGTH*cos(LIDL.HA + pi/2)];
    YYE       	= LIDL.VP(2) + [0, LINE_LENGTH*sin(LIDL.HA + pi/2)];
    
    LIDL.XXM	= XXM;
    LIDL.YYM	= YYM;
    LIDL.XXS	= XXS;
    LIDL.YYS	= YYS; 
    LIDL.XXE	= XXE;
    LIDL.YYE	= YYE;
    
    if DEBUG == 1
        figure
        hold on
        % axis equal
        title([filename, ' - 1'])
        plot(LIDL.VP(1), LIDL.VP(2),'o')
        plot(XXM, YYM, 'k')
        plot(XXS, YYS, 'r--')
        plot(XXE, YYE, 'r--')
        hold off
    end

    % ---------------------------------------------------------------------
    % start point ---------------------------------------------------------
    [XS, YS, IS, ~]	= intersections(XXM, YYM, XXS, YYS, true);
    
    % IS is the index of the intersection point in the (XXM, YYM) sequence
    % it is a decimal, round this to the closet integer
    IS              = ceil(IS);
    
    % There should be at least one intersection point
    % as long as the point LID.VP is within the bounded area
    if isempty(IS)
        error([filename, ' - no intersection with start line'])
    end
    
    % if there are more than one intersection points
    % use the intersection point that is closest to LID.VP
    if length(XS) > 1
        DIST        = (XS - LIDL.VP(1)).^2 + (YS - LIDL.VP(2)).^2;
        
        [~, IDX]    = min(DIST);
        XS          = XS(IDX);
        YS          = YS(IDX);
        IS          = IS(IDX);
        
        if DEBUG == 1
            DIST %#ok<NOPRT>
            IDX %#ok<NOPRT>
            disp([filename, 'IS - more than one intersection points exsist'])
            pause
        end
    end
    
    % end point -----------------------------------------------------------
    [XE, YE, IE, ~] = intersections(XXM, YYM, XXE, YYE, true);
    IE              = floor(IE);
    
    if isempty(IS)
        error([filename, ' - no intersection with end line'])
    end
    
    if length(XE) > 1
        DIST        = (XE - LIDL.VP(1)).^2 + (YE - LIDL.VP(2)).^2;
        [~, IDX]    = min(DIST);
        XE          = XE(IDX);
        YE          = YE(IDX);
        IE          = IE(IDX);
        
        if DEBUG == 1
            DIST %#ok<NOPRT>
            IDX %#ok<NOPRT>
            disp([filename, 'IE - more than one intersection points exsist'])
            pause
        end
    end
    % ---------------------------------------------------------------------
    
    % number of LIDAR data points
    NLI             = length(LID.RANGE);
    
    % index of remaining sequence after re-orientation
    if      IS == NLI + 1
        IDX_SEQ     = 1:1:IE;
    elseif  IE == NLI + 1
        IDX_SEQ     = IS:1:NLI;
    else
        IDX_SEQ     = IS:1:IE;
    end

    A1              = atan2((YS - LID.VP(2)), (XS - LID.VP(1))) - LID.HA;
    A1              = mod(A1, 2*pi);
    
    A2              = atan2((YE - LID.VP(2)), (XE - LID.VP(1))) - LID.HA;
    A2              = mod(A2, 2*pi);
    
    if IS == NLI + 1
        A1          = 3*pi/2;
    end
       
    if IE == NLI + 1
        A2          = pi/2;
    end
    
    LIDL.ANGLE      = [ A1, LID.ANGLE(IDX_SEQ), A2];
                
    LIDL.RANGE      = [ norm([XS, YS] - LID.VP), ...
                        LID.RANGE(IDX_SEQ), ...
                        norm([XE, YE] - LID.VP) ];
                
  	LIDL.PTS        = [[XS, YS]; LID.PTS(IDX_SEQ,:); [XE, YE]];
                
    [LIDL.OBSI, LIDL.OBEI, LIDL.OPSI, LIDL.OPEI] = LIDAR_Group(LIDL.RANGE, LID.LR);
    
    LIDL.XS         = XS;
    LIDL.YS         = YS;
    LIDL.XE         = XE;
    LIDL.YE         = YE;
    
    if DEBUG == 1
        figure
        hold on;
        % axis equal
        title([filename,' - 2'])
        plot(LIDL.PTS(:,1), LIDL.PTS(:,2), 'k', 'LineWidth', 2)
        plot(LIDL.VP(1), LIDL.VP(2), 'ro')
        plot(LIDL.VP(1) + [0, 20*cos(LIDL.HA)], LIDL.VP(2) + [0, 20*sin(LIDL.HA)], 'r')
        plot([XS, XE], [YS, YE], 'ko-')
        plot(XXM(IS), YYM(IS), 'ko')
        plot(XXM(IE), YYM(IE), 'ko')
        hold off;
    end
end

%% simplyfy the LIDAR data points before adding the safety margin

%#CHECK#

if DEBUG == 1
    figure
    hold on
    plot(LIDL.PTS(:,1), LIDL.PTS(:,2), 'k.')
end

if ~isempty(LIDL.OBSI)
    for i = 1:length(LIDL.OBSI)
        SI          = LIDL.OBSI(i);
        EI          = LIDL.OBEI(i);
        PT_MATRIX  	= LIDL.PTS(SI:1:EI,:);
        
        % simplify the obstacle group as line segments
        [END_PTS, KP_IDX]	= dpsimplify(PT_MATRIX ,IPT.LINE_SIMP_THLD);
        
        for j = 1:length(END_PTS(:, 1)) - 1
            SI2 = KP_IDX(j) + SI - 1;
            EI2 = KP_IDX(j+1) + SI - 1;
            
            if EI2 - SI2 + 1 > 5
                [X_SEQ, Y_SEQ]  = line_segment_seq( END_PTS(j, :), ...
                                                    END_PTS(j+1, :), ...
                                                    EI2 - SI2 + 1);
                                                
                % add a small random noise for future use
                rng('default')
                X_SEQ = X_SEQ + 0.001*rand(size(X_SEQ)); %#THLD#
                Y_SEQ = Y_SEQ + 0.001*rand(size(Y_SEQ)); %#THLD#

                LIDL.PTS(SI2:EI2, 1) = X_SEQ;
                LIDL.PTS(SI2:EI2, 2) = Y_SEQ;
            end
        end
    end
end

if DEBUG == 1
    plot(LIDL.PTS(:,1), LIDL.PTS(:,2), 'r.')
   	hold off
end