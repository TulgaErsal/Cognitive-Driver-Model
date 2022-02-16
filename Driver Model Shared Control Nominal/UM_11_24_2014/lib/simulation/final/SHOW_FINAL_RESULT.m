function SHOW_FINAL_RESULT(INPUT, RESULT)

if isfield(RESULT, 'X')
    load COLOR_BASIC10.mat

    FigPos = FIGURE_POSITION();

    h1 = figure(1);
    set(h1,'OuterPosition',FigPos.pos3);
    DISPLAY_MAP(INPUT.MAP.BDY, INPUT.MAP.OBS)
    plot(INPUT.VP_INIT(1),INPUT.VP_INIT(2),'.','Color',C10(1,:),'MarkerSize',20) %#ok<NODEF>
    plot(INPUT.VP_GOAL(1),INPUT.VP_GOAL(2),'.','Color',C10(1,:),'MarkerSize',20)
    plot(RESULT.X, RESULT.Y,'Color',C10(3,:),'LineWidth',2)
    axis equal
    
    TMAX = max(RESULT.TIME);

    h2 = figure(2);
    set(h2,'OuterPosition',FigPos.pos4);
    hold on;
    xlabel('Time (s)')
    ylabel('Steering Angle (degree)')
    plot(RESULT.TIME, RESULT.STEERING_ANGLE*180/pi,'Color',C10(3,:),'LineWidth',2)  

    SA_MIN = min(RESULT.STEERING_ANGLE*180/pi);
    SA_MAX = max(RESULT.STEERING_ANGLE*180/pi);

    axis([0, TMAX, SA_MIN-0.1, SA_MAX+0.1])

    h3 = figure(3);
    set(h3,'OuterPosition',FigPos.pos5);
    hold on;
    xlabel('Time (s)')
    ylabel('Longitudinal speed (m/s)')
    plot(RESULT.TIME, RESULT.LONG_SPEED,'Color',C10(3,:),'LineWidth',2)

    U_MIN = min(RESULT.LONG_SPEED);
    U_MAX = max(RESULT.LONG_SPEED);

    axis([0, TMAX, U_MIN-0.5, U_MAX+0.5])

    h4 = figure(4);
    set(h4,'OuterPosition',FigPos.pos6);
    hold on;
    xlabel('Time (s)')
    ylabel('Tire Vertical Load (N)')
    plot(RESULT.TIME, RESULT.VERTICAL_LOAD(:,1),'Color',C10(1,:),'LineWidth',2)
    plot(RESULT.TIME, RESULT.VERTICAL_LOAD(:,2),'Color',C10(4,:),'LineWidth',2)
    plot(RESULT.TIME, RESULT.VERTICAL_LOAD(:,3),'Color',C10(5,:),'LineWidth',2)
    plot(RESULT.TIME, RESULT.VERTICAL_LOAD(:,4),'Color',C10(10,:),'LineWidth',2)

    FZ_MAX = max(RESULT.VERTICAL_LOAD(:));

    axis([0, TMAX, 0, FZ_MAX + 1000])
end