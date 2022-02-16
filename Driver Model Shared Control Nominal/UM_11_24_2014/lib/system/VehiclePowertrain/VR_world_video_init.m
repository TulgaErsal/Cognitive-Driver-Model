clear all
clc
close all

ms2mph  = 2.23694;
% myworld = vrworld('Track_Sign_environ_317.wrl');
myworld = vrworld('Environ_testing2_VIDEO.wrl');
open(myworld);
f = vrfigure(myworld);
set(f, 'Name', 'Virtual Driving interface');
set(f, 'NavPanel', 'none');
set(f, 'Position', [10 200 1215 750]);

load ModelHumanComp/testdata.mat
load ModelHumanComp/testrunMatlab0327_varydis.mat

load Track_ref_testing2.mat
% Start time
Ts = 1;
Line_ref_CD = [ Ref(1:Ts:end,1) Ref(1:Ts:end,2)];
p_s = [0 0];
startline = zeros(2001,2);
for a = 1:2201
    el = -11+(a-1)*0.01;
    startline(a,:) = [p_s(1,1)+el p_s(1,2)+0*el];
end
[XYcoord,XYdist]  = distance2curve(startline, [RESP_VEH(3,:)', RESP_VEH(4,:)'] );
Time_start     = max(1, find(XYdist(:,1)==min(XYdist(:,1)))-1 );

% End time
p_f_l2 = Line_ref_CD(end-5,:);
p_f = Line_ref_CD(end,:);
slope = (p_f(2)-p_f_l2(2))/(p_f(1)-p_f_l2(1));
tan_slope = atan(slope)+pi/2;
endline = zeros(2001,2);
for a = 1:2201
    el = -11+(a-1)*0.01;
    endline(a,:) = [p_f(1,1)+el p_f(1,2)+tan(tan_slope)*el];
end
[XYcoord,XYdist]  = distance2curve(endline, [RESP_VEH(3,:)', RESP_VEH(4,:)'] );
Time_end     = find(XYdist(:,1)==min(XYdist(:,1)))-1;

HumanTraj = RESP_VEH(3:5,Time_start:Time_end);
ModelTraj = [STATE(1261:end,1:2) STATE(1261:end,6)]';
ModelTraj = ModelTraj -[ModelTraj(1:2,1);pi/2-ModelTraj(3,1)]*ones(1,length(ModelTraj));
Humantl = length(HumanTraj);
Modeltl = length(ModelTraj);
T_total = max(Humantl,Modeltl);
Timetl = 0:0.01:(T_total-1)*0.01;
T_total = T_total/100;
if Humantl <Modeltl
    HumanTraj = [HumanTraj HumanTraj(:,end)*ones(1,Modeltl-Humantl)];
else
    ModelTraj = [ModelTraj ModelTraj(:,end)*ones(1,Humantl-Modeltl)];
end

