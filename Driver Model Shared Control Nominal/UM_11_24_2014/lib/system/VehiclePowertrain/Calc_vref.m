ms2mph = 2.23694;

figure(1)
plot(Ref(:,1),Ref(:,2),'o');

for i = 1:length(Ref)-2
    x = Ref(i:i+2,1);
    A = [x.^2 x ones(3,1)];
    B = Ref(i:i+2,2);
    PARA = inv(A)*B;
    a = PARA(1); b = PARA(2); c = PARA(3);
    dydx = 2*a*x(2) + b;
    dydx2 = 2*abs(a);
    curv(i) = dydx2/(dydx^2+1)^1.5;
end
refv = ms2mph*sqrt(4*2840/2688.7./max(curv,0.001));
figure(2)
plot(curv)
figure(3)
plot(refv)
%  sqrt( (Ref(100:164,1)+70).^2+ (Ref(100:164,2)-100).^2 )
%  heading = atan( diff(Ref(:,2))./diff(Ref(:,1)) ); 
%  % 100 -164
%   heading(164)- heading(100)
%   
% 100-164 first curv, R70  -> 38
% 235-300 second curv, R90 -> 44
% 411-530 third curv, R80, R100 -> 41, 46
% 650-750 fourth curv, R70, R80, R100 -> 38,41,46
% 830-878 fifth curv R65, R70  -> 38 mph

ms2mph*sqrt(4*2840/2688.7*65)
ms2mph*sqrt(4*2840/2688.7*70)
ms2mph*sqrt(4*2840/2688.7*80)
ms2mph*sqrt(4*2840/2688.7*90)
ms2mph*sqrt(4*2840/2688.7*100)


% find curvature
%   ABC = Ref(875:877,1:2);
%   [R,xcyc] = fit_circle_through_3_points(ABC);
  
 
  