function EP_POLAR = LIDAR_DP_EPPOLAR(EP_LOCAL)

EP_POLAR            = zeros(size(EP_LOCAL, 1), 4);

for i = 1:size(EP_LOCAL, 1)
    A1              = atan2(EP_LOCAL(i,2), EP_LOCAL(i,1));
    A2              = atan2(EP_LOCAL(i,4), EP_LOCAL(i,3));
    R1              = norm(EP_LOCAL(i,1:2));
    R2              = norm(EP_LOCAL(i,3:4));
    
    EP_POLAR(i, 1)	= A1;
    EP_POLAR(i, 2)	= A2;
    EP_POLAR(i, 3)  = R1;
    EP_POLAR(i, 4)  = R2;
end