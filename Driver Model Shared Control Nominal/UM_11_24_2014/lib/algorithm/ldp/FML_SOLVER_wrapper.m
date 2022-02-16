function [EXE, LOG] = FML_SOLVER_wrapper(PARA, VCS, LID, FML, SIM)

if SIM.LOGS == YES
    fprintf(SIM.fid, '# Solve Optimal Control Problems\n');
end

CADN_OBJ                    = inf;
CAND_IDX                    = [];
CAND(FML.FML_CNT).EXE       = [];
OCP_C_SOLVED                = false;

% sequence of OCP solved
SOLVED                      = [];

for i = 1:FML.FML_CNT

    %% Get formulation
    if FML.TYPE(i) == 1
        OCP_C_SOLVED        = true;
        OCP                 = FML.OCP_C(FML.INDEX(i));
    end

    if FML.TYPE(i) == 2 && OCP_C_SOLVED == true && ~isempty(CAND_IDX)
        break;
    end

    if FML.TYPE(i) == 2
        OCP                 = FML.OCP_P(FML.INDEX(i));
    end
    
    index_intersect = intersect(SOLVED, OCP.Peer);
    
    if ~isempty(index_intersect)
        % disp(['skip the problem ', num2str(i)])
        continue;
    end

    %% Find proper initial solution guess
    GUESS                   = [];
    
    PARA.FIND_GUESS         = false;

    if PARA.FIND_GUESS == true && OCP.OCPType ~= 5
        % check extreme right
        GUESS_L             = GENERATE_GUESS(OCP, VCS.XTM.R);

        % check extreme left
        GUESS_R             = GENERATE_GUESS(OCP, VCS.XTM.L);

        if ~isempty(GUESS_L)
            GUESS           = GUESS_L;

        elseif ~isempty(GUESS_R)
            GUESS           = GUESS_R;
        end
    end

    %% Show the formulation
    if SIM.SHOWFML == YES
        COLORS  = distinguishable_colors(OCP.PhaseNum + 1,'w');
        TITLE   = ['FML #', num2str(i)];
        LENGTH  = LID.LR;
        FIGURE_FORMULATION(OCP, TITLE, LENGTH, COLORS);
        % hold on;
        % plot(XTM.L.XY(:, 1), XTM.L.XY(:,2), 'k', 'LineWidth', 3)
        % plot(XTM.L.XY(:, 1), XTM.L.XY(:,2), 'w--', 'LineWidth', 2)
        % plot(XTM.R.XY(:, 1), XTM.R.XY(:,2), 'k', 'LineWidth', 3)
        % plot(XTM.R.XY(:, 1), XTM.R.XY(:,2), 'w--', 'LineWidth', 2)
        % hold off;
    end

    %% Solve the formulated problem
    OCP_Tstart      = tic;

    % formulate the optimal control problem
    INPUT           = FORMULATE_OCP(PARA, VCS, OCP, SIM);

    if exist('GUESS','var') == 1 && ~isempty(GUESS)
        INPUT.GUESS = GUESS;
    end

    % define the optimal control problem
    SETUP           = DEFINE_OCP(INPUT);

    ABORTED = false;
    try
        % built in OCP_FCN_ENDP_OBJEC.m
        SETUP.AUXDATA.TIME_START = tic;
        SETUP.AUXDATA.TIME_BOUND = 10;
        % solve the optimal control problem
        RESULT      = SOLVE_OCP(SETUP);
    catch err
        if strcmp(err.message, 'Time limit for solving reached')
            ABORTED = true;
            disp('Time limit for solving reached')
        else
            disp(['error: ',err.message])
            for m = 1:length(err.stack)
                disp([ err.stack(m).name,'.m - line ', ...
                       num2str(err.stack(m).line)])
            end
            % pause;
        end
    end

    OCP.Telapsed(i)	= toc(OCP_Tstart);
    
    if ABORTED == false && RESULT.NLPSTATUS == 0
        SOLVED      = [SOLVED, i]; %#ok<AGROW>
    end

    %% Evaluate the solution
    if ABORTED == false
        % convert the results to the desired form
        if RESULT.SETUP.AUXDATA.mif.MODEL == 2
            OPTSOL = OPTSOL_INTERP_2DOF(PARA, VCS, RESULT.SOLUTION);
        else
            OPTSOL = OPTSOL_INTERP_3DOF(VCS, RESULT.SOLUTION);
        end

        if SIM.SHOWFML == YES
            hold on;
            plot(OPTSOL.OPTXL, OPTSOL.OPTYL, 'LineWidth', 2, 'Color', COLORS(end,:))
            hold off;

            if SIM.SAVEFML == YES
                saveas(gcf,[SIM.fmlfolder,'/STEP',num2str(SIM.STEPCNT),'_FML',num2str(i)],'fig')
                saveas(gcf,[SIM.fmlfolder,'/STEP',num2str(SIM.STEPCNT),'_FML',num2str(i)],'png')
            end
        end

        if RESULT.NLPSTATUS == 0
            % draw the candidate trajectory
            FIGURE_CAND_TRAJ(SIM, OPTSOL, SIM.C10(4,:))
            
            CAND(i).EXE.NAVI_TM = OPTSOL.OPTTM;
            CAND(i).EXE.NAVI_SA	= OPTSOL.OPTSA;
            CAND(i).EXE.NAVI_UX	= OPTSOL.OPTUX;
            CAND(i).EXE.NAVI_SR	= OPTSOL.OPTSR;
            CAND(i).EXE.NAVI_AX	= OPTSOL.OPTAX;
            CAND(i).EXE.D_END  	= OPTSOL.D_END;
            CAND(i).EXE.OBJEC  	= RESULT.OBJECTIVE;

            if RESULT.OBJECTIVE < CADN_OBJ
                CADN_OBJ    = RESULT.OBJECTIVE;
                CAND_IDX    = i;
            end
        end
    else
        RESULT.OBJECTIVE = 100;
    end

    %% Text Log
    if SIM.LOGS == YES
        formatSpec = '* Formulation %d: \n';
        fprintf(SIM.fid, formatSpec, i);

        formatSpec = '\t Elapsed time: %3.2f seconds \n';
        fprintf(SIM.fid, formatSpec, OCP.Telapsed(i));

        if ABORTED == true
            fprintf(SIM.fid, '\t Time limit for solving reached \n');
            fprintf(SIM.fid, '\t Terminated \n');
        else
            formatSpec = '\t IPOPT termination code: %d \n';
            fprintf(SIM.fid, formatSpec, RESULT.NLPSTATUS);
            if RESULT.NLPSTATUS == 0
                fprintf(SIM.fid, '\t \t OCP: solved sucessfully\n');
                formatSpec = '\t Objective: %10.2f\n';
                fprintf(SIM.fid, formatSpec, RESULT.OBJECTIVE);
            else
                fprintf(SIM.fid, '\t \t OCP: NOT solved exactly\n');
            end
        end
        fprintf(SIM.fid, '\n');
    end
    
    if ABORTED == true
        % Step index - Problem index - Termination Code - Run Time - Objective
        formatSpec = '%10.0f \t %10.0f \t %10.0f \t %8.2f \t %8.2f\n';
        fprintf(SIM.f2id, formatSpec, SIM.STEPCNT, i+2, 5, OCP.Telapsed(i), RESULT.OBJECTIVE);
    else
        % Step index - Problem index - Termination Code - Run Time
        formatSpec = '%10.0f \t %10.0f \t %10.0f \t %8.2f \t %8.2f\n';
        fprintf(SIM.f2id, formatSpec, SIM.STEPCNT, i+2, RESULT.NLPSTATUS, OCP.Telapsed(i), RESULT.OBJECTIVE);
    end

    %% Data Log
    LOG.OCP(i).INPUT        = INPUT;
    LOG.OCP(i).SETUP        = SETUP;
    LOG.OCP(i).ABORTED      = ABORTED;

    if ABORTED == false
        LOG.OCP(i).RESULT   = RESULT;
        LOG.OCP(i).OPTSOL  	= OPTSOL;
        clear INPUT SETUP ABORTED RESULT OPTSOL
    else
        clear INPUT SETUP ABORTED
    end

end

LOG.CAND        = CAND;
LOG.CAND_IDX    = CAND_IDX;
LOG.CADN_OBJ	= CADN_OBJ;

if ~isempty(CAND_IDX)
    EXE = CAND(CAND_IDX).EXE;

    if SIM.LOGS == YES
        fprintf(SIM.fid, '* Global Optimal Solution:\n');
        formatSpec = '\t Formulation: %10.0f\n';
        fprintf(SIM.fid, formatSpec, CAND_IDX);
        formatSpec = '\t Objective:   %10.2f\n';
        fprintf(SIM.fid, formatSpec, CADN_OBJ);
    end
else
    EXE = [];
end