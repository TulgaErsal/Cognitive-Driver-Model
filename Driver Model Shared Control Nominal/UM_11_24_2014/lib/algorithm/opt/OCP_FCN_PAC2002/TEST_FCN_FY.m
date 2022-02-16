clear all; clc; close all;

addpath([pwd,'/data'],'-begin');

N = 10000;
FZ = 4000*ones(1, N);
KAPPA = 0.2*ones(1, N);
ALPHA = linspace(-pi/2, pi/2, N);

cd ([pwd,'/m'])

tic
FY_1 = FCN_PAC2002_FY(FZ, KAPPA, ALPHA);
toc

cd ../

cd ([pwd,'/cpp'])

tic
FY_2 = FCN_PAC2002_FY(FZ, KAPPA, ALPHA);
toc

cd ../

figure(1)
hold on;
xlabel('\alpha (degree)')
ylabel('F_{y0} (N)')
plot(ALPHA*180/pi, FY_1, 'k', 'LineWidth', 2)
plot(ALPHA*180/pi, FY_2, 'r--', 'LineWidth', 2)