track_data=table2array(cogstaticpathtrtesting2d0thw1);
ms2mph = 2.23694;
VehTime = track_data(:,1);
VehXY = track_data(:,2:3);
VehSpeed = track_data(:,6)*ms2mph ;
%AutoCarTan = track_data(:,12:13);
AutoCar2Tan = track_data(:,23:24);
%AutoCarHeading = acos(track_data(:,12)) ;
AutoCar2Heading = acos(track_data(:,23)) ;
x_car2=track_data(:,21);
y_car2=track_data(:,22);
load('Track_ref_testing2.mat')
ds = sqrt(diff(Ref(:,1)).^2 + diff(Ref(:,2)).^2 );
Scum = [0; cumsum( ds )];

VehXY_S = zeros(length(VehXY),1);
for i = 1:length(VehXY)
    dall = sqrt( (VehXY(i,1)-Ref(:,1)).^2 + (VehXY(i,2)-Ref(:,2)).^2 );
    [Mag,Idx] = min(dall);
    VehXY_S(i) = Scum(Idx);
end

%load('dt_1_16')
% Dfa=table2array(ActionFile(:,1));
% Dt=table2array(ActionFile(:,2));
% fa= cumsum(Dfa);
% t= cumsum(Dt);
% fa_dig=ceil(fa/4*1000)/1000;

 diffTAN = [0;abs(diff(AutoCar2Heading))];
 diffTAN(2) = 0;
 
 %dTAN = [0 0; diff(AutoCarTan)];
 %autocar_curv = sqrt( dTAN(:,1).^2+dTAN(:,2).^2 )./ sqrt( track_data(:,10).^2+track_data(:,11).^2 );
 
%  figure(11)
%  plot(t, v_ref1,'o-')
%  xlabel('Time (s)')
 

vref_k= table2array(vrefandkauto2);
k_java = vref_k(:,3);
vref = vref_k(:,2);

VehXY_auto  = track_data(:,21:22);
VehXY_S_auto = zeros(length(VehXY_auto),1);
for i = 1:length(VehXY_auto)
    dall = sqrt( (VehXY_auto(i,1)-Ref(:,1)).^2 + (VehXY_auto(i,2)-Ref(:,2)).^2 );
    [Mag,Idx] = min(dall);
    VehXY_S_auto(i) = Scum(Idx);
end



 figure(12)
subplot(2,1,1)
Vertices=Ref;
Lines=[1:length(Vertices)-1 ; 2:length(Vertices)]';
k=LineCurvature2D(Vertices,Lines);
  
Vertices=[x_car2 y_car2];
Lines=[1:length(Vertices)-1 ; 2:length(Vertices)]';
kautocar2=LineCurvature2D(Vertices,Lines);
plot(Scum , abs(k),'r--')
   hold on
%  plot(VehXY_S, diffTAN ,'b')
plot(VehXY_S, abs(kautocar2) ,'b')
plot(VehXY_S_auto , k_java(1:length(VehXY_S_auto )) ,'m--')
 xlim([0 1000])
 ylim([-0.005 0.05])
 xlabel('Track length S (m)')
 legend('Track Curvature' ,'Autocar tangent difference')
 hold off
 
 %%
F=2840;%N
mass=2688.7;%kg
v_ref1=ms2mph *sqrt(4*F./(mass*max(abs(kautocar2),0.001)));%mph
% v_ref1_interp = interp1(VehTime,v_ref1,VehTime);
% %  
 
vref_k= table2array(vrefandkauto2);
uniq= unique(vref_k,'rows');
vref = uniq(:,2);

   subplot(2,1,2)
 plot(VehXY_S, VehSpeed ,'k')
 hold on
 plot(VehXY_S,ms2mph* vref(1:length(VehXY_S_auto)),'r--')
%plot(VehXY_S,JAVA_INPUT(:,3)*200)
 hold off
 xlabel('Track length S (m)')
 legend('V_{veh} (m/s)','V_{ref} (m/s)')
 xlim([0 1000])

 figure(25)
 plot(VehXY_S, VehSpeed ,'k')
 hold on
 plot(VehXY_S,ms2mph* vref(1:length(VehXY_S_auto)),'r--')
%plot(VehXY_S,JAVA_INPUT(:,3)*200)
 hold off
 xlabel('Track length S (m)')
 legend('V_{veh} (m/s)','V_{ref} (m/s)')
 xlim([0 1000])
 
%  figure(13)
%  AX =plotyy(VehTime, v_ref1_interp, VehTime, diffTAN);
%  ylim(AX(1),[0,150]);
%   ylim(AX(2),[0 0.05]);
%   xlim([0 60])
%    