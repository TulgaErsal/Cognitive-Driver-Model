function dist = point_lineseg_dist(p, p1, p2)

p   = p';
p1  = p1';
p2  = p2';

% The nearest point will satisfy the condition
% PN = (1-T) * P1 + T * P2.
% T will always be between 0 and 1.

if p1(1) == p2(1) && p1(2) == p2(2)
    t = 0.0;
else
    l = sum((p2 - p1).^2);
    t = (p - p1)' * (p2 - p1)/l;
    t = max (t, 0.0);
    t = min (t, 1.0);
end

pn = p1 + t * (p2 - p1);
dist = sqrt(sum((pn - p).^2));
