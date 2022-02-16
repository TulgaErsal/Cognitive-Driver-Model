% Parameters

M_unsprung = 220; % Unsprung Mass
M_sprung = 4672; % Sprung Mass
M_unsprung_front = 220; % Unsprung Front Mass
n_tire = 4; % Number of tires
J_wheel = 32; % Wheel Inertia
R_wheel = 0.4412; % Wheel Radius
P = 36; % Tire Pressure
g = -9.8; % Acceleration due to gravity
b = 170; % Viscous Damping Coefficient
T2_r = 4;
N2=0;
N3=0.01;
L3=10;
S_o=3;

%diff_w_ratio = 5.9136; % Final Drive
diff_w_ratio = 3.56; % Final Drive
%diff_efficiency = 0.96; % Torque Efficiency
diff_efficiency = 0.94; % Torque Efficiency

M_vehicle = M_unsprung+M_sprung+M_unsprung_front ; % Vehicle Mass
F_z=M_vehicle*g; % Total Vehicle Normal Force

