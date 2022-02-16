function [GS, EXE] = GO_STRAIGHT_wrapper(PARA, VCS, LID, SIM)

if SIM.LOGS == YES
    fprintf(SIM.fid, '# CHECK: go straight\n');
end

% =========================================================================
GS_Tstart       = tic;

GS              = GO_STRAIGHT(PARA, VCS, LID);

if GS.CHECK == true
    EXE         = GO_STRAIGHT_CMD(PARA, VCS);
else
    EXE         = [];
end

GS.Telapsed     = toc(GS_Tstart);
% =========================================================================

if SIM.DISPLAY == YES 
    if GS.CHECK == true
        disp('# - Go straight - safe')
    else
        disp('# - Go straight - not safe')
    end
end

if SIM.LOGS == YES
    formatSpec = '\t Criterion - Facing Goal:      (?) %3.2f <= %3.2f m\n';
    fprintf(SIM.fid, formatSpec, GS.FG, GS.FG_THLD);

    if ~isempty(PARA.HA_GOAL)
        formatSpec = '\t Criterion - Angle Difference: (?) %3.2f <= %3.2f deg\n';
        fprintf(SIM.fid, formatSpec, GS.AD*180/pi, GS.AD_THLD*180/pi);
    end

    formatSpec = '\t Criterion - No Obstacle:      (?) %3.2f >= %3.2f m\n';
    fprintf(SIM.fid, formatSpec, GS.NO, GS.NO_THLD);

    fprintf(SIM.fid, '\n');

    if GS.CHECK == true
        fprintf(SIM.fid, '!! Go straight\n');
        fprintf(SIM.fid, '\n');
    else
        fprintf(SIM.fid, '!! Cannot directly go straight\n');
        fprintf(SIM.fid, '\n');
    end
end

% Step index - Problem index - Termination Code - Run Time - Objective
formatSpec = '%10.0f \t %10.0f \t %10.0f \t %8.2f \t %8.2f\n';
fprintf(SIM.f2id, formatSpec, SIM.STEPCNT, 1, 0, GS.Telapsed, -1);