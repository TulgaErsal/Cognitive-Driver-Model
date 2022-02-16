function FIGURE_STEP_ACTUAL(TST, SIM)

if SIM.FIG1 == YES
    figure(1)
    hold on;
    % actual trajectory
    plot(TST.ST(:,1),TST.ST(:,2),'-','Color',SIM.C10(3,:),'LineWidth',2);
end

if SIM.FIG2 == YES
    figure(2)
    hold on;
    % actual trajectory
    plot(TST.ST(:,1),TST.ST(:,2),'-','Color',SIM.C10(3,:),'LineWidth',2);
end

if SIM.FIG3 == YES
    figure(3)
    hold on;
    % actual trajectory
    plot(TST.ST(:,1),TST.ST(:,2),'-','Color',SIM.C10(3,:),'LineWidth',2);
end

if SIM.FIG4 == YES
    figure(4)
    hold on;
    % actual trajectory
    plot(TST.ST(:,1),TST.ST(:,2),'-','Color',SIM.C10(3,:),'LineWidth',2);
end

TM = TST.TM + TST.TIME_PRE - TST.TM(end);

if SIM.FIG5 == YES
    figure(5)
    hold on;
    % command applied
    plot(TM, TST.CM(:,1)*180/pi,'-','Color', SIM.C10(3,:))
end

if SIM.FIG6 == YES
    figure(6)
    hold on;
    % command applied
    plot(TM, TST.ST(:,7),'-','Color', SIM.C10(3,:))
end

if SIM.FIG7 == YES
    figure(7)
    hold on;
    plot(TM, TST.FC(:,9), 'Color', SIM.C10(1,:))
    plot(TM, TST.FC(:,10),'Color', SIM.C10(4,:))
    plot(TM, TST.FC(:,11),'Color', SIM.C10(7,:))
    plot(TM, TST.FC(:,12),'Color', SIM.C10(10,:))
end

if SIM.FIG8 == YES
    figure(8)
    
    subplot(2,1,1)
    
    subplot(2,1,2)

end