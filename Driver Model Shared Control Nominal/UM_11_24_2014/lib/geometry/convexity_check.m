function CONVEXITY = convexity_check(PT1, PT2, POLY_X, POLY_Y)

[X_SEQ, Y_SEQ]  = line_segment_seq(PT1, PT2, 100);

IN              = inpolygonf(X_SEQ, Y_SEQ, POLY_X, POLY_Y);

% when 95% of the line is within the region
if sum(IN)/length(X_SEQ) >= 0.95 %#THLD#
    CONVEXITY   = true;
else
    CONVEXITY   = false;
end