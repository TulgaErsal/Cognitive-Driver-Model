close all; clear all;
runID=1;
folder = 'cog__static_path';

% load the desired path
load('Track_ref_testing2.mat')

%load the Cognitive results
cd(strcat('hypothesis_results','/',folder,'_tr_testing2_d0_thw3_kf7.85_kn3.5_ki_1.35_new4_data'))
load(strcat('all_data',num2str(runID),'.mat'))
cd ..
cd ..

%%
% %Load the human Driver results in case of having human data
% folder2='HM3-0.6-4'; % name of the Human Driver Foler
% folder3='Delayed'; % Delayed or Ideal
% cd(strcat('Driver_data_training','/',folder2,'/',folder3,'/','T1'))
% load(strcat('RESP_VEH.mat'))
% cd ..
% cd ..
% cd ..
% cd ..
% RESULT.X = RESP_VEH(3,:)';
% RESULT.Y = RESP_VEH(4,:)';
%%

% Compute the lane keeping error
XY_cog=[RESULT.X RESULT.Y];
[xy_w,dis_w,t_a_w] = distance2curve(Ref,XY_cog,'linear');
pfm_w = mean(dis_w)