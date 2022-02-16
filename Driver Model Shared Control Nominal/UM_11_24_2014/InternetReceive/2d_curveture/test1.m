
load('graphdfa2')
load('graphdt2')
Dfa=table2array(graphdfa);
Dt=table2array(graphdt);
fa= cumsum(Dfa);
t= cumsum(Dt);



 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 load('Track_ref_training_Yue.mat')
  load('new4_newtrack.mat')
 VehXY = table2array(cogstaticpathtrnewtrackd0thw3kf16kn0ki0new4(:,2:3));
 VehTime = table2array(cogstaticpathtrnewtrackd0thw3kf16kn0ki0new4(:,1));
 %load('Lines')
 Vertices=Ref;
Lines=[1:length(Ref)-1 ; 2:length(Ref)]';
  k=LineCurvature2D(Vertices,Lines);
%   figure,  hold on
%k=k*100;
 k=k*1;
 figure(1)
 plot([Vertices(Lines(:,1),1) Vertices(Lines(:,2),1)]',[Vertices(Lines(:,1),2) Vertices(Lines(:,2),2)]','b');
 plot(Vertices(:,1),Vertices(:,2),'r.');
 xlabel('X-position');
 ylabel('Y-position');
 axis equal;
 
 [xy,distance,t_a] = distance2curve(Ref,VehXY,'linear');
 figure(2)
 hold on                                                                                   
 plot(Ref(:,1),Ref(:,2),'k');
 IndexAll = [];
 for i = 1:length(xy)
     plot(xy(i,1),xy(i,2),'x',VehXY(i,1),VehXY(i,2),'o');
     [M,I] = min(  (xy(i,1)-Ref(:,1)).^2+(xy(i,2)-Ref(:,2)).^2);
     IndexAll =[IndexAll;I];
     %plot(xy(i,1),VehXY(i,1), xy(i,2) , VehXY(i,2),'r--');
 end
 hold off
  curvAll = k(IndexAll);
  
 figure(3)
 plot(VehTime,curvAll);
 xlabel('Time');
 ylabel('Steering Angle');
hold on 
 plot(t,fa,'b-o');
xlabel('Time');
ylabel('farpoint');
figure;
AX=plotyy(t,fa,VehTime,curvAll)
ylim(AX(1),[0,0.12]);
ylim(AX(2),[-0.02,2]);

 

 