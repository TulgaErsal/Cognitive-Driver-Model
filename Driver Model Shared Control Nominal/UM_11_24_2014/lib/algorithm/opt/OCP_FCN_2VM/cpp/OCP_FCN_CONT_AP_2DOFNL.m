function VALUE_FCN_CONT = OCP_FCN_CONT_AP_2DOFNL(INPUT)

NPH         = INPUT.AUXDATA.num.NPH;
FML         = INPUT.AUXDATA.fml;

PSI0        = FML.PSI0;
REF_LINE	= FML.REF_LINE;
INTG_W      = FML.INTG_W;

VALUE_FCN_CONT(NPH).DYNA = [];

for IdxPH = 1:NPH
    [~, X, Y, V, R, SA, PSI, SR]    = OCP_VEHICLE_STATE(INPUT.PHASE(IdxPH));

    [Xdot, Ydot, Vdot, Rdot, Ddot, Pdot] = OCP_FCN_CONT_DYNAMICS_2DOFNL(V, R, PSI, SA, SR, INPUT.AUXDATA.veh.U0);
    VALUE_FCN_CONT(IdxPH).DYNA      = [Xdot, Ydot, Vdot, Rdot, Ddot, Pdot];
    
    PATH_IND                        = FML.PATH_IND(IdxPH,:);
    PTS                             = FML.LINE_PTS(IdxPH).PTS;
    if isempty(PTS)
        PTS                         = nan*zeros(1, 4);
    end
    
    VALUE_FCN_CONT(IdxPH).PATH      = OCP_FCN_CONT_PATH_2DOF(X, Y, V, R, SA, PATH_IND, PTS, IdxPH, PSI0);

    VALUE_FCN_CONT(IdxPH).INTG      = OCP_FCN_CONT_INTG_2DOF(X, Y, SA, SR, INTG_W, REF_LINE);

end