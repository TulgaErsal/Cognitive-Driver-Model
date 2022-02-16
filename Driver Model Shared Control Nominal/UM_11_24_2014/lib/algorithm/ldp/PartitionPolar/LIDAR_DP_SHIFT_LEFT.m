function [SECINFO_T2, SECINFO , END_PTS, EP_LOCAL, EP_POLAR] = ...
LIDAR_DP_SHIFT_LEFT(IPT, DIST_LI, PTS_LI, IDX_1i, IDX_2i, ...
SECINFO_T2, SECINFO , END_PTS, EP_LOCAL, EP_POLAR, SIM)

%%
IDX_2M          = [];
CNT_2M          = 0;

for j = (IDX_2i - 1):-1:1 % <---
    IDX_1j      = SECINFO_T2(j, 2);
    S_AG        = EP_POLAR(IDX_1j, 1); % start angle
    E_AG        = EP_POLAR(IDX_1j, 2); % end angle

    if EP_POLAR(IDX_1i, 2) < E_AG && EP_POLAR(IDX_1i, 2) > S_AG % <---
        IDX_2M  = j; % index of sector to be modified
        CNT_2M  = CNT_2M + 1;
        % break;
    end
end

if DEBUG == 1 && CNT_2M > 1
    disp('LIDAR_DP_SHIFT_LEFT, CNT_2M')
    pause
end

if isempty(IDX_2M)
    error('LIDAR_DP_SHIFT_LEFT, IDX_2M not exist')
end

%%
% sector IDX_1i is shifted to the upper left 
% and is attached to sector IDX_2M
SECINFO_T2(IDX_2M, 4)       = IDX_1i; % <---

% sector type
IDX_2M_TYPE                 = SECINFO_T2(IDX_2M, 3);
if IDX_2M_TYPE == -1
    IDX_2Mi_TYPE_T2         = -1;
elseif IDX_2M_TYPE == 1
    IDX_2Mi_TYPE_T2         = SECINFO_T2(IDX_2i, 3); % 1 or 0
elseif IDX_2M_TYPE == 0
    IDX_2Mi_TYPE_T2         = 0;
end

for k = IDX_2M + 1:IDX_2i - 1 % <---
    if SECINFO_T2(k, 3) == 0 || SECINFO_T2(k, 3) == -1
        IDX_2Mi_TYPE_T2     = 0;
    end
end

SECINFO_T2(IDX_2M, 5)       = IDX_2Mi_TYPE_T2; % <---

%%
IDX_1M              = SECINFO_T2(IDX_2M, 2);
IDX_1M_TYPE     	= SECINFO(IDX_1M, 5);

% XX1 YY1 XX2 YY2 in global coordinate
if      IDX_1M_TYPE == -1 % opening
    R               = min(EP_POLAR(IDX_1M, 3), EP_POLAR(IDX_1M, 4));
    A               = linspace(EP_POLAR(IDX_1M, 1), EP_POLAR(IDX_1M, 2), 100) + IPT.HA - pi/2;
    XX1             = IPT.VP(1) + R*cos(A);
    YY1             = IPT.VP(2) + R*sin(A);
elseif  IDX_1M_TYPE == 1 || IDX_1M_TYPE == 0 % obstacle
    XX1             = [END_PTS(IDX_1M, 1), END_PTS(IDX_1M, 3)];
    YY1             = [END_PTS(IDX_1M, 2), END_PTS(IDX_1M, 4)]; 
end

XX2                 = IPT.VP(1) + [0, DIST_LI]*cos(EP_POLAR(IDX_1i,2) + IPT.HA - pi/2); %<---
YY2                 = IPT.VP(2) + [0, DIST_LI]*sin(EP_POLAR(IDX_1i,2) + IPT.HA - pi/2); %<---

[XI1, YI1, ~, ~]    = intersections(XX1, YY1, XX2, YY2, true);

if DEBUG == 1
    figure
    hold on;
    plot(  [ END_PTS(IDX_1M, 1),  END_PTS(IDX_1M, 3)], ...
           [ END_PTS(IDX_1M, 2),  END_PTS(IDX_1M, 4)], 'm')
    plot(  [ END_PTS(IDX_1i, 1),  END_PTS(IDX_1i, 3)], ...
           [ END_PTS(IDX_1i, 2),  END_PTS(IDX_1i, 4)], 'c')
    plot(XX1, YY1, 'k', 'LineWidth', 2)
    plot(XX2, YY2, 'r', 'LineWidth', 2)
    plot(XI1, YI1, 'bo', 'LineWidth', 2)
    hold off;
end

if isempty(XI1)
    error('LIDAR_DP_SHIFT_LEFT, no intersection')
end

%%
POLY_X              = [PTS_LI(:,1); PTS_LI(1,1)];
POLY_Y              = [PTS_LI(:,2); PTS_LI(1,2)];

[X_SEQ, Y_SEQ]      = line_segment_seq(END_PTS(IDX_1i, 1:2), END_PTS(IDX_1i, 3:4), 100);
AREA                = zeros(1, length(X_SEQ));

for k = 1:length(X_SEQ)
    CONVEXITY       = convexity_check([X_SEQ(k), Y_SEQ(k)], [XI1, YI1], POLY_X, POLY_Y);
    
    if CONVEXITY == true
        AREA(k)     = triangle_area([X_SEQ(k), Y_SEQ(k)], [XI1, YI1], END_PTS(IDX_1i, 3:4));
    end
end

[MAX_A, MAX_IDX]    = max(AREA);

% if MAX_A ~= 0
    XI2             = X_SEQ(MAX_IDX); 
    YI2             = Y_SEQ(MAX_IDX);
    
    if DEBUG == 1
        hold on;
        plot(XI2, YI2, 'go', 'LineWidth', 2)
    end
% else
    % error('LIDAR_DP_SHIFT_LEFT, same line?')
% end

%%
if SIM.LOGS == YES
    fprintf(SIM.fid, '\t --------------------\n');
    formatSpec = '\t S%3.0f shift to left\n';
    fprintf(SIM.fid, formatSpec, SECINFO(IDX_1i,1));
    formatSpec = '\t \t S%3.0f modified\n';
    fprintf(SIM.fid, formatSpec, SECINFO(IDX_1M, 1));
    formatSpec = '\t \t S%3.0f modified\n';
    fprintf(SIM.fid, formatSpec, SECINFO(IDX_1i, 1));
end

OLD_END_PTS                     = END_PTS(IDX_1i, 3:4);

END_PTS(IDX_1M, 3)              = XI1;
END_PTS(IDX_1M, 4)              = YI1;

END_PTS(IDX_1i, 1)              = XI1;
END_PTS(IDX_1i, 2)              = YI1;
END_PTS(IDX_1i, 3)              = XI2;
END_PTS(IDX_1i, 4)              = YI2;
END_PTS(IDX_1i, 5)              = OLD_END_PTS(1);
END_PTS(IDX_1i, 6)              = OLD_END_PTS(2);

[END_PTS, EP_LOCAL, EP_POLAR]   = MODIFY_SEC(IPT, END_PTS, EP_LOCAL, EP_POLAR, IDX_1M);
[END_PTS, EP_LOCAL, EP_POLAR]   = MODIFY_SEC(IPT, END_PTS, EP_LOCAL, EP_POLAR, IDX_1i);

EP_POLAR                        = EP_POLAR_CORRECT(EP_POLAR);

if IDX_2M ~= IDX_2i - 1
    if SIM.LOGS == YES
        for k = IDX_2M + 1:IDX_2i - 1
            formatSpec = '\t \t S%3.0f removed\n';
            IDX_1k              = SECINFO_T2(k, 2);
            fprintf(SIM.fid, formatSpec, SECINFO(IDX_1k, 1));
        end
    end

    RM_VEC                      = IDX_2M + 1:IDX_2i - 1;
    RM_VEC                      = SECINFO_T2(RM_VEC, 2);
    
    RM_VEC_L                    = SECINFO_T2(RM_VEC, 4);
    RM_VEC_L(isnan(RM_VEC_L))	= [];
    
    RM_VEC_R                    = SECINFO_T2(RM_VEC, 6);
    RM_VEC_R(isnan(RM_VEC_R))	= [];

    RM_VEC2                     = [RM_VEC, RM_VEC_L, RM_VEC_R];

    SECINFO(RM_VEC2, :)         = [];
    END_PTS(RM_VEC2, :)         = [];
    EP_LOCAL(RM_VEC2, :)        = [];
    EP_POLAR(RM_VEC2, :)        = [];
end

if SIM.LOGS == YES
    fprintf(SIM.fid, '\t --------------------\n');
end

%%
SECINFO_T2(IDX_2M + 1:IDX_2i,:)     = [];
SECINFO_T2(:,1)                     = 1:length(SECINFO_T2(:,1));

IDX_CNT                             = 0;
IDX_MAP                             = [];
for m = 1:length(SECINFO_T2(:, 1))
    IDX_CNT                         = IDX_CNT + 1;
    IDX_MAP(IDX_CNT, :)             = [SECINFO_T2(m, 2), m, 2, 0]; %#ok<AGROW>
    
    if ~isnan(SECINFO_T2(m, 4))
        IDX_CNT                     = IDX_CNT + 1;
        IDX_MAP(IDX_CNT, :)         = [SECINFO_T2(m, 4), m, 4, 0]; %#ok<AGROW>
    end
    
    if ~isnan(SECINFO_T2(m, 6))
        IDX_CNT                     = IDX_CNT + 1;
        IDX_MAP(IDX_CNT, :)         = [SECINFO_T2(m, 6), m, 6, 0]; %#ok<AGROW>
    end
end

IDX_MAP                             = sortrows(IDX_MAP, 1);
IDX_MAP(:, 4)                       = 1:length(IDX_MAP(:, 1));

for m = 1:length(IDX_MAP(:, 1))
    mi                              = IDX_MAP(m, 2);
    mj                              = IDX_MAP(m, 3);
    mk                              = IDX_MAP(m, 4);
    SECINFO_T2(mi, mj)              = mk;
end
