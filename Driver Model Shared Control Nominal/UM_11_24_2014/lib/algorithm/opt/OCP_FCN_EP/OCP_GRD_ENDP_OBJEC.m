function value = OCP_GRD_ENDP_OBJEC(INPUT)

AD              = INPUT.AUXDATA;

NPH             = AD.num.NPH;

XLOC            = AD.mif.XLOC;
YLOC            = AD.mif.YLOC;
ALOC            = AD.mif.ALOC;

OBJEC_IND       = AD.fml.OBJEC_IND;
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OBJECTIVE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% distance of final position to goal
if OBJEC_IND(2) == 1
    FUN1        = sqrt((FPFX - X_GOAL)^2 + (FPFY - Y_GOAL)^2);
    
    dFUN1d1     = (FPFX - X_GOAL)/FUN1;
    dFUN1d2     = (FPFY - Y_GOAL)/FUN1;
    dFUN1d3     = 0;
else
    dFUN1d1     = 0;
    dFUN1d2     = 0;
    dFUN1d3     = 0;
end

% difference between the final heading angle and a desried direction
if OBJEC_IND(3) == 1
    type = AD.fml.OBJEC_ADT;
    
    if type == 1
        FUN2	= sqrt( (FPFX - X_GOAL + OBJEC_R*cos(FPFA))^2 + ...
                	    (FPFY - Y_GOAL + OBJEC_R*sin(FPFA))^2);
        
        dFUN2d1	= (FPFX - X_GOAL + OBJEC_R*cos(FPFA))/FUN2;
        dFUN2d2	= (FPFY - Y_GOAL + OBJEC_R*sin(FPFA))/FUN2;
        dFUN2d3	= OBJEC_R*( - (FPFX - X_GOAL)*sin(FPFA) + ...
                              (FPFY - Y_GOAL)*cos(FPFA) )/FUN2;
                                   
    elseif type == 2
        A2G    	= atan2((Y_GOAL - FPFY), (X_GOAL - FPFX));
        
        TMP2  	= (X_GOAL - FPFX)^2 + (Y_GOAL - FPFY)^2;
        dA2Gd1 	=   (Y_GOAL - FPFY)/TMP2;
        dA2Gd2	= - (X_GOAL - FPFX)/TMP2;
        
        TMP1Y  	= sin(FPFA - A2G);
        TMP1X 	= cos(FPFA - A2G);
        TMP1 	= atan2(TMP1Y, TMP1X);
        dTMP1d1	= - dA2Gd1;
        dTMP1d2	= - dA2Gd2;
        dTMP1d3	= 1;
        
        dFUN2d1	= 2*TMP1*dTMP1d1;
        dFUN2d2	= 2*TMP1*dTMP1d2;
        dFUN2d3	= 2*TMP1*dTMP1d3;
        
    elseif type == 3
        HA_GOAL	= AD.fml.HA_GOAL;
        
        TMP1  	= atan2(sin(FPFA - HA_GOAL), cos(FPFA - HA_GOAL));
        dTMP1d3	= 1;
        dFUN2d1	= 0;
        dFUN2d2	= 0;
        dFUN2d3	= 2*TMP1*dTMP1d3;
        
    end
else
    dFUN2d1     = 0;
    dFUN2d2     = 0;
    dFUN2d3     = 0;
end

IDX = 0;
if NPH > 1
    % d OBJECTIVE / dintegral (1:NPH-1)
    IDX_SEQ         = IDX + 1:IDX + (NPH - 1);
    value(IDX_SEQ)	= 1;
    IDX         	= IDX + (NPH - 1);
end

% d OBJECTIVE / dFPFX
IDX                 = IDX + 1;
value(IDX)        	= OBJEC_W1*dFUN1d1 + OBJEC_W2*dFUN2d1;

% d OBJECTIVE / dFPFY
IDX              	= IDX + 1;
value(IDX)      	= OBJEC_W1*dFUN1d2 + OBJEC_W2*dFUN2d2;

% d OBJECTIVE / dFPFA
IDX              	= IDX + 1;
value(IDX)        	= OBJEC_W1*dFUN1d3 + OBJEC_W2*dFUN2d3;

% d OBJECTIVE / dFPFT
IDX                 = IDX + 1;
if OBJEC_IND(4) == 1
    value(IDX)  	= OBJEC_W3;
else
    value(IDX)  	= 0;
end

% d OBJECTIVE / dintegral (NPH)
IDX = IDX + 1;
if OBJEC_IND(1) == 1
    value(IDX)    	= 1;
else
    value(IDX)   	= 0;
end

VALUE_GRD_OBJEC = value;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%