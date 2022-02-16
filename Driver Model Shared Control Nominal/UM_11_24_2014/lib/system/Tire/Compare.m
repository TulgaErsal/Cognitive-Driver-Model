clear all; clc; close all;

load Test_PAC2002_m.mat

figure('units','inches','position',[5 2 10 8])
PlotFM(T, KAPPA, ALPHA, FX, FY, FZ, MX, MY, MZ, 'k')

load Test_PAC2002_simplified.mat
PlotFM(T, KAPPA, ALPHA, FX, FY, FZ, MX, MY, MZ, 'r:')

load Test_PAC2002_dataplugged.mat
PlotFM(T, KAPPA, ALPHA, FX, FY, FZ, MX, MY, MZ, 'b--')

load TEST_PAC2002_cpp.mat
PlotFM(T, KAPPA, ALPHA, FX, FY, FZ, MX, MY, MZ, 'm-.')
