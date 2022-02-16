function VALUE_HES_OBJEC = OCP_HES_ENDP_OBJEC(INPUT)

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OBJECTIVE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ind(2) == 1
    FUN1        = sqrt((FPFX - X_GOAL)^2 + (FPFY - Y_GOAL)^2);
    FUN1SQ      = FUN1^2;
    dFUN1d1     = (FPFX - X_GOAL)/FUN1;
    dFUN1d2     = (FPFY - Y_GOAL)/FUN1;
    dFUN1d3     = 0;
    
    dFUN1d1d1   = (FUN1 - (FPFX - X_GOAL)*dFUN1d1)/FUN1SQ;
    dFUN1d2d1   = (     - (FPFY - Y_GOAL)*dFUN1d1)/FUN1SQ;
    dFUN1d2d2   = (FUN1 - (FPFY - Y_GOAL)*dFUN1d2)/FUN1SQ;
    dFUN1d3d1   = 0;
    dFUN1d3d2   = 0;
    dFUN1d3d3   = 0;
else
    dFUN1d1d1   = 0;
    dFUN1d2d1   = 0;
    dFUN1d2d2   = 0;
    dFUN1d3d1   = 0; 
    dFUN1d3d2   = 0;
    dFUN1d3d3   = 0;
end

if ind(3) == 1
    type = AD.fml.OBJEC_ADT;
    
    if type == 1
        FUN2            = sqrt((FPFX - X_GOAL + OBJEC_R*cos(FPFA))^2 + ...
                           (FPFY - Y_GOAL + OBJEC_R*sin(FPFA))^2);
        FUN2SQ          = FUN2^2;
        dFUN2d1         = (FPFX - X_GOAL + OBJEC_R*cos(FPFA))/FUN2;
        dFUN2d2         = (FPFY - Y_GOAL + OBJEC_R*sin(FPFA))/FUN2;
        TMP1            = -(FPFX - X_GOAL)*sin(FPFA) + (FPFY - Y_GOAL)*cos(FPFA);
        dFUN2d3         = OBJEC_R*TMP1/FUN2;

        dTMP1d1         = - sin(FPFA);
        dTMP1d2         = cos(FPFA);
        dTMP1d3         = - (FPFX - X_GOAL)*cos(FPFA) - (FPFY - Y_GOAL)*sin(FPFA);

        dFUN2d1d1       = (FUN2 - (FPFX - X_GOAL + OBJEC_R*cos(FPFA))*dFUN2d1)/FUN2SQ;
        dFUN2d2d1       = (     - (FPFY - Y_GOAL + OBJEC_R*sin(FPFA))*dFUN2d1)/FUN2SQ;
        dFUN2d2d2       = (FUN2 - (FPFY - Y_GOAL + OBJEC_R*sin(FPFA))*dFUN2d2)/FUN2SQ;
        dFUN2d3d1       = OBJEC_R*(dTMP1d1*FUN2 - TMP1*dFUN2d1)/FUN2SQ;
        dFUN2d3d2       = OBJEC_R*(dTMP1d2*FUN2 - TMP1*dFUN2d2)/FUN2SQ;
        dFUN2d3d3       = OBJEC_R*(dTMP1d3*FUN2 - TMP1*dFUN2d3)/FUN2SQ;
        
    elseif type == 2
        A2G             = atan2((Y_GOAL - FPFY), (X_GOAL - FPFX));
        
        TMP2            = (X_GOAL - FPFX)^2 + (Y_GOAL - FPFY)^2;
        dTMP2d1         = 2*(FPFX - X_GOAL);
        dTMP2d2         = 2*(FPFY - Y_GOAL);
        dA2Gd1          =   (Y_GOAL - FPFY)/TMP2;
        dA2Gd2          = - (X_GOAL - FPFX)/TMP2;
        ddA2Gd1d1       =   (     - (Y_GOAL - FPFY)*dTMP2d1)/TMP2^2;
        ddA2Gd2d1       = - (TMP2 - (X_GOAL - FPFX)*dTMP2d1)/TMP2^2;
        ddA2Gd2d2       = - (     - (X_GOAL - FPFX)*dTMP2d2)/TMP2^2;
        
        TMP1Y           = sin(FPFA - A2G);
        TMP1X           = cos(FPFA - A2G);
        TMP1            = atan2(TMP1Y, TMP1X);
        dTMP1d1         = - dA2Gd1;
        dTMP1d2         = - dA2Gd2;
        dTMP1d3         = 1;
        ddTMP1d1d1      = - ddA2Gd1d1;
        ddTMP1d2d1      = - ddA2Gd2d1;
        ddTMP1d2d2      = - ddA2Gd2d2;
        
        dFUN2d1d1       = 2*dTMP1d1*dTMP1d1 + 2*TMP1*ddTMP1d1d1;
        dFUN2d2d1       = 2*dTMP1d1*dTMP1d2 + 2*TMP1*ddTMP1d2d1;
        dFUN2d2d2       = 2*dTMP1d2*dTMP1d2 + 2*TMP1*ddTMP1d2d2;
        dFUN2d3d1       = 2*dTMP1d1*dTMP1d3;
        dFUN2d3d2       = 2*dTMP1d2*dTMP1d3;
        dFUN2d3d3       = 2*dTMP1d3*dTMP1d3;
        
    elseif type == 3   
        % HA_GOAL       = AD.fml.HA_GOAL;
        dTMP1d3         = 1;
        dFUN2d1d1       = 0;
        dFUN2d2d1       = 0;
        dFUN2d2d2       = 0;
        dFUN2d3d1       = 0; 
        dFUN2d3d2       = 0;
        dFUN2d3d3       = 2*dTMP1d3*dTMP1d3;
    end
else
    dFUN2d1d1   = 0;
    dFUN2d2d1   = 0;
    dFUN2d2d2   = 0;
    dFUN2d3d1   = 0; 
    dFUN2d3d2   = 0;
    dFUN2d3d3   = 0;
end

VALUE_HES_OBJEC(1) = OBJEC_W1*dFUN1d1d1 + OBJEC_W2*dFUN2d1d1;
VALUE_HES_OBJEC(2) = OBJEC_W1*dFUN1d2d1 + OBJEC_W2*dFUN2d2d1;
VALUE_HES_OBJEC(3) = OBJEC_W1*dFUN1d2d2 + OBJEC_W2*dFUN2d2d2;
VALUE_HES_OBJEC(4) = OBJEC_W1*dFUN1d3d1 + OBJEC_W2*dFUN2d3d1;
VALUE_HES_OBJEC(5) = OBJEC_W1*dFUN1d3d2 + OBJEC_W2*dFUN2d3d2;
VALUE_HES_OBJEC(6) = OBJEC_W1*dFUN1d3d3 + OBJEC_W2*dFUN2d3d3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%