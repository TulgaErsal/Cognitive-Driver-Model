clear all; clc; close all;

load DATA_HMMWV_PLANT.mat

DATA_HMMWV_MODEL.M          = DATA_HMMWV.VEHICLEMASS;
DATA_HMMWV_MODEL.IZZ        = DATA_HMMWV.IZZ;
DATA_HMMWV_MODEL.LA         = DATA_HMMWV.LA;
DATA_HMMWV_MODEL.LB         = DATA_HMMWV.LB;
DATA_HMMWV_MODEL.LC         = DATA_HMMWV.LC;

% Nominal track loads
TRACK_LENGTH                = DATA_HMMWV.LA + DATA_HMMWV.LB;
FZF0                        = DATA_HMMWV.MS*DATA_HMMWV.g*DATA_HMMWV.LB / TRACK_LENGTH + 2*DATA_HMMWV.MU*DATA_HMMWV.g;
FZR0                        = DATA_HMMWV.MS*DATA_HMMWV.g*DATA_HMMWV.LA / TRACK_LENGTH + 2*DATA_HMMWV.MU*DATA_HMMWV.g;

% Longitudinal load transfer coefficient
dFZX_Coeff                  = DATA_HMMWV.VEHICLEMASS*DATA_HMMWV.HG / TRACK_LENGTH;
% Lateral load transfer coefficient from step steer test
% dFZYF_Coeff                 = 633.7;
% dFZYR_Coeff                 = 850.3;
dFZYF_Coeff                 = 674.9000;
dFZYR_Coeff                 = 1076;

DATA_HMMWV_MODEL.FZF0       = FZF0;
DATA_HMMWV_MODEL.FZR0      	= FZR0;
DATA_HMMWV_MODEL.dFZX_Coeff	= dFZX_Coeff;
DATA_HMMWV_MODEL.dFZYF_Coeff= dFZYF_Coeff;
DATA_HMMWV_MODEL.dFZYR_Coeff= dFZYR_Coeff;

% single tire conering stiffness
% KY0                       = PKY1.*(FZ0.*LFZO).*sin(2.*atan(FZ./(PKY2.*FZ0.*LFZO))).*LKY;
KF0                         = -10.289.*35000.*sin(2.*atan(FZF0/2./(3.3343.*35000)));
KR0                         = -10.289.*35000.*sin(2.*atan(FZR0/2./(3.3343.*35000)));

% tire cornering stiffness versus tire vertical load
FZ_SEQ                      = 100:1:30000;                              % N
K_SEQ                       = -10.289.*35000.*sin(2.*atan(FZ_SEQ./(3.3343.*35000)));
P                           = polyfit(FZ_SEQ,K_SEQ,1);
K_SEQ_FIT                   = P(1)*FZ_SEQ+P(2);

DATA_HMMWV_MODEL.KF0       	= KF0*2;
DATA_HMMWV_MODEL.KR0        = KR0*2;
DATA_HMMWV_MODEL.K_SLOPE   	= P(1);
DATA_HMMWV_MODEL.K_INTERCEPT= P(2);

DATA_HMMWV_MODEL.RW         = DATA_HMMWV.RW(1);
DATA_HMMWV_MODEL.IW         = DATA_HMMWV.IW(1);
DATA_HMMWV_MODEL.Tau_LT    	= 0.01;

save DATA_HMMWV_MODEL DATA_HMMWV_MODEL