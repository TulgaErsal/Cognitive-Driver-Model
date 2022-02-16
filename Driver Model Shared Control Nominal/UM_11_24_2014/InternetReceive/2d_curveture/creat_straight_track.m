 x1=0;
 y1=linspace(1,299,299);
 figure;
 plot(x1,y1,'b-o')
 hold on
 alpha=0:pi/800:pi/2;
 x2=50*cos(alpha)-50;
 y2=50*sin(alpha)+300;
 plot(x2,y2,'b-o') 
 hold on
 x3=linspace(-51,-350,300);
 y3=350;
 plot(x3,y3,'b-o') 