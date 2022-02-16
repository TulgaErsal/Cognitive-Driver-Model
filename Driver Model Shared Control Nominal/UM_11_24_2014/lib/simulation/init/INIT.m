%%
LIDAR(INPUT.VP_INIT, INPUT.HA_INIT, INPUT.LASER_RANGE, 0.1*pi/180, INPUT.MAP);
disp('LIDAR')

%%
N          = 200;
dtheta     = pi/150;
theta      = (-pi:dtheta:(pi-dtheta));
node       = [cos(theta) ; sin(theta)];
X          = 3*(rand(2 , N)-0.5);

inpolygonf(X(1, :), X(2, :), node(1, :), node(2, :));
disp('inpoly')

clear N dtheta theta node X

%%
TIME = linspace(0, 10, 50);
VALUE = sin(2*pi*TIME/5);
T1 = linspace(0, 10, 10);
T2 = (T1-TIME(1))*(length(TIME)-1)/(TIME(end)-TIME(1)) + 1;
V2 = ScaleTime(VALUE, T2);
disp('ScaleTime')

clear TIME VALUE T1 T2 V2

%%
PARA.SR_SYS_MAX = 10*pi/180;
PARA.SR_SYS_MIN = - 10*pi/180;

load DATA_HMMWV_MODEL.mat
PARA.DATA_HMMWV_MODEL  = DATA_HMMWV_MODEL;

load LUT_MAXSA_500.mat
PARA.LUT = LUT;

VCS.V0  = 0;
VCS.R0  = 0;
VCS.SA0 = 0;
VCS.U0  = 20;
VCS.PLANNING_DIST = 100;

RUN_3DOF_XTM(PARA, VCS);
disp('VEHICLE_3DoF_FZ_NLT')

clear PARA DATA_HMMWV_MODEL LUT VCS

%%
n=50;% number of random polygon vertices
scale=2^15;% scale factor from double to int64 (arbitrary)

p1=rand(n,2);% make random polygon (self-intersecting)
% recast into int64 in order to input to clipper
poly1.x=int64(p1(:,1)*scale);
poly1.y=int64(p1(:,2)*scale);

p2=rand(n,2);% make random polygon (self-intersecting)
% recast into int64 in order to input to clipper
poly2.x=int64(p2(:,1)*scale);
poly2.y=int64(p2(:,2)*scale);

out = clipper(poly1,poly2,1); % perform intersection
disp('clipper')

clear n scale p1 poly1 p2 poly2 out

%%
ConvexPartition([rootpath, '/lib/simulation/init/test_CVX_data'])
disp('ConvexPartition')

%%
% time [s]
T = linspace(1, 10, 1000);
% normal load [N]
FZ = 5000*ones(size(T));
% longitudinal slip [-]
KAPPA = 0.5*sin(pi*T/2);
% slip angle [rad]
ALPHA = pi/2*cos(pi*T/2);
% inclination angle [rad]
GAMMA = zeros(size(T));
% longitudinal speed [m/s]
VX = 20*ones(size(T));

[~,~,~,~,~] = PAC2002(FZ, KAPPA, ALPHA, GAMMA, VX);
disp('PAC2002')

[~,~,~,~,~] = PAC2002_biased(FZ, KAPPA, ALPHA, GAMMA, VX);
disp('PAC2002_biased')

FY0 = PAC2002_ST(FZ, ALPHA);
disp('PAC2002_ST')

[~, ~] = PAC2002_TT(FZ, KAPPA, ALPHA);
disp('PAC2002_TT')

clear T FZ KAPPA ALPHA GAMMA VX FY0

%%
load test_ipopt_data.mat

test_ipopt(PARA, VCS)
disp('ipopt')

clear PARA VCS
%%
VI = test_vehicle_data();

VO = SIM_14DoF(VI); %#ok<*NASGU>

disp('VEHICLE_14DOF')

clear VI VO ans

clc;