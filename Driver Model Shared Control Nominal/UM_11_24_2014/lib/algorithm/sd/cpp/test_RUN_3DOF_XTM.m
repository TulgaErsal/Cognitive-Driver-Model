clear all; clc; close all;

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

tic
XTM = RUN_3DOF_XTM(PARA, VCS);
toc

figure
hold on;
plot(XTM.L.ST(:, 1), XTM.L.ST(:, 2), 'r', 'LineWidth', 2)
plot(XTM.R.ST(:, 1), XTM.R.ST(:, 2), 'k', 'LineWidth', 2)
axis equal
hold off;