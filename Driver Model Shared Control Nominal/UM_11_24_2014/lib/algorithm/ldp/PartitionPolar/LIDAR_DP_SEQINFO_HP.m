function SEQ = LIDAR_DP_SEQINFO_HP(INFO, PBM, i, SIM)

SECINFO_T2              = INFO.SECINFO_T2;
END_PTS                 = INFO.END_PTS;
EP_LOCAL                = INFO.EP_LOCAL;
EP_POLAR                = INFO.EP_POLAR;

FRN_SEC                 = PBM.FRN_SEC;
IDX_HP2                 = PBM.IDX_HP(i);

if IDX_HP2 > 1 && IDX_HP2 < length(SECINFO_T2(1, :))

IDX_HP1                 = SECINFO_T2(IDX_HP2, 2);
%#CHECK# it is possible that IDX_HP2 + 1 does not exist
IDX_HP1p                = SECINFO_T2(IDX_HP2 + 1, 2);
%#CHECK# it is possible that IDX_HP2 - 1 does not exist
IDX_HP1m                = SECINFO_T2(IDX_HP2 - 1, 2);

A_S                     = EP_POLAR(IDX_HP1, 1);
A_E                     = EP_POLAR(IDX_HP1, 2);
R_S                     = EP_POLAR(IDX_HP1, 3);
R_E                     = EP_POLAR(IDX_HP1, 4);

PTS_cp                  = [ EP_LOCAL(IDX_HP1, 1:2);
                            EP_LOCAL(IDX_HP1, 5:6);
                            EP_LOCAL(IDX_HP1p, 1:2);
                            EP_LOCAL(IDX_HP1p, 3:4) ];
                
PTS_cm                  = [ EP_LOCAL(IDX_HP1, 3:4);
                            EP_LOCAL(IDX_HP1, 5:6);
                            EP_LOCAL(IDX_HP1m, 1:2);
                            EP_LOCAL(IDX_HP1m, 3:4) ];

LIDAR_DP_SEQINFO_HP_debug1; %#DEBUG#

% ----------------------------------------------------------------
% type and sequence
if FRN_SEC < IDX_HP2
    if     R_S > R_E
        SEQ.TYPE        = 101;
        SEQ.SEQ         = FRN_SEC:1:IDX_HP2 - 1;
        
        % radius
        SEQ.EVFSLB(1)   = R_E; % norm(linlinintersect(PTS_cp) - EP_LOCAL(IDX_HP1, 5:6));
        SEQ.EVFSUB(1)   = R_S;

        % angle
        SEQ.EVFSLB(2)   = A_S;
        SEQ.EVFSUB(2)   = A_S;

        % reference point
        SEQ.FSREFPT     = EP_LOCAL(IDX_HP1, 5:6);
        
    elseif R_E > R_S
        SEQ.TYPE        = 102;
        SEQ.SEQ         = [FRN_SEC:1:IDX_HP2 - 1, IDX_HP2 + 1]; % <--- one more sector

        % radius
        SEQ.EVFSLB(1)   = R_S; % norm(linlinintersect(PTS_cm) - EP_LOCAL(IDX_HP1, 5:6));
        SEQ.EVFSUB(1)   = R_E;

        % angle
        SEQ.EVFSLB(2)   = A_E;
        SEQ.EVFSUB(2)   = A_E;

        % reference point
        SEQ.FSREFPT     = EP_LOCAL(IDX_HP1, 5:6);
        
        SEQ.OBJ_P       = EP_LOCAL(IDX_HP1, 3:4);
        SEQ.OBJ_A       = atan2((EP_LOCAL(IDX_HP1, 4) - EP_LOCAL(IDX_HP1, 2)), (EP_LOCAL(IDX_HP1, 3) - EP_LOCAL(IDX_HP1, 1))) - pi/2;
        
    end
elseif FRN_SEC > IDX_HP2
    if     R_E > R_S
        SEQ.TYPE        = 103;
        SEQ.SEQ         = FRN_SEC:-1:IDX_HP2 + 1;

        % radius
        SEQ.EVFSLB(1)   = norm(linlinintersect(PTS_cm) - EP_LOCAL(IDX_HP1, 5:6));
        SEQ.EVFSUB(1)   = R_E;

        % angle
        SEQ.EVFSLB(2)   = A_E;
        SEQ.EVFSUB(2)   = A_E;

        SEQ.FSREFPT     = EP_LOCAL(IDX_HP1, 5:6);

    elseif R_S > R_E
        SEQ.TYPE        = 104;
        SEQ.SEQ         = [FRN_SEC:-1:IDX_HP2 + 1, max([IDX_HP2 - 1, 1])];

        % radius
        SEQ.EVFSLB(1)   = norm(linlinintersect(PTS_cp) - EP_LOCAL(IDX_HP1, 5:6));
        SEQ.EVFSUB(1)   = R_S;

        % angle
        SEQ.EVFSLB(2)   = A_S;
        SEQ.EVFSUB(2)   = A_S;

        SEQ.FSREFPT     = EP_LOCAL(IDX_HP1, 5:6);
    end
elseif FRN_SEC == IDX_HP2
        SEQ.TYPE        = 105;
        SEQ.SEQ         = IDX_HP2;

        % radius
        SEQ.EVFSLB(1)   = min([R_S, R_E]);
        SEQ.EVFSUB(1)   = min([R_S, R_E]);

        % angle
        SEQ.EVFSLB(2)   = A_S;
        SEQ.EVFSUB(2)   = A_E;

        SEQ.FSREFPT     = EP_LOCAL(IDX_HP1, 5:6);
end

end

% ----------------------------------------------------------------
% end points
SEQ.SEC_TYPE   = ones(size(SECINFO_T2(SEQ.SEQ, 3)));
SEQ.END_PTS    = END_PTS( SECINFO_T2(SEQ.SEQ, 2), 1:6);
SEQ.EP_LOCAL   = EP_LOCAL(SECINFO_T2(SEQ.SEQ, 2), 1:6);
SEQ.EP_POLAR   = EP_POLAR(SECINFO_T2(SEQ.SEQ, 2), 1:4);

if DEBUG == 1
 	figure
    hold on
    title(['OCP HP#', num2str(i)])
    SEC_IDX = 1:length(SEQ.SEC_TYPE);
    SECTOR_PATCH(SEC_IDX, SEQ.SEC_TYPE, SEQ.EP_LOCAL)
    
    PT1(1) = SEQ.FSREFPT(1) + SEQ.EVFSLB(1)*cos(SEQ.EVFSLB(2));
    PT1(2) = SEQ.FSREFPT(2) + SEQ.EVFSLB(1)*sin(SEQ.EVFSLB(2));

    PT2(1) = SEQ.FSREFPT(1) + SEQ.EVFSUB(1)*cos(SEQ.EVFSLB(2));
    PT2(2) = SEQ.FSREFPT(2) + SEQ.EVFSUB(1)*sin(SEQ.EVFSLB(2));

    plot([PT1(1), PT2(1)], [PT1(2), PT2(2)], 'k', 'LineWidth', 3)
    plot([PT1(1), PT2(1)], [PT1(2), PT2(2)], 'w--', 'LineWidth', 2)
    hold off
end

if SIM.LOGS == YES
    fprintf(SIM.fid, '\t ______________________________________________________________________\n');
    fprintf(SIM.fid, '\t hypothetical opening \n');
    % ------------------------------------------------------------
    % sector sequence: the indexes are the original indexes
    formatSpec = '\t * Seq #%d (TYPE%d): ';
    fprintf(SIM.fid, formatSpec, i, SEQ.TYPE);
    formatSpec = ' -%d- ';
    for j = 1:length(SEQ.SEQ)
        fprintf(SIM.fid, formatSpec, SECINFO_T2(SEQ.SEQ(j), 2));
    end
    fprintf(SIM.fid, '\n');

    fprintf(SIM.fid, '\t - End points in local coordinates:\n');
    formatSpec = ' \t %8.1f%8.1f%8.1f%8.1f%8.1f%8.1f\n';
    for j = 1:length(SEQ.SEQ)
        fprintf(SIM.fid, formatSpec, SEQ.EP_LOCAL(j,:));
    end

    fprintf(SIM.fid, '\t - Final states event:\n');
    formatSpec = '\t * Angle bounds: %3.1f - %3.1f degree\n';
    fprintf(SIM.fid, formatSpec, SEQ.EVFSLB(2)*180/pi, SEQ.EVFSUB(2)*180/pi);
    formatSpec = '\t * Radius bounds: %3.1f - %3.1f m\n';
    fprintf(SIM.fid, formatSpec, SEQ.EVFSLB(1), SEQ.EVFSUB(1));
    formatSpec = '\t * Reference point: (%3.1f, %3.1f)\n';
    fprintf(SIM.fid, formatSpec, SEQ.FSREFPT(1), SEQ.FSREFPT(2));

    fprintf(SIM.fid, '\t ______________________________________________________________________\n');
end