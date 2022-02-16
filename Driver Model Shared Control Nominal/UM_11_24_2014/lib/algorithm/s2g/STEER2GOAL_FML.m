function S2G = STEER2GOAL_FML(PARA, VCS, SIM, RE)

if RE == false
    if VCS.DIST2GOAL < PARA.PLANNING_DIST
        %% RTG
        if SIM.LOGS == YES
            fprintf(SIM.fid, '\t TYPE: Reach the target\n');
        end
        
        S2G.NAME            = 'RTG';
        S2G.NPH             = 1;

        % objective function
        S2G.OBJEC_D2G       = 0;
        S2G.OBJEC_FAD       = 1;
        if ~isempty(PARA.HA_GOAL)
            S2G.OBJEC_ADT   = 3; 
        else
            S2G.OBJEC_ADT   = 2; 
        end
        S2G.OBJEC_FTM       = 1;

        % weights
        % [DSQ, USQ, DDSQ, AXSQ, DIST2GOAL, FINALHA, FINALTIME]
        S2G.WEIGHTS         = [1, 0, 10, 0.01, 0, 0, 1]; %#THLD#

        if S2G.OBJEC_ADT == 3 && abs(PARA.HA_GOAL - VCS.HA) > pi/180 %#THLD#
            S2G.WEIGHTS(6)  = 10;
        end

        % bounds
        % final position: range for the goal
        MARGIN              = 0.05; %#THLD#
        S2G.FXLB            = VCS.VP_GOAL_LOCAL(1) - MARGIN;
        S2G.FXUB            = VCS.VP_GOAL_LOCAL(1) + MARGIN;
        S2G.FYLB            = VCS.VP_GOAL_LOCAL(2) - MARGIN;
        S2G.FYUB            = VCS.VP_GOAL_LOCAL(2) + MARGIN;
        % final steering angle: limit the final steering angle to be 0
        % S2G.FSALB      	= 0;
        % S2G.FSAUB        	= 0;
        S2G.FSALB           = [];
        S2G.FSAUB           = [];
        % final time
        S2G.FTLB            = 0.1; %#THLD#
        S2G.FTUB            = PARA.PLANNING_TIME;
    else
        %% STG
        if SIM.LOGS == YES
            fprintf(SIM.fid, '\t TYPE: Steer towards the goal\n');
        end

        S2G.NAME            = 'STG';
        S2G.NPH             = 1;
        
        % objective function
        S2G.OBJEC_D2G       = 1;
        S2G.OBJEC_FAD       = 1;
        S2G.OBJEC_ADT       = 2;
        S2G.OBJEC_FTM       = 0;
        
        % weights
        % [DSQ, USQ, DDSQ, AXSQ, DIST2GOAL, FINALHA, FINALTIME]
        S2G.WEIGHTS         = [1, 0, 10, 0.01, 1/VCS.DIST2GOAL, 1, 0]; %#THLD#
        
        % bounds
        % final position (No limits)
        S2G.FXLB            = [];
        S2G.FXUB            = [];
        S2G.FYLB            = [];
        S2G.FYUB            = [];
        % final steering angle (No limits)
        S2G.FSALB           = [];
        S2G.FSAUB           = [];
        % final time (Constant number)
        S2G.FTLB            = PARA.PLANNING_TIME - 0.5; %#THLD#
        S2G.FTUB            = PARA.PLANNING_TIME;
       
    end
end

%% RTG Type 2
if RE == true && VCS.DIST2GOAL < PARA.PLANNING_DIST
    if SIM.LOGS == YES
        fprintf(SIM.fid, '\t TYPE: Reach the target - type 2\n');
    end
    
    S2G.NAME            = 'RTG2';
    S2G.NPH             = 1;
    
    % objective function
    S2G.OBJEC_D2G       = 1;
    S2G.OBJEC_FAD       = 1;
    S2G.OBJEC_ADT       = 2;
    S2G.OBJEC_FTM       = 0;
    
    % weights
    % [DSQ, USQ, DDSQ, AXSQ, DIST2GOAL, FINALHA, FINALTIME]
    S2G.WEIGHTS         = [1, 0, 10, 0.01, 1/VCS.DIST2GOAL, 1, 0]; %#THLD#
    
    % bounds
    % final position (No limits)
    S2G.FXLB            = [];
    S2G.FXUB            = [];
    S2G.FYLB            = [];
    S2G.FYUB            = [];
    % final steering angle (No limits)
    S2G.FSALB           = [];
    S2G.FSAUB           = [];
    % final time (Constant number)
    S2G.FTLB            = VCS.DIST2GOAL/VCS.U0 - 0.5; %#THLD#
    S2G.FTUB            = VCS.DIST2GOAL/VCS.U0 - 0.1; %#THLD#
end