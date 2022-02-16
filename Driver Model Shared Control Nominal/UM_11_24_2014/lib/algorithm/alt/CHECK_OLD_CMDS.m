function EXE = CHECK_OLD_CMDS(PARA, VCS, LID, SIM)

EXE = [];

% load the execution commands from the previous step.
filename = [ SIM.cmdfolder, '/OLD_EXE_', num2str(SIM.STEPCNT), '.mat'];

if exist(filename, 'file') == 2
    % preallocation
    OLD_EXE = [];
    load(filename);

    % apply the OLD_EXE to a 14 DoF vehicle model
    % to check whether the commands is still feasible or not

    SIM14.DATA_HMMWV        = PARA.DATA_HMMWV_14DoF;
    SIM14.KVEL              = PARA.KVEL;
    
    SIM14.STATES_INIT       = VCS.STATES_INIT;
    
    SIM14.CMD_TM            = OLD_EXE.NAVI_TM;
    SIM14.CMD_UX        	= OLD_EXE.NAVI_UX;
    SIM14.CMD_SA            = OLD_EXE.NAVI_SA;
    SIM14.CMD_SR            = OLD_EXE.NAVI_SR;
    SIM14.CMD_AX            = OLD_EXE.NAVI_AX;
    
    SIM14.CMD_SAFL          = SIM14.CMD_SA;
    SIM14.CMD_SAFR          = SIM14.CMD_SA;
    SIM14.CMD_SARL          = zeros(size(SIM14.CMD_TM));
    SIM14.CMD_SARR          = zeros(size(SIM14.CMD_TM));
    
    SIM14.T_TOTAL           = min([PARA.EXECUTION_TIME, SIM14.CMD_TM(end)]);

    RES14                   = SIM_14DoF(SIM14);
    
    TRAJECTORY              = RES14.STATE(:,1:2);
    
    %#CHECK#
    [FEASIBLE, MINDIST]     = LIDAR_CheckDist(TRAJECTORY, ...
                              LID.PTS_OB, PARA.MINDIST_THLD);

    disp('* Check the feasibility of commands from previous step')
    disp(['* Minimum distance to obstacle is ', num2str(MINDIST)])

    if SIM.LOGS == YES
        fprintf(SIM.fid, 'CHECK: previous step commands feasibility\n');
        fprintf(SIM.fid, '\t Minimum distance to obstacle is %3.2f\n', num2str(MINDIST));
    end

    if FEASIBLE == true
        EXE   	= OLD_EXE;
    end
end