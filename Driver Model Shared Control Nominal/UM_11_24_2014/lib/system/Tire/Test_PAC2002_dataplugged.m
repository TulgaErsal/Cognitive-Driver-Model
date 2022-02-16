clear all; clc; close all; 

restoredefaultpath;

addpath([pwd,'/PAC2002/m/dataplugged'],'-begin');

which PAC2002_biased

SampleInput;

tic
[FX,FY,MX,MY,MZ] = PAC2002_biased(FZ, KAPPA, ALPHA, 'COMBSLIP');
toc

figure('units','inches','position',[5 2 10 8])
PlotFM(T, KAPPA, ALPHA, FX, FY, FZ, MX, MY, MZ, 'k');

save(mfilename)