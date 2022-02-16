
x_car2=track_data(:,21);
y_car2=track_data(:,22);        
autocar2k_matlab(1)=0.0;
autocar2k_matlab(2)=0.0;

for i=3:length(x_car2)
    p0_x=x_car2(i-2);
    p1_x=x_car2(i-1);
    p2_x=x_car2(i);
    p0_z=y_car2(i-2);
    p1_z=y_car2(i-1);
    p2_z=y_car2(i);
    dx1 =p1_x-p0_x;
    dz1 =p1_z-p0_z;
    dx2 =p2_x-p0_x;
    dz2 =p2_z-p0_z; 
    area =abs(dx1*dz2-dz1*dx2);
    len0 =sqrt((p0_x-p1_x)^2+(p0_z-p1_z)^2); 
    len1 =sqrt((p1_x-p2_x)^2+(p1_z-p2_z)^2); 
    len2 =sqrt((p2_x-p0_x)^2+(p2_z-p0_z)^2); 
    outproduct = (dx1*dz2-dx2*dz1)/(len0*len2);
     if abs(outproduct)<0.001
        autocar2k_matlab(i) =0.0;
     else
        autocar2k_matlab(i) = 4*area/(len0*len1*len2); 
     end
end
F=2840;%N
mass=2688.7;%kg
v_ref1_3point=ms2mph *sqrt(4*F./(mass*max(abs(autocar2k_matlab),0.001)));%mph

figure(13);
plot(VehXY_S, v_ref1_3point,'b--')