function VALUE_GRD_CONT = OCP_GRD_CONT_AP_2DOFNL(INPUT)

NPH         = INPUT.AUXDATA.num.NPH;
FML         = INPUT.AUXDATA.fml;

REF_LINE    = FML.REF_LINE;
INTG_W      = FML.INTG_W;

VALUE_GRD_CONT(NPH).DYNA = [];

for IdxPH = 1:NPH
    [~, X, Y, V, R, SA, PSI, SR]    = OCP_VEHICLE_STATE(INPUT.PHASE(IdxPH));
    
    [dot01, dot02, dot03, dot04, dot05, dot06, dot07, ...
     dot08, dot09, dot10, dot11, dot12, dot13, dot14] = ...
        OCP_GRD_CONT_DYNAMICS_2DOFNL(V, R, PSI, SA, INPUT.AUXDATA.veh.U0);
    
    VALUE_GRD_CONT(IdxPH).DYNA      = [dot01, dot02, dot03, dot04, dot05, dot06, dot07, ...
                                       dot08, dot09, dot10, dot11, dot12, dot13, dot14];

    PATH_IND                        = FML.PATH_IND(IdxPH,:);
    PTS                             = FML.LINE_PTS(IdxPH).PTS;
    if isempty(PTS)
        PTS                         = nan*zeros(1, 4);
    end
    
    VALUE_GRD_CONT(IdxPH).PATH      = OCP_GRD_CONT_PATH_2DOF(X, Y, V, R, SA, PATH_IND, PTS);

    VALUE_GRD_CONT(IdxPH).INTG      = OCP_GRD_CONT_INTG_2DOF(X, Y, SA, SR, INTG_W, REF_LINE);
end