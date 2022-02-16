load('Track_ref_testing2.mat')
ms2mph = 2.23694;
ds = sqrt(diff(Ref(:,1)).^2 + diff(Ref(:,2)).^2 );
Scum = [0; cumsum( ds )];
VehXY=RESP_VEH(3:4,:)';
VehXY_S = zeros(length(VehXY),1);
for i = 1:length(VehXY)
    dall = sqrt( (VehXY(i,1)-Ref(:,1)).^2 + (VehXY(i,2)-Ref(:,2)).^2 );
    [Mag,Idx] = min(dall);
    VehXY_S(i) = Scum(Idx);
end
CMD_HUM_TH=CMD_HUM(2,:)';
CMD_HUM_BR=CMD_HUM(3,:)';
CMD_HUM_ST=CMD_HUM(4,:)';
RESP_VEH_u=RESP_VEH(2,:)';
%%
figure(11)

subplot(4,1,1)

patch([Scum(100) Scum(164) Scum(164) Scum(100)], [0 0 max(ylim)*[1 1]], [0.9 0.9 0.9])
patch([Scum(235) Scum(300) Scum(300) Scum(235)], [0 0 max(ylim)*[1 1]], [0.9 0.9 0.9])
patch([Scum(411) Scum(450) Scum(450) Scum(411)], [0 0 max(ylim)*[1 1]], [0.9 0.9 0.9])
patch([Scum(450) Scum(530) Scum(530) Scum(450)], [0 0 max(ylim)*[1 1]], [0.8 0.8 0.8])
patch([Scum(650) Scum(670) Scum(670) Scum(650)], [0 0 max(ylim)*[1 1]], [0.9 0.9 0.9])
patch([Scum(670) Scum(697) Scum(697) Scum(670)], [0 0 max(ylim)*[1 1]], [0.8 0.8 0.8])
patch([Scum(697) Scum(750) Scum(750) Scum(697)], [0 0 max(ylim)*[1 1]], [0.7 0.7 0.7])
patch([Scum(830) Scum(878) Scum(878) Scum(830)], [0 0 max(ylim)*[1 1]], [0.9 0.9 0.9])
ylim([-0.05,1.05]);
hold on
plot(VehXY_S,CMD_HUM_TH,'r--')
xlabel('S(m)');ylabel('TH');
hold off
grid
%%
subplot(4,1,2)

patch([Scum(100) Scum(164) Scum(164) Scum(100)], [0 0 max(ylim)*[1 1]], [0.9 0.9 0.9])
patch([Scum(235) Scum(300) Scum(300) Scum(235)], [0 0 max(ylim)*[1 1]], [0.9 0.9 0.9])
patch([Scum(411) Scum(450) Scum(450) Scum(411)], [0 0 max(ylim)*[1 1]], [0.9 0.9 0.9])
patch([Scum(450) Scum(530) Scum(530) Scum(450)], [0 0 max(ylim)*[1 1]], [0.8 0.8 0.8])
patch([Scum(650) Scum(670) Scum(670) Scum(650)], [0 0 max(ylim)*[1 1]], [0.9 0.9 0.9])
patch([Scum(670) Scum(697) Scum(697) Scum(670)], [0 0 max(ylim)*[1 1]], [0.8 0.8 0.8])
patch([Scum(697) Scum(750) Scum(750) Scum(697)], [0 0 max(ylim)*[1 1]], [0.7 0.7 0.7])
patch([Scum(830) Scum(878) Scum(878) Scum(830)], [0 0 max(ylim)*[1 1]], [0.9 0.9 0.9])
ylim([-0.05,1.05]);
hold on
plot(VehXY_S,CMD_HUM_BR,'r--')
xlabel('S(m)');ylabel('BR');
hold off
grid
%%
subplot(4,1,3)

patch([Scum(100) Scum(164) Scum(164) Scum(100)], [-0.1 -0.1 max(ylim)*[1 1]], [0.9 0.9 0.9])
patch([Scum(235) Scum(300) Scum(300) Scum(235)], [-0.1 -0.1 max(ylim)*[0.1 0.1]], [0.9 0.9 0.9])
patch([Scum(411) Scum(450) Scum(450) Scum(411)], [-0.1 -0.1 max(ylim)*[0.1 0.1]], [0.9 0.9 0.9])
patch([Scum(450) Scum(530) Scum(530) Scum(450)], [-0.1 -0.1 max(ylim)*[0.1 0.1]], [0.8 0.8 0.8])
patch([Scum(650) Scum(670) Scum(670) Scum(650)], [-0.1 -0.1 max(ylim)*[0.1 0.1]], [0.9 0.9 0.9])
patch([Scum(670) Scum(697) Scum(697) Scum(670)], [-0.1 -0.1 max(ylim)*[0.1 0.1]], [0.8 0.8 0.8])
patch([Scum(697) Scum(750) Scum(750) Scum(697)], [-0.1 -0.1 max(ylim)*[0.1 0.1]], [0.7 0.7 0.7])
patch([Scum(830) Scum(878) Scum(878) Scum(830)], [-0.1 -0.1 max(ylim)*[0.1 0.1]], [0.9 0.9 0.9])
ylim([-0.1,0.1]);
hold on
plot(VehXY_S,CMD_HUM_ST,'r--')
xlabel('S(m)');ylabel('ST');
hold off
grid

%%
subplot(4,1,4)
hold on
plot(VehXY_S,RESP_VEH_u*ms2mph,'r--')
plot(Scum',[refv refv(end) refv(end)],'b--')
xlabel('S(m)');ylabel('velocity');
hold off
ylim([20,50]);
