function [S2G, EXE] = STEER2GOAL_wrapper(PARA, VCS, LID, SIM, RE)

if SIM.LOGS == YES
    fprintf(SIM.fid, '# CHECK: steer towards the goal\n');
end

% =========================================================================
if SIM.RTG_IND >= 2
    RE = true;
end

S2G_Tstart          = tic;

S2G                 = STEER2GOAL(PARA, VCS, LID, SIM, RE);

if S2G.CHECK == true % safe = true
    EXE.NAVI_TM     = S2G.OPTSOL.OPTTM;
    EXE.NAVI_SA     = S2G.OPTSOL.OPTSA;
    EXE.NAVI_UX     = S2G.OPTSOL.OPTUX;
    EXE.NAVI_SR     = S2G.OPTSOL.OPTSR;
    EXE.NAVI_AX     = S2G.OPTSOL.OPTAX;
    EXE.D_END       = S2G.OPTSOL.D_END;
    EXE.OBJEC       = S2G.RESULT.OBJECTIVE;
else
    EXE             = [];
end

S2G.Telapsed        = toc(S2G_Tstart);
% =========================================================================

if SIM.DISPLAY == YES
    if S2G.CHECK == true
        disp('# - Steer towards the goal - safe')
    else
        disp('# - Steer towards the goal - not safe')
    end
end

if SIM.LOGS == YES
    formatSpec = '\t Elapsed time: %3.2f seconds \n';
    fprintf(SIM.fid, formatSpec, S2G.Telapsed);
    formatSpec = '\t IPOPT termination code: %d \n';
    fprintf(SIM.fid, formatSpec, S2G.RESULT.NLPSTATUS);
    fprintf(SIM.fid, '\n');

    if S2G.RESULT.NLPSTATUS == 0
        fprintf(SIM.fid, '\t OCP: solved sucessfully\n');

        if S2G.CHECK == true
            fprintf(SIM.fid, '\t \t SAFE to directly steer towards the goal\n');
            fprintf(SIM.fid, '\n');
            fprintf(SIM.fid, '!! Steer towards the goal\n');
        else
            fprintf(SIM.fid, '\t \t NOT safe to directly steer towards the goal\n');
            fprintf(SIM.fid, '\n');
            fprintf(SIM.fid, '!! Cannot directly Steer towards the goal\n');
        end
    else
        fprintf(SIM.fid, '\t OCP: NOT solved exactly\n');
    end
    fprintf(SIM.fid, '\n');
end

% Step index - Problem index - Termination Code - Run Time - Objective
formatSpec = '%10.0f \t %10.0f \t %10.0f \t %8.2f \t %8.2f\n';
fprintf(SIM.f2id, formatSpec, SIM.STEPCNT, 2, S2G.RESULT.NLPSTATUS, S2G.Telapsed, S2G.RESULT.OBJECTIVE);