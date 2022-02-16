load('new1_point.mat');
x1=cogstaticpathtrtesting1d0thw1new1_point(:,1);
y1=cogstaticpathtrtesting1d0thw1new1_point(:,2);
x1=table2array(x1);
y1=table2array(y1);
%figure(1);
for i=1:951
plot(x1(i),y1(i),'*-k');
hold on;
end
x2=cogstaticpathtrtesting1d0thw1new1_point(:,3);
y2=cogstaticpathtrtesting1d0thw1new1_point(:,4);
x2=table2array(x2);
y2=table2array(y2);
%figure(2);
for i=1:951
plot(x2(i),y2(i),'o-r');
hold on;
end
x3=cogstaticpathtrtesting1d0thw1new1_point(:,5);
y3=cogstaticpathtrtesting1d0thw1new1_point(:,6);
x3=table2array(x3);
y3=table2array(y3);
%figure(3);
for i=1:951
plot(x3(i),y3(i),'x-b');
hold on;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('new2.mat');
x1=cogstaticpathtrtesting2d0thw2kf1646new2(:,15);
y1=cogstaticpathtrtesting2d0thw2kf1646new2(:,16);
x1=table2array(x1);
y1=table2array(y1);
figure(1);
for i=1:941
plot(x1(i),y1(i),'*-k');
hold on;
end
x2=cogstaticpathtrtesting2d0thw2kf1646new2(:,17);
y2=cogstaticpathtrtesting2d0thw2kf1646new2(:,18);
x2=table2array(x2);
y2=table2array(y2);
%figure(2);
for i=1:941
plot(x2(i),y2(i),'o-r');
hold on;
end
x3=cogstaticpathtrtesting2d0thw2kf1646new2(:,19);
y3=cogstaticpathtrtesting2d0thw2kf1646new2(:,20);
x3=table2array(x3);
y3=table2array(y3);
%figure(3);
for i=1:941
plot(x3(i),y3(i),'x-b');
hold on;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%include simcarpos and autocarpos
x_simcar=cogstaticpathtrtesting2d0thw2kf1646new2(:,2);
y_simcar=cogstaticpathtrtesting2d0thw2kf1646new2(:,3);
x_simcar=table2array(x_simcar);
y_simcar=table2array(y_simcar);
%figure(2);
for i=1:941
plot(x_simcar(i),y_simcar(i),'o-m');
hold on;
end
x_autocar=cogstaticpathtrtesting2d0thw2kf1646new2(:,10);
y_autocar=cogstaticpathtrtesting2d0thw2kf1646new2(:,11);
x_autocar=table2array(x_autocar);
y_autocar=table2array(y_autocar);
%figure(3);
for i=1:941
plot(x_autocar(i),y_autocar(i),'o-g');
hold on;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%555555555include heading
x_simcarhead=cogstaticpathtrtesting2d0thw2kf1646new2(:,4);
y_simcarhead=cogstaticpathtrtesting2d0thw2kf1646new2(:,5);
x_simcarhead=table2array(x_simcarhead);
y_simcarhead=table2array(y_simcarhead);
figure(3);
for i=1:941
plot(x_simcarhead(i),y_simcarhead(i),'o-y');
hold on;
end
x_autocarhead=cogstaticpathtrtesting2d0thw2kf1646new2(:,12);
y_autocarhead=cogstaticpathtrtesting2d0thw2kf1646new2(:,13);
x_autocarhead=table2array(x_autocarhead);
y_autocarhead=table2array(y_autocarhead);
%figure(3);
for i=1:941
plot(x_autocarhead(i),y_autocarhead(i),'o-c');
hold on;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5555
%new3(change farpoint ini value)
load('new3.mat');
x1=cogstaticpathtrtesting2d0thw2kf1646new3(:,15);
y1=cogstaticpathtrtesting2d0thw2kf1646new3(:,16);
x1=table2array(x1);
y1=table2array(y1);
%figure(1);
for i=1:939
plot(x1(i),y1(i),'*-k');
hold on;
end
x2=cogstaticpathtrtesting2d0thw2kf1646new3(:,17);
y2=cogstaticpathtrtesting2d0thw2kf1646new3(:,18);
x2=table2array(x2);
y2=table2array(y2);
%figure(2);
for i=1:939
plot(x2(i),y2(i),'o-g');
hold on;
end
x3=cogstaticpathtrtesting2d0thw2kf1646new3(:,19);
y3=cogstaticpathtrtesting2d0thw2kf1646new3(:,20);
x3=table2array(x3);
y3=table2array(y3);
%figure(3);
for i=1:939
plot(x3(i),y3(i),'x-b');
hold on;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%new4(change 3 ini value)
load('new5.mat');
x1=cogstaticpathtrtesting2d1(:,15);
y1=cogstaticpathtrtesting2d1(:,16);
x1=table2array(x1);
y1=table2array(y1);
%figure(1);
for i=1:951
plot(x1(i),y1(i),'*-k');
hold on;
pause(0.1);
end
x2=cogstaticpathtrtesting2d1(:,17);
y2=cogstaticpathtrtesting2d1(:,18);
x2=table2array(x2);
y2=table2array(y2);
%figure(2);
for i=1:951
plot(x2(i),y2(i),'o-y');
hold on;
pause(0.1);
end
x3=cogstaticpathtrtesting2d1(:,19);
y3=cogstaticpathtrtesting2d1(:,20);
x3=table2array(x3);
y3=table2array(y3);
%figure(3);
for i=1:951
plot(x3(i),y3(i),'x-c');
hold on;
end