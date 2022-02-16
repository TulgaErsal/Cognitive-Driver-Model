function EP_POLAR = EP_POLAR_CORRECT(EP_POLAR)

% the angle is expected to be within the range of [0, pi]

% however, because -pi <= atan2(Y,X) <= pi, 

% when the number is negative and is close to -pi, set the number to pi

THLD                = - pi + pi/180; %#THLD#

IDX1                = EP_POLAR(:,1) <= THLD;
EP_POLAR(IDX1,1)    = pi;

IDX2                = EP_POLAR(:,2) <= THLD;
EP_POLAR(IDX2,2)    = pi;

for i = 1:length(EP_POLAR(:, 1))
    if EP_POLAR(i, 1) < 0 && abs(EP_POLAR(i, 1)) < 0.1*pi/180 %#THLD#
        EP_POLAR(i, 1)  = 0;
    end
end

if length(EP_POLAR(:, 1)) > 2
    for i = 2:length(EP_POLAR(:, 1)) - 1
        if EP_POLAR(i, 1) < 0
            EP_POLAR(i, 1) = pi + EP_POLAR(i, 1);
        end
        if EP_POLAR(i, 2) < 0
            EP_POLAR(i, 2) = pi + EP_POLAR(i, 2);
        end
    end
end