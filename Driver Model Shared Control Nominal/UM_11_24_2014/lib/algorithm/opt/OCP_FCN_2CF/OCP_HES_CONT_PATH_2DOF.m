function VALUE_HES_PATH = OCP_HES_CONT_PATH_2DOF(X, Y, V, R, SA, PATH_IND)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% preallocation
LENGTH = 3*(PATH_IND(2) + PATH_IND(3) + PATH_IND(5));

VALUE_HES_PATH 	= zeros(length(X), LENGTH);

% if at least a path constraint is specified
if sum(PATH_IND) ~= 0
    
    IdxPT   = 0;
    SUM     = PATH_IND(2) + PATH_IND(3) + PATH_IND(5);
    DSSQ    = (X.^2 + Y.^2);
    DS      = sqrt(DSSQ);
    DSQU    = DSSQ.^2;
    
    %----------------------------------------------------------------------
    % path type 2: polar coordinate - angle // X, Y
    if PATH_IND(2) == 1
        IdxPT                               = IdxPT + 1;
        VALUE_HES_PATH(:, IdxPT)            = - (     - Y.*(2*X))./DSQU;
        VALUE_HES_PATH(:, IdxPT + SUM)      =   (DSSQ - X.*(2*X))./DSQU;
        VALUE_HES_PATH(:, IdxPT + 2*SUM)    =   (     - X.*(2*Y))./DSQU;
        
        % check for NaN resulted from dividing by 0
        for i = 1:length(X)
            if isnan(VALUE_HES_PATH(i,IdxPT))
                VALUE_HES_PATH(i,IdxPT)         = 0;
            end
            if isnan(VALUE_HES_PATH(i,IdxPT + SUM))
                VALUE_HES_PATH(i,IdxPT + SUM)   = 0;
            end
            if isnan(VALUE_HES_PATH(i,IdxPT + 2*SUM))
                VALUE_HES_PATH(i,IdxPT + 2*SUM) = 0;
            end
        end
    end
    
    %----------------------------------------------------------------------
    % path type 3: polar coordinate - radius // X, Y
    if PATH_IND(3) == 1
        IdxPT                               = IdxPT + 1;
        VALUE_HES_PATH(:, IdxPT)            = (DS - X.*(X./DS))./DSSQ;
        VALUE_HES_PATH(:, IdxPT + SUM)      = (   - Y.*(X./DS))./DSSQ;
        VALUE_HES_PATH(:, IdxPT + 2*SUM)    = (DS - Y.*(Y./DS))./DSSQ;
        
        % check for NaN resulted from dividing by 0
        for i = 1:length(X)
            if isnan(VALUE_HES_PATH(i,IdxPT))
                VALUE_HES_PATH(i,IdxPT)         = 0;
            end
            if isnan(VALUE_HES_PATH(i,IdxPT + SUM))
                VALUE_HES_PATH(i,IdxPT + SUM)   = 0;
            end
            if isnan(VALUE_HES_PATH(i,IdxPT + 2*SUM))
                VALUE_HES_PATH(i,IdxPT + 2*SUM) = 0;
            end
        end
    end
    
    %----------------------------------------------------------------------
    % path type 5: lines defining a convex region // X, Y
    if PATH_IND(5) >= 1
        for i = 1:PATH_IND(5)
            % PTS = INPUT.AUXDATA.formulation.LINE_PTS(IdxPH).PTS;
            IdxPT                               = IdxPT + 1;
            VALUE_HES_PATH(:, IdxPT)            = 0;
            VALUE_HES_PATH(:, IdxPT + SUM)      = 0;
            VALUE_HES_PATH(:, IdxPT + 2*SUM)    = 0;
        end
    end
    
    %----------------------------------------------------------------------
    % path type 1: maximum steering angle limit // DELTAF
    if PATH_IND(1) == 1
        
    end
    
    %----------------------------------------------------------------------
    % path type 4: lateral acceleration // not included
    if PATH_IND(4) == 1

    end
    
    %----------------------------------------------------------------------
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%