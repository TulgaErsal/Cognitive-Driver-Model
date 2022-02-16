function VALUE_FCN_EVENT = OCP_FCN_ENDP_EVENT(INPUT)

% number of phases
NPH 	= INPUT.AUXDATA.num.NPH; 
% final states constraints indicator
ind     = INPUT.AUXDATA.fml.EVENT_IND;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EVENT GROUPS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% connection between phases
IdxEG = 0;
if NPH > 1
    VALUE_FCN_EVENT(NPH - 1).EVENT = [];
    for IdxPH = 2:NPH
        FS = INPUT.PHASE(IdxPH - 1).FS;
        FT = INPUT.PHASE(IdxPH - 1).FT;
        IS = INPUT.PHASE(IdxPH).IS;
        IT = INPUT.PHASE(IdxPH).IT;
        IdxEG                           = IdxEG + 1;
        VALUE_FCN_EVENT(IdxEG).EVENT    = [IS - FS, IT - FT];
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if sum(ind) ~= 0
    % limits on functions of final_x, final_y, and final_psi of the final phase
    
    XLOC = INPUT.AUXDATA.mif.XLOC;
    YLOC = INPUT.AUXDATA.mif.YLOC;
    FPFS = INPUT.PHASE(NPH).FS;
    FPFX = FPFS(XLOC);
    FPFY = FPFS(YLOC);

    % preallocation
    FS_EVENT = zeros(1, sum(ind));
    
    if ind(1) == 1 || ind(2) == 1
        REF_PT  	= INPUT.AUXDATA.fml.REF_PT;
        RX         	= REF_PT(1);
        RY        	= REF_PT(2);
        
        FPFX        = FPFX - RX;
        FPFY        = FPFY - RY;
    end
    
    IdxFSEV = 0;
    if ind(1) == 1
        % distance of the final location with respect to the initial location
        FUN1                = sqrt(FPFY^2 + FPFX^2);
        IdxFSEV             = IdxFSEV + 1;
        FS_EVENT(IdxFSEV)   = FUN1;
    end
    
    if ind(2) == 1
        % angle of the final location with respect to the initial location 
        FUN2                = atan2(FPFY, FPFX);
        IdxFSEV             = IdxFSEV + 1;
        FS_EVENT(IdxFSEV)   = FUN2;
    end
    
    if ind(3) == 1
        % final heading angle
        FUN3                = cos(FPFA / 2);
        IdxFSEV             = IdxFSEV + 1;
        FS_EVENT(IdxFSEV)   = FUN3;
    end
    
    IdxEG = IdxEG + 1;
    VALUE_FCN_EVENT(IdxEG).EVENT = FS_EVENT;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%