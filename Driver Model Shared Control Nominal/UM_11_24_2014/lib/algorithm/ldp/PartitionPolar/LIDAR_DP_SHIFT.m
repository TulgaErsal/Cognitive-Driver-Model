function INFO1 = LIDAR_DP_SHIFT(IPT, LIMG, INFO, SIM)

%%

ACTIVE              = false;

% copy inputs to be used as outputs
SECINFO             = INFO.SECINFO;
END_PTS             = INFO.END_PTS;
EP_LOCAL            = INFO.EP_LOCAL;
EP_POLAR            = INFO.EP_POLAR;
NSEC                = size(SECINFO, 1);

DIST_LI             = 1.5*LIMG.LR;  %#THLD#
PTS_LI              = LIMG.PTS;

% initialization
SECINFO_T2          = zeros(NSEC, 7);
SECINFO_T2(:, 1)    = 1:NSEC;
SECINFO_T2(:, 2)    = 1:NSEC;
SECINFO_T2(:, 3)    = SECINFO(:, 5);
SECINFO_T2(:, 4:7)  = NaN;

%% remove twisted blocks
LOOP                = true;

while(LOOP == true)
    LOOP            = false;
    
    RV_IDX          = find(EP_POLAR(:, 2) < EP_POLAR(:, 1));

    if length(RV_IDX) >= 2
        for i = 1:length(RV_IDX) - 1
            ACTIVE  = true;
            
            A1      = EP_POLAR(RV_IDX(i), 1);
            A2      = EP_POLAR(RV_IDX(i+1), 2);
            
            if A2 <= A1
                if DEBUG == 1
                    RV_IDX %#ok<NOPRT>
                    disp('LIDAR_DP_SHIFT twisted blocks')
                    pause
                end
                
                if SIM.LOGS == YES
                    fprintf(SIM.fid, '\t --------------------\n');
                    fprintf(SIM.fid, '\t Twisted sectors \n');
                    formatSpec = '\t S%3.0f modified\n';
                    fprintf(SIM.fid, formatSpec, SECINFO(RV_IDX(i), 1));
                    for j = RV_IDX(i) + 1: RV_IDX(i+1)
                        formatSpec = '\t S%3.0f removed\n';
                        fprintf(SIM.fid, formatSpec, SECINFO(j, 1));
                    end
                    fprintf(SIM.fid, '\t --------------------\n');
                    fprintf(SIM.fid, '\n');
                end
                
                SECINFO_T2(RV_IDX(i), 3)        = 0;
                END_PTS(RV_IDX(i), 3)           = END_PTS(RV_IDX(i + 1), 3);
                END_PTS(RV_IDX(i), 4)           = END_PTS(RV_IDX(i + 1), 4);

                [END_PTS, EP_LOCAL, EP_POLAR]   = MODIFY_SEC(IPT, END_PTS, EP_LOCAL, EP_POLAR, RV_IDX(i));
                
                RM_VEC                          = RV_IDX(i) + 1: RV_IDX(i+1);
                
                SECINFO_T2(RM_VEC, :)           = [];
                SECINFO(RM_VEC, :)              = [];
                END_PTS(RM_VEC, :)              = [];
                EP_LOCAL(RM_VEC, :)             = [];
                EP_POLAR(RM_VEC, :)             = [];
                
                LOOP                            = true;
                break; % break the for i = 1:length(RV_IDX) - 1
            end
        end
    end
end

SECINFO_T2(:,1) = 1:length(SECINFO_T2(:,1));
SECINFO_T2(:,2) = 1:length(SECINFO_T2(:,1));

%% shift sectors to upper left or right corner

% start the while loop
LOOP            = true;

while(LOOP == true)
    LOOP        = false;
    
    % index in (type 1 sector info) that are (listed in type 2 info second column)
    IDX_ST1     = SECINFO_T2(:, 2);
    % index in (type 2 sector info), who is a reversed-sector
    IDX_ST2_RV	= find(EP_POLAR(IDX_ST1, 2) < EP_POLAR(IDX_ST1, 1));
    % index in (type 1 sector info)
    IDX_ST1_RV  = SECINFO_T2(IDX_ST2_RV, 2);

    if ~isempty(IDX_ST1_RV)
        if SIM.LOGS == YES
            fprintf(SIM.fid, '+ Shift sectors\n');
            fprintf(SIM.fid, '\t --------------------\n');
        end
    
        for i = 1:length(IDX_ST1_RV)
            
            ACTIVE = true;

            IDX_1i = IDX_ST1_RV(i);
            IDX_2i = IDX_ST2_RV(i);
            
            if SECINFO(IDX_1i, 5) == -1
                disp('LIDAR_DP_SHIFT, SECINFO(IDX_1i, 5) == -1')
                % pause
            end

            if IDX_2i ~= SECINFO_T2(1, 1) && IDX_2i ~= SECINFO_T2(end, 1)
                DIST1 = norm(END_PTS(IDX_1i, 1:2) - IPT.VP);
                DIST2 = norm(END_PTS(IDX_1i, 3:4) - IPT.VP);
                
                if DIST1 <= DIST2
                    [SECINFO_T2, SECINFO , END_PTS, EP_LOCAL, EP_POLAR] = ...
                    LIDAR_DP_SHIFT_RIGHT(IPT, DIST_LI, PTS_LI, IDX_1i, IDX_2i, ...
                    SECINFO_T2, SECINFO , END_PTS, EP_LOCAL, EP_POLAR, SIM);

                    LOOP = true;
                    break;
                else
                    [SECINFO_T2, SECINFO , END_PTS, EP_LOCAL, EP_POLAR] = ...
                    LIDAR_DP_SHIFT_LEFT(IPT, DIST_LI, PTS_LI, IDX_1i, IDX_2i, ...
                    SECINFO_T2, SECINFO , END_PTS, EP_LOCAL, EP_POLAR, SIM);
                
                    LOOP = true;
                    break;
                end
            else
                SECINFO %#ok<NOPRT>
                EP_POLAR(:, 1:2)*180/pi %#ok<NOPRT>
                disp('LIDAR_DP_SHIFT, end sector is a reversed-sector')
                % pause
            end

        end % for i = 1:length(IDX_ST1_RV)

        if SIM.LOGS == YES
            fprintf(SIM.fid, '\t --------------------\n');
            fprintf(SIM.fid, '\n');
        end
        
    end % if ~isempty(IDX_ST1_RV)
    
    % filename = mfilename;
    % INFOi.SECINFO_T2     = SECINFO_T2;
    % INFOi.SECINFO        = SECINFO;
    % INFOi.END_PTS        = END_PTS;
    % INFOi.EP_LOCAL       = EP_LOCAL;
    % INFOi.EP_POLAR       = EP_POLAR;
    % DEBUG_FIGURES(filename, IPT, LIMG, INFOi)
    % pause
end

%%
if EP_POLAR(SECINFO_T2(1, 2), 2) < EP_POLAR(SECINFO_T2(1, 2), 1)
    SECINFO_T2(1, :)    = [];
end

if EP_POLAR(SECINFO_T2(end, 2), 2) < EP_POLAR(SECINFO_T2(end, 2), 1)
    SECINFO_T2(end, :)  = [];
end

%#PATCH# 20141109
if length(SECINFO_T2(:, 1)) > 1
    for i = 1:length(SECINFO_T2(:, 1))-1
        S1 = SECINFO_T2(i, 2);
        S2 = SECINFO_T2(i+1, 2);
        if EP_POLAR(S1, 2) ~= EP_POLAR(S2, 1)
            if EP_POLAR(S1, 4) > EP_POLAR(S2, 3)
                EP_POLAR(S2, 1) = EP_POLAR(S1, 2);
            else
                EP_POLAR(S1, 2) = EP_POLAR(S2, 1);
            end
        end
    end
end

INFO1.SECINFO_T2        = SECINFO_T2;
INFO1.SECINFO           = SECINFO;
INFO1.END_PTS           = END_PTS;
INFO1.EP_LOCAL          = EP_LOCAL;
INFO1.EP_POLAR          = EP_POLAR;
INFO1.ACTIVE            = ACTIVE;

PRINT_INFO_T2(INFO1, SIM);

if ACTIVE == true
    filename = mfilename;
    DEBUG_FIGURES_T2(filename, IPT, LIMG, INFO1);
end