function SEQ = LIDAR_DP_SEQINFO_RHP1(INFO, PBM, i, SIM)

% difference
% IDX_LHP --> IDX_RHP
% SECINFO_T2(IDX_RHP(i), 4) --> SECINFO_T2(IDX_RHP(i), 6)
% SEQ.EP_LOCAL(end, 1:2) --> SEQ.EP_LOCAL(end, 3:4)

SECINFO_T2  = INFO.SECINFO_T2;
END_PTS     = INFO.END_PTS;
EP_LOCAL    = INFO.EP_LOCAL;
EP_POLAR    = INFO.EP_POLAR;

FRN_SEC     = PBM.FRN_SEC;
IDX_RHP    	= PBM.IDX_RHP(i);

% ----------------------------------------------------------------
% type and sequence
if FRN_SEC < IDX_RHP
    SEQ.TYPE   = 301; 
    SEQ.SEQ    = FRN_SEC:1:IDX_RHP;
elseif FRN_SEC > IDX_RHP(i)
    SEQ.TYPE   = 302;
    SEQ.SEQ    = FRN_SEC:-1:IDX_RHP;
elseif FRN_SEC == IDX_RHP(i)
    SEQ.TYPE   = 303; 
    SEQ.SEQ    = IDX_RHP;
end

% ----------------------------------------------------------------
% end points
SEQ.SEC_TYPE	= [ SECINFO_T2(SEQ.SEQ, 3); 1];
SEQ.END_PTS     = [ END_PTS( SECINFO_T2(SEQ.SEQ, 2), 1:6); ...
                    END_PTS( SECINFO_T2(IDX_RHP(i), 6), 1:6)];
SEQ.EP_LOCAL    = [ EP_LOCAL(SECINFO_T2(SEQ.SEQ, 2), 1:6); ...
                    EP_LOCAL(SECINFO_T2(IDX_RHP(i), 6), 1:6)];
SEQ.EP_POLAR    = [ EP_POLAR(SECINFO_T2(SEQ.SEQ, 2), 1:4); ...
                    EP_POLAR(SECINFO_T2(IDX_RHP(i), 6), 1:4)];

ANGLE           = atan2(SEQ.EP_LOCAL(end, 2) - SEQ.EP_LOCAL(end, 6), ...
                        SEQ.EP_LOCAL(end, 1) - SEQ.EP_LOCAL(end, 5));
A_L             = ANGLE;
A_U             = ANGLE;
R_L             = 0;
R_U             = norm(SEQ.EP_LOCAL(end, 1:2) - SEQ.EP_LOCAL(end, 5:6));
SEQ.EVFSLB      = [R_L, A_L];
SEQ.EVFSUB      = [R_U, A_U];
SEQ.FSREFPT     = SEQ.EP_LOCAL(end, 5:6);

if DEBUG == 1
 	figure
    hold on
    title(['OCP RHP1#', num2str(i)])
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
    fprintf(SIM.fid, '\t right side hypothetical opening (FML1)\n');
    % ------------------------------------------------------------
    % sector sequence: the indexes are the original indexes
    formatSpec = '\t * Seq #%d (TYPE%d): ';
    fprintf(SIM.fid, formatSpec, i, SEQ.TYPE);
    formatSpec = ' -%d- ';
    for j = 1:length(SEQ.SEQ)
        fprintf(SIM.fid, formatSpec, SECINFO_T2(SEQ.SEQ(j), 2));
    end
    fprintf(SIM.fid, formatSpec, SECINFO_T2(IDX_RHP(i), 6));
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