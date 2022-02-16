function SHOW_RESULT_MA(nameM, nameA)

load COLOR_BASIC10.mat
load(['00TEST_2OB_', nameM, '.mat'])

FigPos = FIGURE_POSITION();

h1 = figure(1);
set(h1,'OuterPosition',FigPos.pos3);
DISPLAY_MAP(INPUT.MAP.BDY, INPUT.MAP.OBS)
plot(INPUT.VP_INIT(1),INPUT.VP_INIT(2),'.','Color',C10(1,:),'MarkerSize',20) 
plot(INPUT.VP_GOAL(1),INPUT.VP_GOAL(2),'.','Color',C10(1,:),'MarkerSize',20)
plot(RESULT.X, RESULT.Y,'Color',C10(3,:),'LineWidth',2)
axis equal

h2 = figure(2);
set(h2,'OuterPosition',FigPos.pos4);
hold on;
xlabel('Time (s)')
ylabel('Steering Angle (degree)')
plot(RESULT.TIME, RESULT.STEERING_ANGLE*180/pi,'Color',C10(3,:),'LineWidth',2)  

h3 = figure(3);
set(h3,'OuterPosition',FigPos.pos5);
hold on;
xlabel('Time (s)')
ylabel('Longitudinal speed (m/s)')
plot(RESULT.TIME, RESULT.LONG_SPEED,'Color',C10(3,:),'LineWidth',2)

h4 = figure(4);
set(h4,'OuterPosition',FigPos.pos6);
hold on;
xlabel('Time (s)')
ylabel('Tire Vertical Load (N)')
plot(RESULT.TIME, RESULT.VERTICAL_LOAD(:,1),'Color',C10(1,:),'LineWidth',2)
plot(RESULT.TIME, RESULT.VERTICAL_LOAD(:,2),'Color',C10(4,:),'LineWidth',2)
plot(RESULT.TIME, RESULT.VERTICAL_LOAD(:,3),'Color',C10(5,:),'LineWidth',2)
plot(RESULT.TIME, RESULT.VERTICAL_LOAD(:,4),'Color',C10(10,:),'LineWidth',2)

clearvars -except nameM nameA C10
load(['00TEST_1OB_', nameA, '.mat'])

figure(1)
hold on;
plot(states(:, 1)/1000 + 20, states(:, 2)/1000 + 200,'Color',C10(4,:),'LineWidth',2)

l = min(length(time), length(controls));

figure(2)
hold on;
plot(time(1:l), controls(1:l, 1)*180/pi,'Color',C10(4,:),'LineWidth',2)

u = states(:, 4).*cos(states(:, 14)) + states(:, 5).*sin(states(:, 14));
u = u/1000;

figure(3)
hold on;
plot(time(1:l), u(1:l, 1),'Color',C10(4,:),'LineWidth',2)

figure(1)
saveas(gcf,[nameM, nameA, '_XY'],'fig')
saveas(gcf,[nameM, nameA, '_XY'],'png')

figure(2)
saveas(gcf,[nameM, nameA, '_SA'],'fig')
saveas(gcf,[nameM, nameA, '_SA'],'png')

figure(3)
saveas(gcf,[nameM, nameA, '_UX'],'fig')
saveas(gcf,[nameM, nameA, '_UX'],'png')

figure(4)
saveas(gcf,[nameM, nameA, '_FZ'],'fig')
saveas(gcf,[nameM, nameA, '_FZ'],'png')