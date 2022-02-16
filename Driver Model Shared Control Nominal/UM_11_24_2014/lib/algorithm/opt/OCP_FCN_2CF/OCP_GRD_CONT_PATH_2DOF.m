function VALUE_GRD_PATH = OCP_GRD_CONT_PATH_2DOF(X, Y, V, R, SA, PATH_IND, PTS)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% preallocation
LENGTH = PATH_IND(1) + 2*(PATH_IND(2) + PATH_IND(3) + PATH_IND(5));

VALUE_GRD_PATH 	= zeros(length(X), LENGTH);

% if at least a path constraint is specified
if sum(PATH_IND) ~= 0
    
    IdxPT   = 0;
    SUM     = PATH_IND(2) + PATH_IND(3) + PATH_IND(5);
    DSSQ    = (X.^2 + Y.^2);
    DS      = sqrt(DSSQ);
    
    %----------------------------------------------------------------------
    % path type 2: polar coordinate - angle // X, Y
    if PATH_IND(2) == 1
        IdxPT                                   = IdxPT + 1;
        VALUE_GRD_PATH(:, IdxPT)                = - Y./DSSQ;
        VALUE_GRD_PATH(:, IdxPT + SUM)          =   X./DSSQ;
        
        % check for NaN resulted from dividing by 0
        for i = 1:length(X)
            if isnan(VALUE_GRD_PATH(i,IdxPT))
                VALUE_GRD_PATH(i,IdxPT)         = 0;
            end
            if isnan(VALUE_GRD_PATH(i,IdxPT + SUM))
                VALUE_GRD_PATH(i,IdxPT + SUM)   = 0;
            end
        end
    end
    
    %----------------------------------------------------------------------
    % path type 3: polar coordinate - radius // X, Y
    if PATH_IND(3) == 1
        IdxPT                                   = IdxPT + 1;
        VALUE_GRD_PATH(:, IdxPT)                = X./DS;
        VALUE_GRD_PATH(:, IdxPT + SUM)          = Y./DS;
    end
    
    %----------------------------------------------------------------------
    % path type 5: lines defining a convex region // X, Y
    if PATH_IND(5) >= 1
        for i = 1:PATH_IND(5)
            IdxPT                               = IdxPT + 1;
            if PTS(i,1) ~= PTS(i,3)
                SLOPE = - (PTS(i,2) - PTS(i,4))/(PTS(i,1) - PTS(i,3));
                VALUE_GRD_PATH(:, IdxPT)       	= SLOPE;
                VALUE_GRD_PATH(:, IdxPT + SUM)	= 1;
            else
                VALUE_GRD_PATH(:, IdxPT)       	= 1;
                VALUE_GRD_PATH(:, IdxPT + SUM) 	= 0;
            end
        end
    end
    
    %----------------------------------------------------------------------
    % path type 1: maximum steering angle limit // DELTAF
    if PATH_IND(1) == 1
        dFUN1dD                                 = 1;
    else
        dFUN1dD                                 = nan;
    end
    
    %----------------------------------------------------------------------
    % path type 4: lateral acceleration // not included
    if PATH_IND(4) == 1

    end
    
    %----------------------------------------------------------------------
    if PATH_IND(1) == 1
        VALUE_GRD_PATH(:, 2*SUM + 1)            = dFUN1dD;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%