function DEBUG_FIGURES(filename, IPT, LIMG, INFO)

if DEBUG == 1
    filename    = strrep(filename, '_', ' ');
    
    PT_X        = LIMG.PTS(:,1) - IPT.VP(1);
    PT_Y        = LIMG.PTS(:,2) - IPT.VP(2);
    TMP         = [PT_X, PT_Y]*IPT.RM_G2L;
    PT_X        = TMP(:, 1);
    PT_Y        = TMP(:, 2);
    
    SEC_IDX     = 1:size(INFO.SECINFO, 1);
    SEC_TYPE    = INFO.SECINFO(:,4);
    
    figure
    title([filename, '- PATCH'])
    hold on;
    SECTOR_PATCH(SEC_IDX, SEC_TYPE, INFO.EP_LOCAL)
    hold off;
    
    figure
    title([filename, '- LINE'])
    hold on;
    plot(PT_X, PT_Y,'k', 'LineWidth', 2)
    SECTOR_LINE(INFO.SECINFO, INFO.EP_LOCAL)
    hold off;
end