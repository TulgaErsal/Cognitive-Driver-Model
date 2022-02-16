function OCPINFO = DER_MAP_CONT_2DOFNL(SETUP, OCPINFO)

PATH_IND    = SETUP.AUXDATA.fml.PATH_IND;

NMST        = SETUP.AUXDATA.mif.NMST;
NMCT        = SETUP.AUXDATA.mif.NMCT;

NPH         = SETUP.AUXDATA.num.NPH;

%% map for dynamics constraints: first-order partial derivatives
MAP_CONT_VAR1       = 1:NMST + NMCT;

MAP_DYNAMICS_FUN1   = zeros(NMST, length(MAP_CONT_VAR1));

IDX = 0;
% varibale sequence
% X, Y, V, R, DELTAF, PSI, DELTAFDOT
% 1  2  3  4  5       6    7

% has derivative with respect to X
% IDX2 = 1;
% has derivative with respect to Y
% IDX2 = 2;
% has derivative with respect to V
IDX2 = 3;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(1, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(2, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(3, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(4, IDX2) = IDX;
% has derivative with respect to R
IDX2 = 4;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(1, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(2, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(3, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(4, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(6, IDX2) = IDX;
% has derivative with respect to DELTAF
IDX2 = 5;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(3, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(4, IDX2) = IDX;
% has derivative with respect to PSI
IDX2 = 6;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(1, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(2, IDX2) = IDX;
% has derivative with respect to DELTAFDOT
IDX2 = 7;
IDX = IDX + 1;
MAP_DYNAMICS_FUN1(5, IDX2) = IDX;

%% map for dynamics constraints: second-order partial derivatives
MAP_CONT_VAR2       = [
    1, 2, 2, 3, 4, 4, 5, 5, 5, 6, 6, 6, 7;
    1, 1, 2, 3, 3, 4, 3, 4, 5, 3, 4, 6, 7 ];

MAP_DYNAMICS_FUN2   = zeros(NMST, length(MAP_CONT_VAR2));

IDX = 0;
% dx dx
% IDX2 = 1;
% dy dx
% IDX2 = 2;
% dy dy
% IDX2 = 3;
% dv dv
IDX2 = 4;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(3, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(4, IDX2) = IDX;
% dr dv
IDX2 = 5;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(3, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(4, IDX2) = IDX;
% dr dr
IDX2 = 6;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(3, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(4, IDX2) = IDX;
% dd dv
IDX2 = 7;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(3, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(4, IDX2) = IDX;
% dd dr
IDX2 = 8;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(3, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(4, IDX2) = IDX;
% dd dd
IDX2 = 9;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(3, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(4, IDX2) = IDX;
% dp dv
IDX2 = 10;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(1, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(2, IDX2) = IDX;
% dp dr
IDX2 = 11;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(1, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(2, IDX2) = IDX;
% dp dp
IDX2 = 12;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(1, IDX2) = IDX;
IDX = IDX + 1;
MAP_DYNAMICS_FUN2(2, IDX2) = IDX;
% ddd ddd
% IDX2 = 13;

%% map for integrand: first-order partial derivatives
MAP_INTEGRAND_FUN1      = zeros(1,  length(MAP_CONT_VAR1));
MAP_INTEGRAND_FUN1(1)   = 1;
MAP_INTEGRAND_FUN1(2)   = 2;
MAP_INTEGRAND_FUN1(5)   = 3;
MAP_INTEGRAND_FUN1(7)   = 4;

%% map for integrand: second-order partial derivatives
MAP_INTEGRAND_FUN2      = zeros(1, length(MAP_CONT_VAR2));
MAP_INTEGRAND_FUN2(1)   = 1;
MAP_INTEGRAND_FUN2(2)   = 2;
MAP_INTEGRAND_FUN2(3)   = 3;
MAP_INTEGRAND_FUN2(9)   = 4;
MAP_INTEGRAND_FUN2(13)  = 5;

%% continuous hessian map

MAP_CONT_HES = [ MAP_CONT_VAR2, [(NMST + NMCT + 1)*ones(1, NMST + NMCT); 1:1:length(MAP_CONT_VAR1)];
                [zeros(1, length(MAP_CONT_VAR2)); 1:1:length(MAP_CONT_VAR2)], [1:1:length(MAP_CONT_VAR1); zeros(1, NMST + NMCT)]];
            
%% map for path constraints

% dynamics map and integrand map are all the same for all phases

MAP_CONT1(NPH).MAP_CONT_VAR1 = [];
MAP_CONT2(NPH).MAP_CONT_VAR2 = [];

for IdxPH = 1:NPH
    PI_IdxPH        = PATH_IND(IdxPH,:);
    
    SUM             = PI_IdxPH(2) + PI_IdxPH(3) + PI_IdxPH(5);
    
    MAP_PATH_FUN1   = zeros(sum(PI_IdxPH), length(MAP_CONT_VAR1));
    MAP_PATH_FUN2   = zeros(sum(PI_IdxPH), length(MAP_CONT_VAR2));

    if sum(PI_IdxPH) ~= 0
        IDX = 0;
        IDX1 = 0;
        IDX2 = 0;
        
        if PI_IdxPH(1) == 1
            IDX = IDX + 1;
        end
        
        % path type 2: polar coordinate - angle // X, Y
        if PI_IdxPH(2) == 1
            IDX = IDX + 1;
            
            IDX1 = IDX1 + 1;
            MAP_PATH_FUN1(IDX, 1)	= IDX1;         % dX
            MAP_PATH_FUN1(IDX, 2)   = IDX1 + SUM;   % dY
            
            IDX2 = IDX2 + 1;
            MAP_PATH_FUN2(IDX, 1)	= IDX2;         % dXdX
            MAP_PATH_FUN2(IDX, 2)	= IDX2 + SUM;   % dXdY
            MAP_PATH_FUN2(IDX, 3)	= IDX2 + 2*SUM; % dYdY
        end
        
        % path type 3: polar coordinate - radius // X, Y
        if PI_IdxPH(3) == 1
            IDX = IDX + 1;
            
            IDX1 = IDX1 + 1;
            MAP_PATH_FUN1(IDX, 1)	= IDX1;         % dX
            MAP_PATH_FUN1(IDX, 2)   = IDX1 + SUM;   % dY
            
            IDX2 = IDX2 + 1;
            MAP_PATH_FUN2(IDX, 1)	= IDX2;         % dXdX
            MAP_PATH_FUN2(IDX, 2)	= IDX2 + SUM;   % dXdY
            MAP_PATH_FUN2(IDX, 3)	= IDX2 + 2*SUM; % dYdY
        end
        
       	if PI_IdxPH(4) == 1
        	IDX = IDX + 1;
        end
        
        % path type 5: lines defining a convex region // X, Y
        if PI_IdxPH(5) >= 1
            for i = 1:PI_IdxPH(5)
                IDX = IDX + 1;
                
                IDX1 = IDX1 + 1;
                MAP_PATH_FUN1(IDX, 1)	= IDX1;         % dX
                MAP_PATH_FUN1(IDX, 2)   = IDX1 + SUM;   % dY

                IDX2 = IDX2 + 1;
                MAP_PATH_FUN2(IDX, 1)	= IDX2;         % dXdX
                MAP_PATH_FUN2(IDX, 2)	= IDX2 + SUM;   % dXdY
                MAP_PATH_FUN2(IDX, 3)	= IDX2 + 2*SUM; % dYdY
            end
        end
    end
        
    % path type 1: maximum steering angle limit // DELTAF
    % path type 4: lateral acceleration // not included here
        
    if PI_IdxPH(1) == 1
        IDX_1 = 1;
        MAP_PATH_FUN1(IDX_1, 5)  = 2*SUM + 1;           % dD
    end
    
    MAP_CONT1(IdxPH).CONT_VAR1      = MAP_CONT_VAR1;
    MAP_CONT1(IdxPH).DYNA_FUN1      = MAP_DYNAMICS_FUN1;
    MAP_CONT1(IdxPH).PATH_FUN1      = MAP_PATH_FUN1;
    MAP_CONT1(IdxPH).INTG_FUN1      = MAP_INTEGRAND_FUN1;
    
    MAP_CONT2(IdxPH).CONT_VAR2      = MAP_CONT_VAR2;
    MAP_CONT2(IdxPH).DYNA_FUN2      = MAP_DYNAMICS_FUN2;
    MAP_CONT2(IdxPH).PATH_FUN2      = MAP_PATH_FUN2;
    MAP_CONT2(IdxPH).INTG_FUN2      = MAP_INTEGRAND_FUN2;
    MAP_CONT2(IdxPH).CONT_HES       = MAP_CONT_HES;
end

%%
CNT_CONT_VAR1       = length(MAP_CONT_VAR1)*ones(1, NPH);
CNT_CONT_VAR2       = length(MAP_CONT_VAR2)*ones(1, NPH);
CNT_CONT_HESVAR     = length(MAP_CONT_HES)*ones(1, NPH);

OCPINFO.DER_MAP.CNT_CONT_VAR1       = CNT_CONT_VAR1;
OCPINFO.DER_MAP.CNT_CONT_VAR2       = CNT_CONT_VAR2;
OCPINFO.DER_MAP.CNT_CONT_HESVAR  	= CNT_CONT_HESVAR;
OCPINFO.DER_MAP.CONT1               = MAP_CONT1;
OCPINFO.DER_MAP.CONT2               = MAP_CONT2;