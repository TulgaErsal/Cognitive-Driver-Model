function SIM = FIGURE_STEP_INIT(SPEC, TST, SIM)

if SIM.FIG1 == YES
    % figure position
    SIM.h1 = figure(1);
    set(SIM.h1,'OuterPosition',SIM.FigPos.pos1);
    
    figure(1)
    
    % simulation environment
    if SIM.FIG1_MAP == YES
        DISPLAY_NAVI_TASK(SPEC, SIM)
    end
    
    hold on;
    axis equal
    xlabel('x (m)')
    ylabel('y (m)')
    
    % vehicle current position
    plot(TST.X_SEQ(end), TST.Y_SEQ(end), 'o','Color',SIM.C10(1,:))
end

if SIM.FIG2 == YES
    % figure position
    SIM.h2 = figure(2);
    set(SIM.h2,'OuterPosition',SIM.FigPos.pos2);
    
    figure(2)
    
    % simulation environment
    if SIM.FIG2_MAP == YES
        DISPLAY_NAVI_TASK(SPEC, SIM)
    end
    
    hold on;
    axis equal
    xlabel('x (m)')
    ylabel('y (m)')
    
    % vehicle current position
    plot(TST.X_SEQ(end), TST.Y_SEQ(end), 'o','Color',SIM.C10(1,:))
end

if SIM.FIG3 == YES
    figure(3)
    
    hold on;
    % vehicle current position
    plot(TST.X_SEQ(end), TST.Y_SEQ(end), 'o','Color',SIM.C10(1,:))
end

if SIM.FIG4 == YES
    figure(4)
    
    hold on;
    % vehicle current position
    plot(TST.X_SEQ(end), TST.Y_SEQ(end), 'o','Color',SIM.C10(1,:))
end