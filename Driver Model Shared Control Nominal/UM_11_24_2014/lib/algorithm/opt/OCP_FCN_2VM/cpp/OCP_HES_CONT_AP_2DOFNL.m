function VALUE_HES_CONT = OCP_HES_CONT_AP_2DOFNL(INPUT)

NPH         = INPUT.AUXDATA.num.NPH;
FML         = INPUT.AUXDATA.fml;

REF_LINE	= FML.REF_LINE;
INTG_W      = FML.INTG_W;

VALUE_HES_CONT(NPH).DYNA = [];

for IdxPH = 1:NPH
    [~, X, Y, V, R, SA, PSI, SR]    = OCP_VEHICLE_STATE(INPUT.PHASE(IdxPH));
    
    [dot01, dot02, dot03, dot04, dot05, dot06, dot07, ...
     dot08, dot09, dot10, dot11, dot12, dot13, dot14, ...
     dot15, dot16, dot17, dot18]    = OCP_HES_CONT_DYNAMICS_2DOFNL(V, R, PSI, SA, INPUT.AUXDATA.veh.U0);
 
    VALUE_HES_CONT(IdxPH).DYNA      = [dot01, dot02, dot03, dot04, dot05, dot06, dot07, ...
                                       dot08, dot09, dot10, dot11, dot12, dot13, dot14, ...
                                       dot15, dot16, dot17, dot18];
    
    PATH_IND                        = FML.PATH_IND(IdxPH,:);
    
    VALUE_HES_CONT(IdxPH).PATH      = OCP_HES_CONT_PATH_2DOF(X, Y, V, R, SA, PATH_IND);

    VALUE_HES_CONT(IdxPH).INTG      = OCP_HES_CONT_INTG_2DOF(X, Y, SA, SR, INTG_W, REF_LINE);
end