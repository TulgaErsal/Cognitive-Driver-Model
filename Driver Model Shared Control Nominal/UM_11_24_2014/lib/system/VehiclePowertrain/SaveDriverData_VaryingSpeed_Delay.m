TrialNum = TrialNum+1;

load Track_ref_testing2.mat
if (exist(fullfile(cd, 'CMD_HUM.mat'), 'file') >0)
    load CMD_HUM.mat
    load RESP_VEH.mat
end

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
Time_total   = CMD_HUM(1,Time_end)-CMD_HUM(1,Time_start);
           
%% Lane keeping error
Line_hum_CD = [ RESP_VEH(3,Time_start:Ts:Time_end)' RESP_VEH(4,Time_start:Ts:Time_end)'];
[XY,Error]  = distance2curve(Line_ref_CD, [Line_hum_CD(:,1), Line_hum_CD(:,2)] );
Error_norm  = mean(Error);

%% Steering control effort
Control_effort = sum(abs(CMD_HUM(4,Time_start:5:Time_end)));

% Average speed
AvgSpeed = mean(RESP_VEH(2,Time_start:Ts:Time_end))*ms2mph;

%% Save metrics
fprintf('Track Completion time: %.1f s, AvgSpeed: %.2f mph, Lane keeping error: %.2f m, Steering control effort: %.2f \n',Time_total, AvgSpeed,Error_norm,Control_effort);
PerfMetrics = [Time_total ; AvgSpeed;Error_norm; Control_effort];
save testdata.mat CMD_HUM RESP_VEH CMD_COMPARE RESP_COMPARE NumTireLiftOff DELAY SCENARIO PerfMetrics

TRIAL_DIR = strcat('./Driver_data/','/T',num2str(TrialNum));
mkdir(TRIAL_DIR);

movefile('testdata.mat',TRIAL_DIR)
fprintf('Data_saved\n');
close all
figure(10)
hold on
plot(Ref(:,1),Ref(:,2),'k');
plot(RESP_VEH(3,:),RESP_VEH(4,:),'r--');
plot(startline(:,1),startline(:,2),'b');
plot(endline(:,1),endline(:,2),'b');
hold off
