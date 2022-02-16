% time
% simcarPos
% simcarPos.z
% simcarHeading.x
% simcarHeading.z
% simcarSpeed
% steerAngle
% accelerator
% brake
% autocarPos.x
% autocarPos.z
% autocarHeading.x
% autocarHeading.z
% autocarSpeed
% nearPoint.x
% nearPoint.z
% farPoint.x
% farPoint.z
% carPoint.x
% carPoint.z
% autocar2Pos.x
% autocar2Pos.z
% autocar2Heading.x
% autocar2Heading.z
%hold off
% load('Track_ref_training_Yue_short.mat');
%  load ('Track_ref_testing2.mat')
load('Track_chen_082818.mat')
track_data=table2array(cogstaticpathtrtesting2d0thw1);
x_near=track_data(:,15);
y_near=track_data(:,16);

x_far=track_data(:,17);
y_far=track_data(:,18);

x_car=track_data(:,19);
y_car=track_data(:,20);

x_car2=track_data(:,21);
y_car2=track_data(:,22);

x_sim=track_data(:,2);
y_sim=track_data(:,3);

x_auto=track_data(:,10);
y_auto=track_data(:,11);


x_simcarhead=track_data(:,4);
y_simcarhead=track_data(:,5);


x_autocarhead=track_data(:,12);
y_autocarhead=track_data(:,13);

x_auto2carhead=track_data(:,23);
y_auto2carhead=track_data(:,24);
figure(1)
plot(Ref(:,1),Ref(:,2),'o-','color',[0,0,0]+0.5, 'MarkerSize', 5)
hold on
for i=1:length(track_data)
p3=plot(x_car2(i),y_car2(i),'x-g','MarkerSize',1);
p4=plot(x_sim(i),y_sim(i),'r^-','MarkerSize',1);
p5=plot(x_auto(i),y_auto(i),'s-b','MarkerSize',1);
%legend([p1 p4],'nearpoint','simcarpos');
% legend([p2 p5],'farpoint','autocarpos');
% legend([p3 p5],'carpoint','autocarpos');

%  pause(0.01);

end
% plot(Ref(:,1),Ref(:,2),'go-', 'MarkerSize', 2)
xlabel('X(m)');ylabel('Y(m)');
legend('Path','Simcar1','Autocar','Simcar2')
hold off
axis equal


figure(2)
hold on
for i=1:length(track_data)
p1=plot(x_near(i),y_near(i),'*-k');
p2=plot(x_far(i),y_far(i),'o-b');
end
xlabel('X(m)');ylabel('Y(m)');
hold off
axis equal

vref_k= table2array(vrefkauto2num74);
uniq= unique(vref_k,'rows');
vref = uniq(:,2);
v_simjava=uniq(:,4); 
figure(3)
hold on
plot(TIME-TIME_PASS,STATE(:,7),'m.-') %MATLAB OUTPUT
% plot(track_data(2:end,1),vref,'rx-','MarkerSize',8)
plot(track_data(:,1),vref(1:length(track_data(:,1))),'rx-','MarkerSize',8)
plot(track_data(:,1),track_data(:,6),'k*-','MarkerSize',8)
% plot(track_data(2:end,1),v_simjava,'ro-','MarkerSize',8)
plot(track_data(:,1),track_data(:,14),'bs-','MarkerSize',8)
%plot(track_data(2:end,1),vref(2:length(track_data)+1),'rx-','MarkerSize',8)

ax = diff(track_data(:,6))./diff(track_data(:,1));
figure(31)
plot(ax);

xlabel('T(s)');ylabel('Speed(m/s)');
legend('Plant','vref','Autocar','Simcar')
title('Speed')
hold off

% nearpoint=[x_near, y_near];
% farpoint=[x_far, y_far];
% simcar=[x_sim, y_sim];
% autocar=[x_auto, y_auto];
% dis_near2sim=norm(nearpoint-simcar);
% dis_far2sim=norm(farpoint-simcar);
% dis_auto2sim=norm(autocar-simcar,'row');
% dis_far2auto=norm(farpoint-autocar);
dis_auto2sim =hypot(x_auto-x_sim,y_auto-y_sim);

figure(4)
subplot(4,1,1)
plot(TIME-TIME_PASS,JAVA_INPUT(:,1))
xlabel('T(s)');ylabel('TH');title('JAVA INPUTS')
ylim([-0.1,1.1])
subplot(4,1,2)
plot(TIME-TIME_PASS,JAVA_INPUT(:,2))
xlabel('T(s)');ylabel('BR');
ylim([-0.1,1.1])
subplot(4,1,3)
plot(TIME-TIME_PASS,JAVA_INPUT(:,3))
xlabel('T(s)');ylabel('ST');
subplot(4,1,4)
plot(TIME-TIME_PASS,STATE(:,7))
xlabel('T(s)');ylabel('VEH SPEED');
ylim([0,40])

figure(5)
plot(TIME-TIME_PASS,TIRELIFTOFF(:,1))
xlabel('T(s)');ylabel('TH');title('TIRE LIFTOFF')
