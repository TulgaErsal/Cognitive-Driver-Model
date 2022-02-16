function INFO = LIDAR_DP_SECINFO(IPT, LIMG, SIM)

filename    = mfilename;
filename    = strrep(filename, '_', ' ');

%% preallocation:
% maximum number of sectors used for preallocation
MAX_NSEC  	= 150; %#THLD#
SECINFO   	= zeros(MAX_NSEC, 5);
END_PTS   	= NaN*zeros(MAX_NSEC, 8);

% number of sectors
NSEC        = 0;

% number of obstacles (line segments)
NOB         = 0;

%% initialization
% if there is at least one obstacle group
if ~isempty(LIMG.OBSI)
    
    if DEBUG == 1
        figure
        hold on;
        % axis equal
        title([filename, ' - End Points'])
        plot(LIMG.PTS(:,1), LIMG.PTS(:,2),'k','LineWidth',2)
    end
    
    % loop through all obstacles
    for i = 1:length(LIMG.OBSI)
        % expand the obstacle group index to account for the connection
        % between the obstacle and the opening
        SI                      = max([LIMG.OBSI(i)-1, 1]);
        EI                      = min([LIMG.OBEI(i)+1, length(LIMG.PTS)]);
        
        PT_MATRIX               = LIMG.PTS(SI:1:EI,:);
        
        % simplify the obstacle group as line segments
        [END_POINTS, POINT_IDX]	= dpsimplify(PT_MATRIX ,IPT.LINE_SIMP_THLD);

        % loop through all line segments
        for j = 1:length(POINT_IDX) - 1
            NOB                 = NOB + 1;
            
            % line segment start index
            OBLSID              = POINT_IDX(j)   + SI - 1;
            % line segment end index
            OBLEID              = POINT_IDX(j+1) + SI - 1;
            
            OBLSPT              = END_POINTS(j,:);
            OBLEPT              = END_POINTS(j+1,:);
            
            NSEC                = NSEC + 1;
            
            SECINFO(NSEC, 2)    = OBLSID;
            SECINFO(NSEC, 3)    = OBLEID;
            SECINFO(NSEC, 4)    = NOB;
            
            % determine the type of the sector 
            DIFF                = diff(LIMG.PTS(OBLSID:OBLEID,:));
            DIST                = sqrt(DIFF(:, 1).^2 + DIFF(:, 2).^2);

            if max(DIST) > 2*IPT.MINDIST_THLD % && OBLEID - OBLSID + 1 <= 5 %#THLD#
                SECINFO(NSEC, 5)= 0; % hypothetical opening
            else
                SECINFO(NSEC, 5)= 1; % obstacle
            end
            
            END_PTS(NSEC, 1)    = OBLSPT(1);
            END_PTS(NSEC, 2)    = OBLSPT(2);
            END_PTS(NSEC, 3)    = OBLEPT(1);
            END_PTS(NSEC, 4)    = OBLEPT(2);
            END_PTS(NSEC, 5) 	= LIMG.VP(1);
            END_PTS(NSEC, 6) 	= LIMG.VP(2);
            END_PTS(NSEC, 7)    = norm(OBLEPT - OBLSPT);
            END_PTS(NSEC, 8)    = atan2((OBLEPT(2) - OBLSPT(2)), (OBLEPT(1) - OBLSPT(1)));
            
            if DEBUG == 1
                hold on;
                plot(OBLSPT(1), OBLSPT(2), 'ro','MarkerSize', 5)
                plot(OBLEPT(1), OBLEPT(2), 'bo','MarkerSize', 8)
                PLOT_LINE(OBLSPT, OBLEPT, '-', rand(3,1)', 2)
                hold off;
            end
        end
    end
end

% if there is at least one opening
if ~isempty(LIMG.OPSI)
    % loop through all openings
    for i = 1:length(LIMG.OPSI)
        NSEC                    = NSEC + 1;
        
        SECINFO(NSEC, 2)        = LIMG.OPSI(i);
        SECINFO(NSEC, 3)        = LIMG.OPEI(i);
        SECINFO(NSEC, 4)        = - i;
        SECINFO(NSEC, 5)        = - 1;
        
        END_PTS(NSEC, 1)        = LIMG.PTS(SECINFO(NSEC,2),1);
        END_PTS(NSEC, 2)        = LIMG.PTS(SECINFO(NSEC,2),2);
        END_PTS(NSEC, 3)        = LIMG.PTS(SECINFO(NSEC,3),1);
        END_PTS(NSEC, 4)        = LIMG.PTS(SECINFO(NSEC,3),2);
        END_PTS(NSEC, 5)        = LIMG.VP(1);
        END_PTS(NSEC, 6)        = LIMG.VP(2);
    end
end

SECINFO                         = SECINFO(1:NSEC, :);
END_PTS                         = END_PTS(1:NSEC, :);

% end points in local coordinate
EP_LOCAL                        = LIDAR_DP_EPLOCAL(IPT, END_PTS);

% end points in polar coordinate
EP_POLAR                        = LIDAR_DP_EPPOLAR(EP_LOCAL);

EP_POLAR                        = EP_POLAR_CORRECT(EP_POLAR);

%% processing

%% =STEP=1=====sort according to the start index===========================
[~, IDX]	= sort(SECINFO(:,2));

SECINFO    	= SECINFO(IDX, :);
END_PTS    	= END_PTS(IDX, :);
EP_LOCAL  	= EP_LOCAL(IDX, :);
EP_POLAR   	= EP_POLAR(IDX, :);

if SIM.LOGS == YES
    fprintf(SIM.fid, '+ Sector processing\n');
    fprintf(SIM.fid, '@@@ First Pass @@@@@@@\n');
    PRINT_SEC_N_POLAR(SECINFO, EP_POLAR, SIM);
end

%% =STEP=2=====rearrange according to angle================================
% e.g. IDX == NSEC
%       48.3     113.3     120.0     120.0
%      113.3     113.2     120.0     109.3
%      113.2     114.0     109.3     107.6
%      114.0     144.4     107.6     117.5
%      144.4     144.8     117.5     118.9
%      144.8      48.3     118.9     120.0 <--
% e.g. IDX ~= NSEC
%        6.7      24.3      67.5     118.0
%       24.3     155.7     118.0     118.0
%      155.7     178.4     118.0      60.8
%      178.4     179.4      60.8      60.4
%      179.4       0.6      60.4      60.4 <--
%        0.6       1.6      60.4      60.8
%        1.6       6.7      60.8      67.5

% [~, IDX]            = min(EP_POLAR(:,2) - EP_POLAR(:,1));

[~, IDX]            = min(diff([EP_POLAR(:, 1); EP_POLAR(1, 1)]));

if length(IDX) == 1
    if IDX ~= NSEC
        SEQ         = [IDX+1:1:NSEC, 1:1:IDX];
        
        SECINFO  	= SECINFO(SEQ, :);
        END_PTS    	= END_PTS(SEQ, :);
        EP_LOCAL   	= EP_LOCAL(SEQ, :);
        EP_POLAR   	= EP_POLAR(SEQ, :);
    end
end

if SIM.LOGS == YES
    fprintf(SIM.fid, '@@@ Second Pass @@@@@@@\n');
    PRINT_SEC_N_POLAR(SECINFO, EP_POLAR, SIM);
end

%% =STEP=3=====remove a sector=============================================
% that define the line connecting the start point and end point reversely
% e.g.
%        0.6       1.6      60.4      60.8
%        1.6       6.7      60.8      67.5
%        6.7      24.3      67.5     118.0
%       24.3     155.7     118.0     118.0
%      155.7     178.4     118.0      60.8
%      178.4     179.4      60.8      60.4
%      179.4       0.6      60.4      60.4 <-- removed

IDX3                = EP_POLAR(:,2) - EP_POLAR(:,1) <= - pi + pi/180;  %#THLD#

if sum(IDX3) ~= 0
    if SIM.LOGS == YES
        fprintf(SIM.fid, '@@@ Third Pass @@@@@@@\n');
        fprintf(SIM.fid, '\t - Remove the line connecting start and end points\n');
        fprintf(SIM.fid, '\t * End points in polar coordinate\n');
        formatSpec = '%10.1f%10.1f%10.1f%10.1f\n';
        fprintf(SIM.fid, '\t * Last  Sector: ');
        fprintf(SIM.fid, formatSpec, EP_POLAR(end,1:2)*180/pi, EP_POLAR(end,3:4));
        fprintf(SIM.fid, '\n');
    end
    
    SECINFO(IDX3, :)    = [];
    END_PTS(IDX3, :)    = [];
    EP_LOCAL(IDX3, :)   = [];
    EP_POLAR(IDX3, :)   = [];
end

NSEC                = size(SECINFO, 1);
SECINFO(1:NSEC, 1)  = 1:NSEC;

%% =STEP=4=====split a sector==============================================
% that is at the end into two sectors
% e.g.
%       48.3     113.3     120.0     120.0
%      113.3     113.2     120.0     109.3
%      113.2     114.0     109.3     107.6
%      114.0     144.4     107.6     117.5
%      144.4     144.8     117.5     118.9
%      144.8      48.3     118.9     120.0 <--

% if EP_POLAR(1, 1)< 1*pi/180 && EP_POLAR(1, 1) >0 && ...
%    EP_POLAR(1, 1) == EP_POLAR(end, 2)
%     EP_POLAR(end, 2) = pi;
%     RP_LOCAL
%     ......
% end

if EP_POLAR(1, 1)> 0.01*pi/180 && EP_POLAR(1, 1) == EP_POLAR(end, 2)  %#THLD#
    if SIM.LOGS == YES
        fprintf(SIM.fid, '@@@ Fourth Pass @@@@@@@\n');
        fprintf(SIM.fid, '\t - Split the sector at the end\n');
        
        fprintf(SIM.fid, '\t * End points w.r.t. in polar coordinate\n');
        formatSpec = '%10.1f%10.1f%10.1f%10.1f\n';
        fprintf(SIM.fid, '\t * First Sector: ');
        fprintf(SIM.fid, formatSpec, EP_POLAR(1,1:2)*180/pi,   EP_POLAR(1,3:4));
        fprintf(SIM.fid, '\t * Last  Sector: ');
        fprintf(SIM.fid, formatSpec, EP_POLAR(end,1:2)*180/pi, EP_POLAR(end,3:4));
        fprintf(SIM.fid, '\n');
    end
    
    if SECINFO(end,5) == -1
        SEC_NAME    = min(SECINFO(:, 4)) - 1;
    else
        SEC_NAME    = max(SECINFO(:, 4)) + 1;
    end
    
    if DEBUG == 1
        if SECINFO(end,5) ~= -1
            SECINFO %#ok<NOPRT>
            disp('SECINFO STEP 4')
        end
    end

    SECINFO_S       = [0, nan, nan, SEC_NAME, SECINFO(end,5)];
    
    %#CHECK# the usage of LIMG.DPTS
    END_PTS_S       = [LIMG.DPTS(1,1:2), END_PTS(1,1:2), LIMG.VP, nan, nan];
    
    END_PTS_S(7)    = norm(END_PTS_S(3:4) - END_PTS_S(1:2));
    END_PTS_S(8)    = atan2((END_PTS_S(4) - END_PTS_S(2)), (END_PTS_S(3) - END_PTS_S(1)));
    
    EP_LOCAL_S      = LIDAR_DP_EPLOCAL(IPT, END_PTS_S); 
    EP_POLAR_S      = LIDAR_DP_EPPOLAR(EP_LOCAL_S);
    
    SECINFO_E       = [0, nan, nan, SECINFO(end,4), SECINFO(end,5)];
    
    %#CHECK# the usage of LIMG.DPTS
    END_PTS_E       = [END_PTS(end,1:2), LIMG.DPTS(end,1:2), LIMG.VP, nan, nan];
    
    END_PTS_E(7)    = norm(END_PTS_E(3:4) - END_PTS_E(1:2));
    END_PTS_E(8)    = atan2((END_PTS_E(4) - END_PTS_E(2)), (END_PTS_E(3) - END_PTS_E(1)));
    
    EP_LOCAL_E      = LIDAR_DP_EPLOCAL(IPT, END_PTS_E); 
    EP_POLAR_E      = LIDAR_DP_EPPOLAR(EP_LOCAL_E);
    
    SECINFO         = [SECINFO_S;  SECINFO(1:end-1,:);  SECINFO_E];
    END_PTS         = [END_PTS_S;  END_PTS(1:end-1,:);  END_PTS_E];
    EP_LOCAL        = [EP_LOCAL_S; EP_LOCAL(1:end-1,:); EP_LOCAL_E];
    EP_POLAR        = [EP_POLAR_S; EP_POLAR(1:end-1,:); EP_POLAR_E];
    
    EP_POLAR       	= EP_POLAR_CORRECT(EP_POLAR);
    
    NSEC            = NSEC + 1;
end

% sector index
SECINFO(1:NSEC, 1)  = 1:NSEC;

%% =STEP=5=====remove extreme small sectors================================
IDX                 = find(abs(EP_POLAR(:,2) - EP_POLAR(:,1)) < 0.05*pi/180);  %#THLD#

if SIM.LOGS == YES && ~isempty(IDX)
    fprintf(SIM.fid, '@@@ Fifth Pass @@@@@@@\n');
    fprintf(SIM.fid, '\t - Remove extreme small sectors\n');
    fprintf(SIM.fid, '\t * End points in polar coordinate\n');
    for i = 1:length(IDX)
        formatSpec = 'S%4.0f - %10.1f%10.1f%10.1f%10.1f\n';
        fprintf(SIM.fid, formatSpec, IDX(i), EP_POLAR(IDX(i),1:2)*180/pi, EP_POLAR(IDX(i),3:4));
    end
    fprintf(SIM.fid, '\n');
end

SECINFO(IDX, :)   	= [];
END_PTS(IDX, :)   	= [];
EP_LOCAL(IDX, :)   	= [];
EP_POLAR(IDX, :)  	= [];

NSEC                = size(SECINFO, 1);

%% =STEP=6=====combine adjcent openings====================================
if NSEC > 1
    RM_CNT                      = 0;
    RM_IDX                      = zeros(1, NSEC);
    for i = 1:NSEC - 1
        if SECINFO(i, 5) == -1 && SECINFO(i+1, 5) == -1
            RM_CNT              = RM_CNT + 1;
            RM_IDX(RM_CNT)      = i;
        end
    end
    
    if RM_CNT >= 1
        RM_IDX                  = RM_IDX(1:RM_CNT);
    else
        RM_IDX                  = []; 
    end
    
    if SIM.LOGS == YES && ~isempty(RM_IDX)
        fprintf(SIM.fid, '@@@ Sixth Pass @@@@@@@\n');
        fprintf(SIM.fid, '\t - Combine adjcent openings\n');
        fprintf(SIM.fid, '\t * End points w.r.t. vehicle position (in Polar Coordinate)\n');
        for i = 1:length(RM_IDX)
            formatSpec = 'S%4.0f - %10.1f%10.1f%10.1f%10.1f\n';
            fprintf(SIM.fid, formatSpec, RM_IDX(i), EP_POLAR(RM_IDX(i),1:2)*180/pi, EP_POLAR(RM_IDX(i),3:4));
            fprintf(SIM.fid, formatSpec, RM_IDX(i)+1, EP_POLAR(RM_IDX(i)+1,1:2)*180/pi, EP_POLAR(RM_IDX(i)+1,3:4));
        end
        fprintf(SIM.fid, '\n');
    end
    
    if ~isempty(RM_IDX)
        for i = 1:length(RM_IDX)
            SECINFO(RM_IDX(i)+1, 2)     = SECINFO(RM_IDX(i), 2);
            
            END_PTS(RM_IDX(i)+1, 1)     = END_PTS(RM_IDX(i), 1);
            END_PTS(RM_IDX(i)+1, 2)     = END_PTS(RM_IDX(i), 2);
            
            EP_LOCAL(RM_IDX(i)+1, 1)	= EP_LOCAL(RM_IDX(i), 1);
            EP_LOCAL(RM_IDX(i)+1, 2)	= EP_LOCAL(RM_IDX(i), 2);
            
            EP_POLAR(RM_IDX(i)+1, 1)	= EP_POLAR(RM_IDX(i), 1);
            EP_POLAR(RM_IDX(i)+1, 3)	= EP_POLAR(RM_IDX(i), 3);
        end
    end
    
    SECINFO(RM_IDX, :)      = [];
    END_PTS(RM_IDX, :)      = [];
    EP_LOCAL(RM_IDX, :) 	= [];
    EP_POLAR(RM_IDX, :)  	= [];
    
    NSEC                    = size(SECINFO, 1);
end

%% =STEP=7=====make the end points consistent==============================
for i = 1:NSEC
    if SECINFO(i, 5) == 0
        if i > 1
            END_PTS(i,1:2)  = END_PTS(i-1,3:4);
            EP_LOCAL(i,1:2) = EP_LOCAL(i-1,3:4);
            EP_POLAR(i,1)   = EP_POLAR(i-1,2);
            EP_POLAR(i,3)   = EP_POLAR(i-1,4);
        end
        if i < NSEC
            END_PTS(i,3:4)  = END_PTS(i+1,1:2);
            EP_LOCAL(i,3:4) = EP_LOCAL(i+1,1:2);
            EP_POLAR(i,2)   = EP_POLAR(i+1,1);
            EP_POLAR(i,4)   = EP_POLAR(i+1,3);
        end
    end
end

EP_POLAR                    = EP_POLAR_CORRECT(EP_POLAR);

%% outputs
INFO.SECINFO    	= SECINFO;
INFO.END_PTS     	= END_PTS;
INFO.EP_LOCAL     	= EP_LOCAL;
INFO.EP_POLAR     	= EP_POLAR;

% log
if SIM.LOGS == YES
    fprintf(SIM.fid, '@@@ Final information @@@@@@@\n');
    PRINT_INFO(INFO, SIM);
end

% figure
filename = mfilename;
DEBUG_FIGURES(filename, IPT, LIMG, INFO)