function VALUE_FCN_PATH = OCP_FCN_CONT_PATH_2DOF(X, Y, V, R, SA, PATH_IND, PTS, IdxPH, PSI0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% preallocation
VALUE_FCN_PATH 	= zeros(length(X), sum(PATH_IND));

% if at least a path constraint is specified
if sum(PATH_IND) ~= 0
    
    IdxPT = 0;
    %----------------------------------------------------------------------
    % path type 1: maximum steering angle limit
    if PATH_IND(1) == 1
        IdxPT                   = IdxPT + 1;
        VALUE_FCN_PATH(:,IdxPT) = SA;
    end
    
    %----------------------------------------------------------------------
    % path type 2: polar coordinate - angle
    if PATH_IND(2) == 1
        IdxPT                   = IdxPT + 1;
        ANGLE                   = atan2(Y, X);
        if IdxPH == 1
            % assign the first angle of the first phase to be
            % the initial heading angle
            ANGLE(1)            = PSI0;
        end
        VALUE_FCN_PATH(:,IdxPT) = ANGLE;
    end
    
    %----------------------------------------------------------------------
    % path type 3: polar coordinate - radius
    if PATH_IND(3) == 1
        IdxPT                   = IdxPT + 1;
        RADIUS                  = sqrt(X.^2  + Y.^2);
        VALUE_FCN_PATH(:,IdxPT) = RADIUS;
    end
    
    %----------------------------------------------------------------------
    % path type 4: lateral acceleration // not included
    if PATH_IND(4) == 1

    end
    
    %----------------------------------------------------------------------
    % path type 5: lines defining a convex region
    if PATH_IND(5) >= 1
        for i = 1:PATH_IND(5)
            IdxPT = IdxPT + 1;
            if PTS(i,1) ~= PTS(i,3)
                SLOPE   = - (PTS(i,2) - PTS(i,4))/(PTS(i,1) - PTS(i,3));
                LINE    = (Y - PTS(i,2)) + SLOPE*(X - PTS(i,1));
            else
                LINE    = (X - PTS(i,1));
            end
            VALUE_FCN_PATH(:,IdxPT) = LINE;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%