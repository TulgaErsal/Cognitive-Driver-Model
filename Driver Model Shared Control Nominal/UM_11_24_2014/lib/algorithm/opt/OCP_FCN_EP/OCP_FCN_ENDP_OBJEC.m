function VALUE_FCN_OBJEC = OCP_FCN_ENDP_OBJEC(INPUT)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isfield(INPUT.AUXDATA, 'TIME_BOUND')

    if toc(INPUT.AUXDATA.TIME_START) > INPUT.AUXDATA.TIME_BOUND
        error('Time limit for solving reached')
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AD              = INPUT.AUXDATA;

NPH             = AD.num.NPH;

XLOC            = AD.mif.XLOC;
YLOC            = AD.mif.YLOC;
ALOC            = AD.mif.ALOC;

ind             = AD.fml.OBJEC_IND; % indicator
OBJEC_R         = AD.fml.OBJEC_R;
OBJEC_W1        = AD.fml.OBJEC_W(1);
OBJEC_W2        = AD.fml.OBJEC_W(2);
OBJEC_W3        = AD.fml.OBJEC_W(3);

XY_GOAL         = AD.fml.XY_GOAL;
X_GOAL          = XY_GOAL(1);
Y_GOAL          = XY_GOAL(2);

% final_x, final_y, and final_psi of the final phase
FPFS            = INPUT.PHASE(NPH).FS;
FPFX            = FPFS(XLOC);
FPFY            = FPFS(YLOC);
FPFA            = FPFS(ALOC);

% final time of the final phase              
FPFT            = INPUT.PHASE(NPH).FT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OBJECTIVE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

value = 0;

% sum of integrals from all phases
if ind(1) == 1
    for IdxPH = 1:NPH
        value = value + INPUT.PHASE(IdxPH).IN;
    end
end

% distance between the goal and the final position
if ind(2) == 1
    value = value + OBJEC_W1*...
            sqrt((FPFX - X_GOAL)^2 + (FPFY - Y_GOAL)^2);
end

% difference between the desired direction and the final heading angle
if ind(3) == 1
    type = AD.fml.OBJEC_ADT;
    
    % distance between a virtual final point and the goal
    if type == 1
        value = value + OBJEC_W2*...
                sqrt((FPFX - X_GOAL + OBJEC_R*cos(FPFA))^2 + ...
                     (FPFY - Y_GOAL + OBJEC_R*sin(FPFA))^2);
    
    % difference between the final heading angle and the angle to goal
    elseif type == 2
        A2G = atan2((Y_GOAL - FPFY), (X_GOAL - FPFX));
        value = value + OBJEC_W2*...
                (atan2(sin(FPFA - A2G), cos(FPFA - A2G)))^2;
        
    % difference between the final heading angle and a specified angle
    elseif type == 3
        HA_GOAL = AD.fml.HA_GOAL;
        value = value + OBJEC_W2*...
                (atan2(sin(FPFA - HA_GOAL), cos(FPFA - HA_GOAL)))^2;
        
    end
end

% final time
if ind(4) == 1
    value = value + OBJEC_W3*FPFT;
end

VALUE_FCN_OBJEC = value;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%