function FIGURE_LIDAR(SIM, LI, COLOR)

if SIM.FIG1 == YES && SIM.FIG1_LIDAR == YES
    figure(1)
   
    hold on;
    % position where the LIDAR data is obtained
    plot(LI.VP(1),LI.VP(2),'o','Color',COLOR)
    
    % draw the LIDAR detection data
    DISPLAY_DETECTION(LI.VP, LI.PTS, COLOR);
end

if SIM.FIG2 == YES && SIM.FIG2_LIDAR == YES
    figure(2)
    
    hold on;
    % position where the LIDAR data is obtained
    plot(LI.VP(1),LI.VP(2),'o','Color',COLOR)
    
    % draw the LIDAR detection data
    DISPLAY_DETECTION(LI.VP, LI.PTS, COLOR);
end

if SIM.FIG3 == YES && SIM.FIG3_LIDAR == YES
    figure(3)
    
    hold on;
    % position where the LIDAR data is obtained
    plot(LI.VP(1),LI.VP(2),'o','Color',COLOR)
    
    % draw the LIDAR detection data
    DISPLAY_DETECTION(LI.VP, LI.PTS, COLOR);
end
