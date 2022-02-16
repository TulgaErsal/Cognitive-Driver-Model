function EXE = FEASIBLE_CMDS(PARA, VCS, SIM, EM_EC)

if SIM.STEPCNT > 1
    if SIM.OLD_CNT <= 3
        % load the execution commands from the previous step.
        filename        = [ SIM.cmdfolder, '/OLD_EXE_', num2str(SIM.STEPCNT), '.mat'];
        load(filename);
        EXE             = OLD_EXE;
    else
        EXE.NAVI_TM     = [0, PARA.PLANNING_TIME];
        EXE.NAVI_SA     = sign(VCS.SA0)*[PARA.SA_MAX, PARA.SA_MAX];
        EXE.NAVI_UX     = PARA.U_INIT*[1, 1];
        EXE.NAVI_SR     = [0, 0];
        EXE.NAVI_AX     = [0, 0];
        EXE.D_END       = NaN;
    end
else
    error(EM_EC)
end