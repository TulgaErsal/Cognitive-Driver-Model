Time_start = 1261;
Ts = 1;
%Time_total   = (CMD_HUM(1,end)-Time_start)*0.01;



ms2mph          = 2.23694;
AvgSpeed = mean(STATE(Time_start:Ts:end,7))*ms2mph 
Line_ref_CD = [ Ref(1:Ts:end,1) Ref(1:Ts:end,2)];
Line_hum_CD = [ STATE(Time_start:Ts:end,1)-STATE(Time_start,1) STATE(Time_start:Ts:end,2)-STATE(Time_start,2)];

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
[XYcoord,XYdist]  = distance2curve(endline, Line_hum_CD );
Time_end     = find(XYdist(:,1)==min(XYdist(:,1)))-1;
Time_total = Time_end/100

[XY,Error]  = distance2curve(Line_ref_CD, Line_hum_CD(1:Time_end,:) );
Error_norm  = mean(Error)

%% Steering control effort
Control_effort = sum(abs(JAVA_INPUT(Time_start:5:Time_end,3)))