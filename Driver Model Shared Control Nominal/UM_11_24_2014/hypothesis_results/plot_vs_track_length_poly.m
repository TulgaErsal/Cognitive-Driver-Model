x_car2=track_data(:,21);
y_car2=track_data(:,22);        

autocar2k_poly(1)=0.001;
autocar2k_poly(2)=0.001;
for i=3:length(x_car2)
    p0_x=x_car2(i-2);
    p1_x=x_car2(i-1);
    p2_x=x_car2(i);
    p0_z=y_car2(i-2);
    p1_z=y_car2(i-1);
    p2_z=y_car2(i);
    M=[ p0_x^2, p1_x^2, p2_x^2; p0_x, p1_x, p2_x; 1,1,1];
    para_matrix=[p0_z,p1_z,p2_z]/M;                                                                                                                                                    
    a=para_matrix(1);
    b=para_matrix(2);
    c=para_matrix(3);
    autocar2k_poly(i)=1/((1+(2*a*p2_x+b)^2)^(3/2)/(2*a));   

end
F=2840;%N
mass=2688.7;%kg
v_ref1_3point_poly=ms2mph *sqrt(4*F./(mass*max(abs(autocar2k_poly),0.001)));%mph

figure(14);
plot(VehXY_S, v_ref1_3point_poly,'r--')