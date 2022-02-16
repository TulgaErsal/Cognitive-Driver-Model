function VALUE_HES_EVENT = OCP_HES_ENDP_EVENT(INPUT)

% number of phases
NPH             = INPUT.AUXDATA.num.NPH; 
% final states constraints indicator
ind    = INPUT.AUXDATA.fml.EVENT_IND;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EVENT GROUPS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

VALUE_HES_EVENT(NPH).EVENT = [];

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
       	FUN1SQ      = FUN1^2;
        FUN1QU      = FUN1^4;
    end

    IdxFSEV = 0;
    if ind(1) == 1
        IdxFSEV                        	= IdxFSEV + 1;
        Idx                             = IdxFSEV;
        VALUE_HES_EVENT(NPH).EVENT(Idx)	= (FUN1 - FPFX*FPFX/FUN1)/FUN1SQ;
        Idx                             = IdxFSEV + sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx)	= (     - FPFY*FPFX/FUN1)/FUN1SQ;
        Idx                             = IdxFSEV + 2*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx)	= (FUN1 - FPFY*FPFY/FUN1)/FUN1SQ;
        Idx                             = IdxFSEV + 3*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx) = 0;
        Idx                             = IdxFSEV + 4*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx) = 0;
        Idx                             = IdxFSEV + 5*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx) = 0;
    end
    
    if ind(2) == 1
        IdxFSEV                        	= IdxFSEV + 1;
        Idx                             = IdxFSEV;
        VALUE_HES_EVENT(NPH).EVENT(Idx)	= - (       - 2*FPFY*FPFX)/FUN1QU;
        Idx                             = IdxFSEV + sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx)	= (FUN1SQ - 2*FPFX*FPFX)/FUN1QU;
        Idx                             = IdxFSEV + 2*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx)	=   (       - 2*FPFX*FPFY)/FUN1QU;
        Idx                             = IdxFSEV + 3*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx) = 0;
        Idx                             = IdxFSEV + 4*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx) = 0;
        Idx                             = IdxFSEV + 5*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx) = 0;
    end

    if ind(3) == 1
        IdxFSEV                        	= IdxFSEV + 1;
        Idx                             = IdxFSEV;
        VALUE_HES_EVENT(NPH).EVENT(Idx)	= 0;
        Idx                             = IdxFSEV + sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx)	= 0;
        Idx                             = IdxFSEV + 2*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx)	= 0;
        Idx                             = IdxFSEV + 3*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx) = 0;
        Idx                             = IdxFSEV + 4*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx) = 0;
        Idx                             = IdxFSEV + 5*sum(ind);
        VALUE_HES_EVENT(NPH).EVENT(Idx) = - 0.25*cos(FPFA / 2);
    end
end