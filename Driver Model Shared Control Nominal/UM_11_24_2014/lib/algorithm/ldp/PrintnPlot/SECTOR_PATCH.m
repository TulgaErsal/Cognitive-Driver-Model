function SECTOR_PATCH(SEC_IDX, SEC_TYPE, END_PTS)

NSEC    = length(SEC_IDX);

COLORS  = distinguishable_colors(NSEC);

for i = 1:NSEC
    SI  = SEC_IDX(i);
    TI  = SEC_TYPE(i);
    
    if TI >= 0
        patch([END_PTS(SI, 1), END_PTS(SI, 3), END_PTS(SI, 5)], ...
              [END_PTS(SI, 2), END_PTS(SI, 4), END_PTS(SI, 6)], ...
              COLORS(i, :), 'FaceAlpha',1.0)
    elseif TI < 0
        R1 = norm(END_PTS(SI, 1:2) - END_PTS(SI, 5:6));
        R2 = norm(END_PTS(SI, 3:4) - END_PTS(SI, 5:6));
        A1 = atan2((END_PTS(SI, 2) - END_PTS(SI, 6)), (END_PTS(SI, 1) - END_PTS(SI, 5)));
      	A2 = atan2((END_PTS(SI, 4) - END_PTS(SI, 6)), (END_PTS(SI, 3) - END_PTS(SI, 5)));
        
        if A2 <= -pi + pi/180
            A2 = pi;
        end
        
        R  = min(R1, R2);
        A_SEQ = linspace(A1, A2,100);
        patch([END_PTS(SI, 5) + R*cos(A_SEQ), END_PTS(SI, 5)], ...
              [END_PTS(SI, 6) + R*sin(A_SEQ), END_PTS(SI, 6)], ...
              COLORS(i, :), 'FaceAlpha',1.0);
    end
end