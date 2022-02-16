%% Vehicle DATA: from ADAMS DATA_HMMWV Model

% Coordinate
% x: longitudinal   - forward positive
% y: lateral        - leftward positive (SAE convention: rightward positive)
% z: vertical       - upward positive   (SAE convention: downward positive )

% Angular quantities about the axes:
% phi       - roll      / angular movement about an x-axis
% theta     - pitch     / angular movement about a y-axis
% psi       - yaw       / angular movement about a z-axis

% Wheel labels are: 
% 1 = front left, 2 = front right, 3 = rear left, 4 = rear right

% Unit
% Mass: kg
% Dimensions: m
% Inertia: kg-m^2

%%
g = 9.81;       % kg-m/s^2
DATA_HMMWV_RAW.g = g;

%% TIRE: Left Right Symmetric
TIRE_FRONT_X = 406.4 / 1000;
TIRE_FRONT_Y = 909.701 / 1000;
TIRE_FRONT_Z = 415.417 / 1000;
TIRE_REAR_X = 3708.4 / 1000;
TIRE_REAR_Y = 909.701 / 1000;
TIRE_REAR_Z = 415.4932 / 1000;

%% VEHICLE ENTIRE
% Tools --> Aggregate Mass --> All
VEHICLE_MASS = 2688.7180162729;
% Vehicle CG Location in Global Reference Frame
VEHICLE_X = 1983.8765620004 / 1000;
VEHICLE_Y = -1.1692879296 / 1000;
VEHICLE_Z = 830.8885674719 / 1000;
VEHICLE_LA = (VEHICLE_X - TIRE_FRONT_X);
VEHICLE_LB = (TIRE_REAR_X - VEHICLE_X);
VEHICLE_LC = [ TIRE_FRONT_Y + VEHICLE_Y,...
               TIRE_FRONT_Y - VEHICLE_Y,...
               TIRE_REAR_Y + VEHICLE_Y,...
               TIRE_REAR_Y - VEHICLE_Y ];
VEHICLE_LC = [(VEHICLE_LC(1) + VEHICLE_LC(2))/2,...
              (VEHICLE_LC(1) + VEHICLE_LC(2))/2,...
              (VEHICLE_LC(1) + VEHICLE_LC(2))/2,...
              (VEHICLE_LC(1) + VEHICLE_LC(2))/2];
VEHICLE_HG = VEHICLE_Z;
% Vehicle Inertia Relative to its CG
VEHICLE_IXX = 3412.8817662 - VEHICLE_MASS*(VEHICLE_Y^2 + VEHICLE_Z^2);
VEHICLE_IYY = 17342.024556 - VEHICLE_MASS*(VEHICLE_X^2 + VEHICLE_Z^2);
VEHICLE_IZZ = 16197.898998 - VEHICLE_MASS*(VEHICLE_X^2 + VEHICLE_Y^2);

DATA_HMMWV_RAW.VEHICLE_MASS = VEHICLE_MASS;
DATA_HMMWV_RAW.VEHICLE_LA = VEHICLE_LA;
DATA_HMMWV_RAW.VEHICLE_LB = VEHICLE_LB;
DATA_HMMWV_RAW.VEHICLE_LC = VEHICLE_LC;
DATA_HMMWV_RAW.VEHICLE_HG = VEHICLE_HG;
DATA_HMMWV_RAW.VEHICLE_IXX = VEHICLE_IXX;
DATA_HMMWV_RAW.VEHICLE_IYY = VEHICLE_IYY;
DATA_HMMWV_RAW.VEHICLE_IZZ = VEHICLE_IZZ;

%% CHASSIS
% Tools --> Aggregate Mass --> Chassis
CHASSIS_MASS = 2086.524902;
% Chassis CG Location in Global Reference Frame
CHASSIS_X = 2110.74 / 1000;
CHASSIS_Y = 0.0 / 1000;
CHASSIS_Z = 965.2 / 1000;
CHASSIS_LA = (CHASSIS_X - TIRE_FRONT_X);
CHASSIS_LB = (TIRE_REAR_X - CHASSIS_X);
CHASSIS_LC = [ TIRE_FRONT_Y + CHASSIS_Y,...
               TIRE_FRONT_Y - CHASSIS_Y,...
               TIRE_REAR_Y + CHASSIS_Y,...
               TIRE_REAR_Y - CHASSIS_Y ];
CHASSIS_LC = [(CHASSIS_LC(1) + CHASSIS_LC(2))/2,...
              (CHASSIS_LC(1) + CHASSIS_LC(2))/2,...
              (CHASSIS_LC(1) + CHASSIS_LC(2))/2,...
              (CHASSIS_LC(1) + CHASSIS_LC(2))/2];
% CHASSIS_HG = CHASSIS_Z;
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
CHASSIS_HG = 0.9902452;

% Vehicle Inertia Relative to its CG
CHASSIS_IXX = 3022.3530767 - CHASSIS_MASS*(CHASSIS_Y^2 + CHASSIS_Z^2);
CHASSIS_IYY = 14195.424592 - CHASSIS_MASS*(CHASSIS_X^2 + CHASSIS_Z^2);
CHASSIS_IZZ = 12866.138231 - CHASSIS_MASS*(CHASSIS_X^2 + CHASSIS_Y^2);

DATA_HMMWV_RAW.CHASSIS_MASS = CHASSIS_MASS;
DATA_HMMWV_RAW.CHASSIS_LA = CHASSIS_LA;
DATA_HMMWV_RAW.CHASSIS_LB = CHASSIS_LB;
DATA_HMMWV_RAW.CHASSIS_LC = CHASSIS_LC;
DATA_HMMWV_RAW.CHASSIS_HG = CHASSIS_HG;
DATA_HMMWV_RAW.CHASSIS_IXX = CHASSIS_IXX;
DATA_HMMWV_RAW.CHASSIS_IYY = CHASSIS_IYY;
DATA_HMMWV_RAW.CHASSIS_IZZ = CHASSIS_IZZ;

%% SPRUNG MASS
% See SPRUNG_MASS_PROPERTIES.m
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
[SPRUNGMASS_MASS, SPRUNGMASS_X, SPRUNGMASS_Y, SPRUNGMASS_Z, ...
    SPRUNGMASS_IXX, SPRUNGMASS_IYY, SPRUNGMASS_IZZ] = ...
    PROPERTIES_SPRUNG_MASS();

SPRUNGMASS_LA = (SPRUNGMASS_X - TIRE_FRONT_X);
SPRUNGMASS_LB = (TIRE_REAR_X - SPRUNGMASS_X);
SPRUNGMASS_LC = [ TIRE_FRONT_Y + SPRUNGMASS_Y,...
               TIRE_FRONT_Y - SPRUNGMASS_Y,...
               TIRE_REAR_Y + SPRUNGMASS_Y,...
               TIRE_REAR_Y - SPRUNGMASS_Y ];
SPRUNGMASS_HG = SPRUNGMASS_Z;

DATA_HMMWV_RAW.SPRUNGMASS_MASS = SPRUNGMASS_MASS;
DATA_HMMWV_RAW.SPRUNGMASS_LA = SPRUNGMASS_LA;
DATA_HMMWV_RAW.SPRUNGMASS_LB = SPRUNGMASS_LB;
DATA_HMMWV_RAW.SPRUNGMASS_LC = SPRUNGMASS_LC;
DATA_HMMWV_RAW.SPRUNGMASS_HG = SPRUNGMASS_HG;
DATA_HMMWV_RAW.SPRUNGMASS_IXX = SPRUNGMASS_IXX;
DATA_HMMWV_RAW.SPRUNGMASS_IYY = SPRUNGMASS_IYY;
DATA_HMMWV_RAW.SPRUNGMASS_IZZ = SPRUNGMASS_IZZ;

%% 
% Tire Stiffness
Tire_Stiffness = 784944;        % N-m
KT = Tire_Stiffness*[1,1,1,1];
% suspension spring stifness
front_susp_spring_rate = 167071;    % N/m
rear_susp_spring_rate = 302619;     % N/m
susp_to_center_dist = 528.710906;   % mm
wheel_to_center_dist = 909.701;     % mm
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
KS = (susp_to_center_dist/wheel_to_center_dist)^2*...
    [front_susp_spring_rate,front_susp_spring_rate,...
        rear_susp_spring_rate,rear_susp_spring_rate];
% suspension damper: nonlinear relationship
relative_speed = [-13.352,-6.676,-2.356,0,2.356,6.675,13.352];     
CS.relative_speed = relative_speed*2.54/100;               % m/s
front_damping_force = [-955,-650,-160,0,263,990,1715]; 
CS.front_damping_force = front_damping_force*4.44822162;	% N
rear_damping_force = [-980,-706,-250,0,371,1340,2740];
CS.rear_damping_force = rear_damping_force*4.44822162;  	% N

relative_speed_MAX = 13.352*2.54/100;
relative_speed_ES = linspace(-relative_speed_MAX, relative_speed_MAX, 10);
front_damping_force_ES = interp1(CS.relative_speed, CS.front_damping_force, relative_speed_ES);
rear_damping_force_ES = interp1(CS.relative_speed, CS.rear_damping_force, relative_speed_ES);

CS.relative_speed_MAX = relative_speed_MAX;
CS.relative_speed_ES = relative_speed_ES;
CS.front_damping_force_ES = front_damping_force_ES;
CS.rear_damping_force_ES = rear_damping_force_ES;

DATA_HMMWV_RAW.KT = KT;
DATA_HMMWV_RAW.KS = KS;
DATA_HMMWV_RAW.CS = CS;

%% TIRE/WHEEL
% tire mass
tire_mass = 68.0388555;       
MT = tire_mass;
% nominal tire radius
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
r_nominal = 0.548;
RW = r_nominal*[1,1,1,1];
% tire/wheel roll inertia
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
wheel_inertia = 40;             % kg-m^2
IW = wheel_inertia*[1,1,1,1];
DATA_HMMWV_RAW.MT = MT;
DATA_HMMWV_RAW.RW = RW;
DATA_HMMWV_RAW.IW = IW;

%% UNSPRUNGMASS
[UNSPRUNGMASS_MASS, UNSPRUNGMASS_X, UNSPRUNGMASS_Y, UNSPRUNGMASS_Z, ...
    UNSPRUNGMASS_IXX, UNSPRUNGMASS_IYY, UNSPRUNGMASS_IZZ] = ...
    PROPERTIES_UNSPRUNG_MASS();

DATA_HMMWV_RAW.UNSPRUNGMASS_MASS = UNSPRUNGMASS_MASS;
DATA_HMMWV_RAW.UNSPRUNGMASS_IYY = UNSPRUNGMASS_IYY;

%% 
MAXPOWER=2.25e5;                % watts
DATA_HMMWV_RAW.MAXPOWER = MAXPOWER;

%% 
% initial height of four strut mounting points
% ASSUMPTION: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ZS_INIT = CHASSIS_HG*ones(1,4);
%
MS = SPRUNGMASS_MASS;
MU = UNSPRUNGMASS_MASS;
LENGTH = VEHICLE_LA + VEHICLE_LB;
MSI(1) = MS*VEHICLE_LB/2/LENGTH;
MSI(2) = MS*VEHICLE_LB/2/LENGTH;
MSI(3) = MS*VEHICLE_LA/2/LENGTH;
MSI(4) = MS*VEHICLE_LA/2/LENGTH;
% initial compression of four strut mounting points
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
XS_INIT = - MSI*g./KS; 
% initial compression of tires
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% XT_INIT = -(MSI+MU)*g./KT;
MV = VEHICLE_MASS;
LENGTH = VEHICLE_LA + VEHICLE_LB;
MVI(1) = MV*VEHICLE_LB/2/LENGTH;
MVI(2) = MV*VEHICLE_LB/2/LENGTH;
MVI(3) = MV*VEHICLE_LA/2/LENGTH;
MVI(4) = MV*VEHICLE_LA/2/LENGTH;
XT_INIT = -(MVI)*g./KT;
% initial compressed tire radius
ZT_INIT = RW + XT_INIT;

DATA_HMMWV_RAW.XS_INIT = XS_INIT;
DATA_HMMWV_RAW.ZS_INIT = ZS_INIT;
DATA_HMMWV_RAW.XT_INIT = XT_INIT;
DATA_HMMWV_RAW.ZT_INIT = ZT_INIT;

save DATA_HMMWV_RAW DATA_HMMWV_RAW

clear all