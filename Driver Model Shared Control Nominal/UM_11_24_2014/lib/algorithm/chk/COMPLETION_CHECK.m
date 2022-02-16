function GOAL_REACHED = COMPLETION_CHECK(PARA, OBS, SIM)

% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% check for goal arrival
XX                  = PARA.VP_GOAL(1) - OBS.ST(:,1);
YY                  = PARA.VP_GOAL(2) - OBS.ST(:,2);
if min(sqrt(XX.^2 + YY.^2)) <= PARA.DIST2GOAL_THLD + PARA.CONTROL_DELAY_EST*OBS.U %#THLD#
    GOAL_REACHED  	= true;
else
    GOAL_REACHED  	= false;
end
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


% % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% GOAL_PASSED         = false;
% 
% %#CHECK#
% if GOAL_REACHED == false
%     % check for pass goal
%     DIST2GOAL       = sqrt((OBS.X_SEQ - PARA.VP_GOAL(1)).^2 + (OBS.Y_SEQ - PARA.VP_GOAL(2)).^2);
%     
%     IDX             = find(diff(DIST2GOAL) > 0);
% 
%     DIST2GOAL_THLD  = 5; %#THLD#
%     
%     if length(IDX) > 5 && min(DIST2GOAL) < DIST2GOAL_THLD
%         GOAL_PASSED = true;
%     end
% 
%     if GOAL_PASSED == true
%         disp('* Goal has been passed.')
%         disp('* Simulation terminated.')
% 
%         if SIM.LOGS == YES
%             fprintf(SIM.fid, '!! Goal has been passed.\n');
%             fprintf(SIM.fid, '!! Simulation terminated.\n');
%         end
%     end
% end
% % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++