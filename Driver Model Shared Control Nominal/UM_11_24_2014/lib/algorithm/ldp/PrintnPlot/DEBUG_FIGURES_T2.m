function DEBUG_FIGURES_T2(filename, IPT, LIMG, INFO)

filename = strrep(filename, '_', ' ');

if DEBUG == 1

    SECINFO_T2 = INFO.SECINFO_T2;
    
    SEC_IDX  = SECINFO_T2(:, 2);
    SEC_TYPE = SECINFO_T2(:, 3);
    
    for i = 1:length(SECINFO_T2(:, 1))
        if ~isnan(SECINFO_T2(i, 4))
            SEC_IDX = [SEC_IDX; SECINFO_T2(i, 4)]; %#ok<AGROW>
            SEC_TYPE = [SEC_TYPE; SECINFO_T2(i, 5)]; %#ok<AGROW>
        end
        if ~isnan(SECINFO_T2(i, 6))
            SEC_IDX = [SEC_IDX; SECINFO_T2(i, 6)]; %#ok<AGROW>
            SEC_TYPE = [SEC_TYPE; SECINFO_T2(i, 7)]; %#ok<AGROW>
        end
    end
    
    PT_X        = LIMG.PTS(:,1) - IPT.VP(1);
    PT_Y        = LIMG.PTS(:,2) - IPT.VP(2);
    TMP         = [PT_X, PT_Y]*IPT.RM_G2L;
    PT_X        = TMP(:, 1);
    PT_Y        = TMP(:, 2);

    figure
    title([filename, '- PATCH'])
    hold on;
    plot(PT_X, PT_Y,'k', 'LineWidth', 2)
    SECTOR_PATCH(SEC_IDX, SEC_TYPE, INFO.EP_LOCAL)
    hold off;
    
    figure
    title([filename, '- LINE'])
    hold on;
    plot(PT_X, PT_Y,'k', 'LineWidth', 2)
    SECTOR_LINE(INFO.SECINFO, INFO.EP_LOCAL)
    hold off;
end