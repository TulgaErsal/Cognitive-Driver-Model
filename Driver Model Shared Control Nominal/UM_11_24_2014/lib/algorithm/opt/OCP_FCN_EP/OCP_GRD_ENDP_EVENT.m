function VALUE_GRD_EVENT = OCP_GRD_ENDP_EVENT(INPUT)

% number of phases
NPH             = INPUT.AUXDATA.num.NPH;   
% number of states
NST             = INPUT.AUXDATA.num.NST;    
% final states constraints indicator
ind	= INPUT.AUXDATA.fml.EVENT_IND;

VALUE_GRD_EVENT(NPH).EVENT = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EVENT GROUPS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% connection between phases
if NPH > 1
    VALUE_GRD_EVENT(NPH-1).EVENT = [];
    for IdxPH = 1:NPH - 1
        NMST = NST(IdxPH + 1);
        VALUE_GRD_EVENT(IdxPH).EVENT(1:NMST + 1)            = - 1;
        VALUE_GRD_EVENT(IdxPH).EVENT(NMST + 2:2*NMST + 2)   = 1;
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
    
    if ind(1) == 1 || ind(2) == 1
        REF_PT  	= INPUT.AUXDATA.fml.REF_PT;
        RX         	= REF_PT(1);
        RY        	= REF_PT(2);
        
        FPFX        = FPFX - RX;
        FPFY        = FPFY - RY;
        
        FUN1        = sqrt(FPFY^2 + FPFX^2);
    end
    
    IdxFSEV = 0;
    if ind(1) == 1
        IdxFSEV                         = IdxFSEV + 1;
        % d FUN1 / dFPFX
        Idx                             = IdxFSEV;
        VALUE_GRD_EVENT(NPH).EVENT(Idx) = FPFX/FUN1;
        % d FUN1 / dFPFY
        Idx                             = IdxFSEV + sum(ind);
        VALUE_GRD_EVENT(NPH).EVENT(Idx) = FPFY/FUN1; 
        % d FUN1 / dFPFA
        Idx                             = IdxFSEV + 2*sum(ind);
        VALUE_GRD_EVENT(NPH).EVENT(Idx) = 0;            
    end
    
    if ind(2) == 1
        IdxFSEV                         = IdxFSEV + 1;
        FUN1SQ = FUN1^2;
        % d FUN2 / dFPFX
        Idx                             = IdxFSEV;
        VALUE_GRD_EVENT(NPH).EVENT(Idx) = - FPFY/FUN1SQ;
        % d FUN2 / dFPFY
        Idx                             = IdxFSEV + sum(ind);
        VALUE_GRD_EVENT(NPH).EVENT(Idx) = FPFX/FUN1SQ;   
        % d FUN2 / dFPFA
        Idx                             = IdxFSEV + 2*sum(ind);
        VALUE_GRD_EVENT(NPH).EVENT(Idx) = 0;                
    end
    
    if ind(3) == 1
        IdxFSEV                         = IdxFSEV + 1;
        % d FUN3 / dFPFX
        Idx                             = IdxFSEV;
        VALUE_GRD_EVENT(NPH).EVENT(Idx) = 0; 
        % d FUN3 / dFPFY
        Idx                             = IdxFSEV + sum(ind);
        VALUE_GRD_EVENT(NPH).EVENT(Idx) = 0; 
        % d FUN3 / dFPFA
        Idx                             = IdxFSEV + 2*sum(ind);
        VALUE_GRD_EVENT(NPH).EVENT(Idx) = -0.5*sin(FPFA / 2);   
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%