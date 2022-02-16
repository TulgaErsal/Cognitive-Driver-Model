function SIM = FIGURE_INIT(SIM)

% Initialize the figures

%--------------------------------------------------------------------------
% Figure 1: _STEPCNT MAP, LIDAR detection, auxiliary lines, predicted trajectories, actual trajectory 
% Figure 2: _STEPCNT MAP, LIDAR detection, auxiliary lines, predicted trajectories, actual trajectory 
% Figure 3: Figure 1 oversteps
% Figure 4: Trajectory (predicted & actual) (No LIDAR detection and auxiliary lines)
% Figure 5: Steering angle (predicted & actual)
% Figure 6: Longitudinal speed (predicted & actual)
% Figure 7: Tire vertical loads (actual)
% Figure 8: Steering rate (predicted & actual), 
%           Longitudinal acceleration (predicted & actual)
%--------------------------------------------------------------------------

% draw figure or not
if isfield(SIM, 'SHOWALL')
    if SIM.SHOWALL == YES
        SIM.FIG1     	= YES;
        SIM.FIG2       	= YES;
        SIM.FIG3       	= YES;
        SIM.FIG4       	= YES;
        SIM.FIG5      	= YES;
        SIM.FIG6       	= YES;
        SIM.FIG7      	= YES;
        SIM.FIG8      	= YES;
    elseif SIM.SHOWALL == NO
        SIM.FIG1     	= NO;
        SIM.FIG2       	= NO;
        SIM.FIG3       	= NO;
        SIM.FIG4       	= NO;
        SIM.FIG5      	= NO;
        SIM.FIG6       	= NO;
        SIM.FIG7      	= NO;
        SIM.FIG8      	= NO;
    end
end

% save figure or not
if isfield(SIM, 'SAVEALL')
    if SIM.SAVEALL == YES
        SIM.SAVEFIG1	= YES;
        SIM.SAVEFIG2   	= YES;
        SIM.SAVEFIG3   	= YES;
        SIM.SAVEFIG4   	= YES;
        SIM.SAVEFIG5  	= YES;
        SIM.SAVEFIG6  	= YES;
        SIM.SAVEFIG7   	= YES;
        SIM.SAVEFIG8   	= YES;
    elseif SIM.SAVEALL == NO
        SIM.SAVEFIG1  	= NO;
        SIM.SAVEFIG2   	= NO;
        SIM.SAVEFIG3   	= NO;
        SIM.SAVEFIG4   	= NO;
        SIM.SAVEFIG5  	= NO;
        SIM.SAVEFIG6  	= NO;
        SIM.SAVEFIG7   	= NO;
        SIM.SAVEFIG8   	= NO;
    end
end

SIM.SAVEFIG1            = NO;
SIM.SAVEFIG2            = NO;
SIM.SAVEFIG3            = NO;
SIM.SAVEFIG4            = NO;
SIM.SAVEFIG5            = NO;
SIM.SAVEFIG6            = NO;
SIM.SAVEFIG7            = NO;
SIM.SAVEFIG8            = NO;

% figure 1 contents
SIM.FIG1_MAP            = YES;
SIM.FIG1_LIDAR          = YES;
SIM.FIG1_AUXLN          = YES;
SIM.FIG1_CANDXY         = YES;
SIM.FIG1_AXTUALXY       = YES;

% figure 2 contents
SIM.FIG2_MAP            = NO;
SIM.FIG2_LIDAR          = YES;
SIM.FIG2_AUXLN          = YES;
SIM.FIG2_CANDXY         = YES;
SIM.FIG2_AXTUALXY       = YES;

% figure 3 contents
SIM.FIG3_LIDAR          = YES;
SIM.FIG3_AUXLN          = YES;
SIM.FIG3_CANDXY         = YES;
SIM.FIG3_AXTUALXY       = YES;

if SIM.FIG3 == YES
    SIM.h3 = figure(3);
    set(SIM.h3,'OuterPosition',SIM.FigPos.pos3);
    set(SIM.h3,'Name','Fig3');
    
    figure(3)
    hold on;
    xlabel('x (m)')
    ylabel('y (m)')
end

if SIM.FIG4 == YES
    SIM.h4 = figure(4);
    set(SIM.h4,'OuterPosition',SIM.FigPos.pos4);
    set(SIM.h4,'Name','Fig4');
    
    figure(4)
    hold on;
    xlabel('x (m)')
    ylabel('y (m)')
end
  
if SIM.FIG5 == YES
    SIM.h5 = figure(5); 
    set(SIM.h5,'OuterPosition',SIM.FigPos.pos5);
    set(SIM.h5,'Name','Fig5');
    
    figure(5)
    hold on;
    xlabel('Time (s)')
    ylabel('Steering angle (\circ)')
end

if SIM.FIG6 == YES
    SIM.h6 = figure(6);
    set(SIM.h6,'OuterPosition',SIM.FigPos.pos6);
    set(SIM.h6,'Name','Fig6');
    
    figure(6)
    hold on;
    xlabel('Time (s)')
    ylabel('Longitudinal speed (m/s)')
end

if SIM.FIG7 == YES
    SIM.h7 = figure(7); 
    set(SIM.h7,'OuterPosition',SIM.FigPos.pos7);
    set(SIM.h7,'Name','Fig7');
    
    figure(7)
    hold on;
    xlabel('Time (s)')
    ylabel('Tire vertical load (N)')
end

if SIM.FIG8 == YES
    SIM.h8 = figure(8);
    set(SIM.h8,'OuterPosition',SIM.FigPos.pos8);
    set(SIM.h8,'Name','Fig8');
    
    figure(8)
    subplot(2,1,1)
    hold on;
    xlabel('Time (s)')
    ylabel('$\dot \delta$ ($^{\circ}$/s)', 'interpreter', 'latex')

    subplot(2,1,2)
    hold on;
    xlabel('Time (s)')
    ylabel('a_x (m/s^2)')
end