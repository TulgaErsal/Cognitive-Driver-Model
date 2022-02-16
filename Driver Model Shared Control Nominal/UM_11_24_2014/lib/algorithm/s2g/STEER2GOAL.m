function S2G = STEER2GOAL(PARA, VCS, LID, SIM, RE)

% specification of the steer towards the goal problem
S2G                 = STEER2GOAL_FML(PARA, VCS, SIM, RE);

% formulation of the optimal control problem
INPUT               = STEER2GOAL_OCP(PARA, VCS, S2G);

% mesh 
SEG_NUM           	= 10;
MESH.PH.FCT       	= (1/SEG_NUM)*ones(1, SEG_NUM);
MESH.PH.NCP       	= 4*ones(1, SEG_NUM);

INPUT.MESH         	= MESH;

% initial guess
if SIM.STEPCNT > 1
    fn = [ SIM.guessfolder, '/STG_GUESS_', num2str(SIM.STEPCNT), '.mat'];

    if exist(fn, 'file') == 2
        load(fn);
        INPUT.GUESS	= GUESS; %#ok<NODEF>
    end
end

% define the optimal control problem
SETUP           	= DEFINE_OCP(INPUT);

% solve the optimal control problem
RESULT             	= SOLVE_OCP(SETUP);

% save the result; it will be used as the initial solution guess of next step
if RESULT.SOLUTION.PHASE(1).TM(end) > PARA.EXECUTION_TIME
    TM              = RESULT.SOLUTION.PHASE(1).TM;
    [~, IDX]     	= min(abs(TM - PARA.EXECUTION_TIME));
    GUESS.PH(1).TM	= TM(IDX:end) - TM(IDX);
    GUESS.PH(1).ST 	= RESULT.SOLUTION.PHASE(1).ST(IDX:end, :);
    GUESS.PH(1).CT 	= RESULT.SOLUTION.PHASE(1).CT(IDX:end, :);
    GUESS.PH(1).IN 	= 0;
    
    if length(GUESS.PH(1).TM) > 3
        save([ SIM.guessfolder, '/STG_GUESS_', num2str(SIM.STEPCNT+1), '.mat'], 'GUESS','-v6')
    end
end

% if the defined OCP problem is succeffuly solved
if RESULT.NLPSTATUS == 0
    
    % convert the results to the desired form
    if RESULT.SETUP.AUXDATA.mif.MODEL == 2
        OPTSOL  	= OPTSOL_INTERP_2DOF(PARA, VCS, RESULT.SOLUTION);
    elseif RESULT.SETUP.AUXDATA.mif.MODEL == 3
        OPTSOL  	= OPTSOL_INTERP_3DOF(VCS, RESULT.SOLUTION);
    end

    % draw the candidate trajectories
    FIGURE_CAND_TRAJ(SIM, OPTSOL, SIM.C10(2,:))

    % check the feasibility of the solution
    TRAJECTORY      = OPTSOL.TRAJECTORY;
    FINAL_HA        = OPTSOL.A_END;
    
    MINDIST_THLD    = PARA.MINDIST_THLD;
    DIST2GOAL       = VCS.DIST2GOAL;
    
    CHECK           = OPTSOL_CHECK(TRAJECTORY, FINAL_HA, MINDIST_THLD, DIST2GOAL, LID, SIM);
else
    OPTSOL          = [];
    CHECK           = false;
    
    %#CHECK#
    % handler for the situation when the problem is not solved

    % this situation is not really expected.

    % steer towards the goal problem should always be able to solved
    % exactly as long as the problem specification is feasible
end

% save data
S2G.INPUT           = INPUT;
S2G.RESULT          = RESULT;
S2G.OPTSOL      	= OPTSOL;
S2G.CHECK           = CHECK;