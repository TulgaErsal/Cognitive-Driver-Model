function PTS = VEHICLE_SHAPE(X, Y, A)

VW = 2.6;
% VL = 4.5;
VA = 2.15;
VB = 2.35;

PTS = [[-VW/2, VW/2, VW/2, -VW/2, -VW/2]', [VA, VA, -VB, -VB, VA]'];

RA = A - pi/2;
RM = [ cos(RA), sin(RA); -sin(RA), cos(RA) ];

PTS = PTS*RM;

PTS(:, 1) = PTS(:, 1) + X;
PTS(:, 2) = PTS(:, 2) + Y;



