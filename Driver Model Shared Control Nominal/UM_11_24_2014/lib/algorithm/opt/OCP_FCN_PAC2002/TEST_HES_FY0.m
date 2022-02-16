clear all; clc; close all;

addpath([pwd,'/data'],'-begin');

N = 100000;
FZ = 4000*ones(1, N);
ALPHA = linspace(-pi/2, pi/2, N);

cd ([pwd,'/m'])

tic
[FY0_1, dFY0dZ_1, dFY0dA_1, dFY0dZdZ_1, dFY0dAdZ_1, dFY0dAdA_1] = ...
    HES_PAC2002_FY0(FZ, ALPHA);
toc

cd ../

cd ([pwd,'/cpp'])

tic
[FY0_2, dFY0dZ_2, dFY0dA_2, dFY0dZdZ_2, dFY0dAdZ_2, dFY0dAdA_2] = ...
    HES_PAC2002_FY0(FZ, ALPHA);
toc

cd ../

figure(1)
hold on;
xlabel('\alpha (degree)')
ylabel('F_{y0} (N)')
plot(ALPHA*180/pi, FY0_1, 'k', 'LineWidth', 2)
plot(ALPHA*180/pi, FY0_2, 'r--', 'LineWidth', 2)

figure(2)
hold on;
xlabel('dFY0/dZ')
ylabel('F_{y0} (N)')
plot(ALPHA*180/pi, dFY0dZ_1, 'k', 'LineWidth', 2)
plot(ALPHA*180/pi, dFY0dZ_2, 'r--', 'LineWidth', 2)

figure(3)
hold on;
xlabel('dFY0/dA')
ylabel('F_{y0} (N)')
plot(ALPHA*180/pi, dFY0dA_1, 'k', 'LineWidth', 2)
plot(ALPHA*180/pi, dFY0dA_2, 'r--', 'LineWidth', 2)

figure(4)
hold on;
xlabel('dFY0/dZ/dZ')
ylabel('F_{y0} (N)')
plot(ALPHA*180/pi, dFY0dZdZ_1, 'k', 'LineWidth', 2)
plot(ALPHA*180/pi, dFY0dZdZ_2, 'r--', 'LineWidth', 2)

figure(5)
hold on;
xlabel('dFY0/dA/dZ')
ylabel('F_{y0} (N)')
plot(ALPHA*180/pi, dFY0dAdZ_1, 'k', 'LineWidth', 2)
plot(ALPHA*180/pi, dFY0dAdZ_2, 'r--', 'LineWidth', 2)

figure(6)
hold on;
xlabel('dFY0/dA/dA')
ylabel('F_{y0} (N)')
plot(ALPHA*180/pi, dFY0dAdA_1, 'k', 'LineWidth', 2)
plot(ALPHA*180/pi, dFY0dAdA_2, 'r--', 'LineWidth', 2)