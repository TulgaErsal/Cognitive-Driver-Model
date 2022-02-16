function LIMG = LIDAR_DP_MARGIN(IPT, LIDL)

filename = mfilename;
filename = strrep(filename, '_', ' ');

DIST_THLD           = IPT.MINDIST_THLD;

PTS                 = LIDL.PTS;

% varying safety margin
% min(LIDL.RANGE) == DIST_THLD --> 1   *DIST_THLD
% min(LIDL.RANGE) == LIDL.LR   --> MULT*DIST_THLD
MULT                = 2; %#THLD#
SAFETY_MARGIN     	= ((min(LIDL.RANGE) - DIST_THLD)/(LIDL.LR - DIST_THLD)*(MULT - 1) + 1)*DIST_THLD;

% shift openings out by SAFETY_MARGIN
if ~isempty(LIDL.OPSI)
    for i = 1:length(LIDL.OPSI)
        SEQ         = LIDL.OPSI(i):1:LIDL.OPEI(i);
        R           = LIDL.RANGE(SEQ) + SAFETY_MARGIN;
        A           = LIDL.ANGLE(SEQ) + LIDL.SHA;
        PTS(SEQ,1)  = LIDL.SVP(1) + R.*cos(A);
        PTS(SEQ,2)  = LIDL.SVP(2) + R.*sin(A);
    end
end

% shift the line passing through the vehicle 
% along the reverse direction of vehicle heading by SAFETY_MARGIN
XS                  = PTS(1,1)   + SAFETY_MARGIN*cos(LIDL.HA + pi);
YS                  = PTS(1,2)   + SAFETY_MARGIN*sin(LIDL.HA + pi);

XE                  = PTS(end,1) + SAFETY_MARGIN*cos(LIDL.HA + pi);
YE                  = PTS(end,2) + SAFETY_MARGIN*sin(LIDL.HA + pi);

% points defining the polygon to be shrank
poly_x              = [XS; PTS(:,1); XE];
poly_y              = [YS; PTS(:,2); YE];

% figure
if DEBUG == 1
    figure
    hold on;
    axis equal
    title(filename)
    plot(LIDL.VP(1), LIDL.VP(2), 'k.', 'MarkerSize', 5) % vechile position
    plot([LIDL.PTS(:,1); LIDL.PTS(1,1)], ...
         [LIDL.PTS(:,2); LIDL.PTS(1,2)], 'r','LineWidth',2) % LIDAR data
    plot(PTS(:,1), PTS(:,2), 'k','LineWidth',2) % shifted LIDAR data
    plot([poly_x; XS], [poly_y; YS], 'b') % shifted LIDAR data with start and end points
    hold off;
end

% shrink using clipper()
try
    scale        	= 2^15;% scale factor from double to int64 (arbitrary)
    poly.x        	= int64(poly_x*scale);
    poly.y         	= int64(poly_y*scale);
    offset         	= clipper(poly, - SAFETY_MARGIN*scale, 1);
    N             	= length(offset);
    L             	= zeros(1, N);
    for i = 1:N
        L(i)      	= length(offset(i).x);
    end
    [~, IDX]    	= max(L);
    poly_x        	= ([offset(IDX).x; offset(IDX).x(1)])/scale;
    poly_y        	= ([offset(IDX).y; offset(IDX).y(1)])/scale;
catch
    error([filename, '- clipper'])
end

if DEBUG == 1
    hold on;
    patch(poly_x, poly_y, 'm') % shrank region
    hold off;
end

% outputs
LIMG.LR             = LIDL.LR;
LIMG.AR             = LIDL.AR;
LIMG.VP             = LIDL.VP;
LIMG.HA             = LIDL.HA;

LIMG.DPTS           = LIDL.PTS;
LIMG.PTS            = [poly_x, poly_y];

RANGE               = sqrt((LIMG.PTS(:,1) - LIDL.SVP(1)).^2 + ...
                           (LIMG.PTS(:,2) - LIDL.SVP(2)).^2);

RANGE_THLD          = LIDL.LR - 2; %#THLD#

[LIMG.OBSI, LIMG.OBEI, LIMG.OPSI, LIMG.OPEI] ...
                    = LIDAR_Group(RANGE', RANGE_THLD);