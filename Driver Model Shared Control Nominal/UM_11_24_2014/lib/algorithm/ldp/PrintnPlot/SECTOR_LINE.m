function SECTOR_LINE(SECINFO, END_PTS)

NSEC = size(SECINFO, 1);

COLORS = distinguishable_colors(NSEC);

for i = 1:NSEC
    TI  = SECINFO(i, 5);
    
    if TI >= 0
        PLOT_LINE(END_PTS(i, 1:2), END_PTS(i, 3:4), '-', COLORS(i, :), 2);
        PLOT_LINE(END_PTS(i, 5:6), END_PTS(i, 1:2), '-.', COLORS(i, :), 1);
        PLOT_LINE(END_PTS(i, 5:6), END_PTS(i, 3:4), '-.', COLORS(i, :), 1);
    else
       	PLOT_LINE(END_PTS(i, 1:2), END_PTS(i, 3:4), '--', COLORS(i, :), 2);
        PLOT_LINE(END_PTS(i, 5:6), END_PTS(i, 1:2), '-.', COLORS(i, :), 1);
        PLOT_LINE(END_PTS(i, 5:6), END_PTS(i, 3:4), '-.', COLORS(i, :), 1);
    end
end