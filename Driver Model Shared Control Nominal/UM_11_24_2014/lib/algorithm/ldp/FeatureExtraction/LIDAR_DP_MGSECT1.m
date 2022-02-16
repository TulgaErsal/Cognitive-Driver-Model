function INFO_C1 = LIDAR_DP_MGSECT1(IPT, LIMG, INFO, SIM)

ACTIVE              = false;

% copy inputs to be used as outputs
SECINFO             = INFO.SECINFO;
END_PTS             = INFO.END_PTS;
EP_LOCAL            = INFO.EP_LOCAL;
EP_POLAR            = INFO.EP_POLAR;

% slope
SLOPE               = END_PTS(:, 8);

% find the slope difference between the adjecent line segments
SLOPE_DIFF1         = diff(SLOPE);
SLOPE_DIFF1         = atan2(sin(SLOPE_DIFF1), cos(SLOPE_DIFF1));

SLOPE_DIFF2         = flipud(diff(flipud(SLOPE)));
SLOPE_DIFF2         = atan2(sin(SLOPE_DIFF2), cos(SLOPE_DIFF2));

SLOPE_DIFF          = min(abs(SLOPE_DIFF1), abs(SLOPE_DIFF2));

% collect indexes of sectors to be removed
IDX                 = find(SLOPE_DIFF < 2*pi/180); %#THLD#

% remove combinations where the distance between the two are large
if ~isempty(IDX)
    RM_CNT          = 0;
    RM_IDX          = [];
    
    for i = 1:length(IDX)
        DIST        = norm(END_PTS(IDX(i), 3:4) - END_PTS(IDX(i)+1, 1:2));
        
        if DIST > 0.1 %#THLD#
            RM_CNT  = RM_CNT + 1;
         	RM_IDX  = [RM_IDX, i]; %#ok<AGROW>
        end
    end
    
    if RM_CNT ~= 0
        IDX(RM_IDX) = [];
    end
end

% combine sectors
if ~isempty(IDX)
    ACTIVE                   = true;
    
    if SIM.LOGS == YES
        fprintf(SIM.fid, '+ Combine sectors of the same slope\n');
        fprintf(SIM.fid, '\t --------------------\n');
    end
    
    GCNT                    = 1;
    GROUP{GCNT}             = [IDX(1), IDX(1) + 1];
    
    if length(IDX) >= 2
        for i = 2:length(IDX)
            if IDX(i) == IDX(i-1) + 1
                GROUP{GCNT} = [GROUP{GCNT}, IDX(i) + 1];
            else
                GCNT        = GCNT + 1;
                GROUP{GCNT} = [IDX(i), IDX(i) + 1];
            end
        end
    end
    
    RM_VEC                  = zeros(size(SECINFO,1), 1);
    RM_CNT                  = 0;
    for i = 1:length(GROUP)
        for j = 2:length(GROUP{i})
            RM_CNT          = RM_CNT + 1;
            RM_VEC(RM_CNT)  = GROUP{i}(j);
            
            if SIM.LOGS == YES
                formatSpec = '\t S%3.0f combined to S%3.0f\n';
                fprintf(SIM.fid, formatSpec, SECINFO(GROUP{i}(j),1), SECINFO(GROUP{i}(1),1));
            end
        end

        IDX                 = GROUP{i}(1);
        END_PTS(IDX, 3:4)   = END_PTS(GROUP{i}(end), 3:4);
        SECINFO(IDX, 3)     = SECINFO(GROUP{i}(end), 3);
        
        [END_PTS, EP_LOCAL, EP_POLAR] = MODIFY_SEC(IPT, END_PTS, EP_LOCAL, EP_POLAR, IDX);
    end
    
    if RM_CNT ~= 0
        RM_VEC              = RM_VEC(1:RM_CNT);
        SECINFO(RM_VEC,:)   = [];
        END_PTS(RM_VEC,:)   = [];
        EP_LOCAL(RM_VEC,:) 	= [];
        EP_POLAR(RM_VEC,:)  = [];
    end
    
    EP_POLAR                = EP_POLAR_CORRECT(EP_POLAR);
    
    if SIM.LOGS == YES
        fprintf(SIM.fid, '\t --------------------\n');
        fprintf(SIM.fid, '\n');
    end
end

INFO_C1.SECINFO     = SECINFO;
INFO_C1.END_PTS  	= END_PTS;
INFO_C1.EP_LOCAL	= EP_LOCAL;
INFO_C1.EP_POLAR	= EP_POLAR;
INFO_C1.ACTIVE      = ACTIVE;

if ACTIVE == true
    filename = mfilename;
    DEBUG_FIGURES(filename, IPT, LIMG, INFO_C1)
end