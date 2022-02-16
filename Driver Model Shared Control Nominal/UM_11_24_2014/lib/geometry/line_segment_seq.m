function [X_SEQ, Y_SEQ] = line_segment_seq(PT1, PT2, L)

X1          = PT1(1);
Y1          = PT1(2);

X2          = PT2(1);
Y2          = PT2(2);

if abs(X1-X2) >= abs(Y1 - Y2)
    X_SEQ   = linspace(X1, X2, L);
    Y_SEQ   = interp1f([X1, X2], [Y1, Y2], X_SEQ, 'linear');
else
    Y_SEQ   = linspace(Y1, Y2, L);
    X_SEQ   = interp1f([Y1, Y2], [X1, X2], Y_SEQ, 'linear');
end

