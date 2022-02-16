function [EXE, LOG, SIM, DEADEND, XXXXX, YYYYY] = MPC_VDCOAA(PARA, VCS, LID, SIM, LOG)

% % define new dynamic path data variables 
% global XXXXX                  
% global YYYYY
%  
% MPC-based Vehicle-Dynamics-Conscious Obstacle Avoidance Algorithm

% run go straight or not
RUN_GS                      = false;

% run steer towards the goal or not
RUN_S2G                     = true;

EXE                         = [];
DEADEND                   	= false;

% initialize the dynamic path data
XXXXX = [];
YYYYY = [];

%% Go Straight
if RUN_GS == true
    ts = tic;
    
    [GS, EXE]               = GO_STRAIGHT_wrapper(PARA, VCS, LID, SIM);
    LOG.GS                  = GS;
    
    te = toc(ts);
    formatSpec = '%8.2f \t ';
    fprintf(SIM.f3id, formatSpec, te*1000);
    clear ts te
    
    if GS.CHECK == true
        formatSpec = '%8.2f \t %8.2f \t %8.2f \t %8.2f \t %8.2f \t ';
        fprintf(SIM.f3id, formatSpec, 0, 0, 0, 0, 0);
        return;
    end
else
    formatSpec = '%8.2f \t ';
    fprintf(SIM.f3id, formatSpec, 0);
end

%% Steer Toward the Goal
if RUN_S2G == true
    ts = tic;
    
    [S2G, EXE]              = STEER2GOAL_wrapper(PARA, VCS, LID, SIM, false);
    LOG.S2G                 = S2G;
    
    try
        XXXXX                   = S2G.OPTSOL.OPTX;   % ignores obstacle and goes directly towards goal!
        YYYYY                   = S2G.OPTSOL.OPTY;
    catch
        XXXXX                   = [];
        YYYYY                   = [];
    end
    
    te = toc(ts);
    formatSpec = '%8.2f \t ';
    fprintf(SIM.f3id, formatSpec, te*1000);
    clear ts te
    
    if S2G.CHECK == true  % if this is true, colision free... and if it is false then use empty set!!!
        formatSpec = '%8.2f \t %8.2f \t %8.2f \t %8.2f \t ';
        fprintf(SIM.f3id, formatSpec, 0, 0, 0, 0);
        return;   % if it is safe (do not go into next function and return to the current function) if it is not safe then go to the next function
    else
        XXXXX                   = [];
        YYYYY                   = [];  % is the goal something that the vehicle collides into?
    end
else
    formatSpec = '%8.2f \t ';
    fprintf(SIM.f3id, formatSpec, 0);
end

%% Redo S2G %#UPDATE# 20141019 %#CHECK#
if RUN_S2G == true && isempty(LID.OBSI)
    ts = tic;
    
    SIM.RTG_IND = SIM.RTG_IND + 1;

    [S2G2, EXE] = STEER2GOAL_wrapper(PARA, VCS, LID, SIM, true);

    LOG.S2G2 = S2G2;

    if S2G2.RESULT.NLPSTATUS == 0 && S2G2.CHECK == true
    else
        filename = [ SIM.cmdfolder, '/OLD_EXE_', num2str(SIM.STEPCNT), '.mat'];
        load(filename);
        EXE = OLD_EXE;
    end

    te = toc(ts);
    formatSpec = '%8.2f \t ';
    fprintf(SIM.f3id, formatSpec, te*1000);
    clear ts te
    
    formatSpec = '%8.2f \t %8.2f \t %8.2f \t ';
    fprintf(SIM.f3id, formatSpec, 0, 0, 0);
    return;
else
    formatSpec = '%8.2f \t ';
    fprintf(SIM.f3id, formatSpec, 0);
end

%% if there is an detected obstacle
if ~isempty(LID.OBSI)
    %% Inputs (IPT)
    
    IPT.CONTROL_DELAY_EST   = PARA.CONTROL_DELAY_EST;
    IPT.SENSING_DELAY_EST   = PARA.SENSING_DELAY_EST;
    IPT.LINE_SIMP_THLD      = PARA.LINE_SIMP_THLD;
    IPT.MINDIST_THLD        = PARA.MINDIST_THLD;
    IPT.LASER_RANGE         = PARA.LASER_RANGE;
    if isfield(PARA, 'DLC')
        IPT.CVX             = false;
    end
    IPT.CVX                 = false;
    IPT.VP                  = VCS.VP;
    IPT.HA                  = VCS.HA;
    IPT.DIST2GOAL           = VCS.DIST2GOAL;
    IPT.RM_G2L              = VCS.RM_G2L;
    IPT.ANGLE_MIN           = VCS.ANGLE_MIN;
    IPT.ANGLE_MAX           = VCS.ANGLE_MAX;
    IPT.VP_GOAL_LOCAL       = VCS.VP_GOAL_LOCAL;
    IPT.HA_GOAL_LOCAL       = VCS.HA_GOAL_LOCAL;

    LOG.IPT                 = IPT;

    %% LIDAR Data Features
    if SIM.DISPLAY == YES
        disp('# - Extract LIDAR data features')
    end
    
    ts = tic;
    
    LIF                     = LIDAR_FEATURE_wrapper(IPT, LID, SIM);
    LOG.LIF                 = LIF;
    
    IDX                     = length(LIF.INFO);
    INFO                    = LIF.INFO(IDX).I;
    LIMG                    = LIF.LIMG;
    
    te = toc(ts);
    formatSpec = '%8.2f \t ';
    fprintf(SIM.f3id, formatSpec, te*1000);
    clear ts te
    
    %% Region Partition
    if length(INFO.EP_LOCAL(:, 1)) == 1
        error('No obstacle, should not be here.')
    end
    
    if SIM.DISPLAY == YES
        disp('# - Partition the safe region')
    end
    
    ts = tic;
    
    [FML, FML_P, FML_C, RGP, DEADEND] ...
                            = REGION_PARTITION_wrapper(IPT, LIMG, INFO, SIM);

    LOG.FML                 = FML;
    LOG.FML_P               = FML_P;
    LOG.FML_C               = FML_C;
    LOG.RGP                 = RGP;
    
    te = toc(ts);
    formatSpec = '%8.2f \t ';
    fprintf(SIM.f3id, formatSpec, te*1000);
    clear ts te

    if DEADEND == true
        formatSpec = '%8.2f \t ';
        fprintf(SIM.f3id, formatSpec, 0);
        return;
    end
    
    if FML.FML_CNT == 0
        error('No OCP is formulated')
    end

    %% Formulation Solver
    if SIM.DISPLAY == YES
        disp('# - Solve the formulated OCPs')
    end
    
    ts = tic;
    
    [EXE, OCP]              = FML_SOLVER_wrapper(PARA, VCS, LID, FML, SIM);

    LOG.OCP                 = OCP;
    
    try
        XXXXX                   = OCP.OCP(OCP.CAND_IDX).OPTSOL.OPTX;  % knows about obstacle and will avoid
        YYYYY                   = OCP.OCP(OCP.CAND_IDX).OPTSOL.OPTY;
    catch
        XXXXX                   = []; % if there is no feasible trajectory it is empty anyways!
        YYYYY                   = [];
    end
    te = toc(ts);
    formatSpec = '%8.2f \t ';
    fprintf(SIM.f3id, formatSpec, te*1000);
    clear ts te
end