function OPTSOL = OPTSOL_INTERP_3DOF(VCS, SOL)

NPH                 = length(SOL.PHASE);
NSOL                = zeros(1, NPH);

for IdxPH = 1:NPH
    NSOL(IdxPH)     = length(SOL.PHASE(IdxPH).TM);
end

NSUM                = sum(NSOL);
OPTTM               = zeros(NSUM - (NPH-1), 1);
OPTXL               = zeros(NSUM - (NPH-1), 1);   % optimal x in local coordinates
OPTYL               = zeros(NSUM - (NPH-1), 1);   % optimal y in local coordinates
OPTAL               = zeros(NSUM - (NPH-1), 1);   % optimal psi in local coordinates
OPTSA               = zeros(NSUM - (NPH-1), 1);
OPTUX               = zeros(NSUM - (NPH-1), 1);
OPTSR               = zeros(NSUM - (NPH-1), 1);
OPTAX               = zeros(NSUM - (NPH-1), 1);

SI                  = 0;
IdxPH               = 1;
SEQ                 = SI + 1:SI + NSOL(IdxPH);
OPTTM(SEQ)          = SOL.PHASE(IdxPH).TM;
OPTXL(SEQ)          = SOL.PHASE(IdxPH).ST(:,1);
OPTYL(SEQ)          = SOL.PHASE(IdxPH).ST(:,2);
OPTAL(SEQ)          = SOL.PHASE(IdxPH).ST(:,6);
OPTSA(SEQ)          = SOL.PHASE(IdxPH).ST(:,5);
OPTUX(SEQ)          = SOL.PHASE(IdxPH).ST(:,7);
OPTSR(SEQ)          = SOL.PHASE(IdxPH).CT(:,1);
OPTAX(SEQ)          = SOL.PHASE(IdxPH).CT(:,2);
SI                  = SI + NSOL(IdxPH);

if NPH >= 2
    for IdxPH = 2:NPH
        SEQ         = SI + 1:SI + NSOL(IdxPH) - 1;
        OPTTM(SEQ)  = SOL.PHASE(IdxPH).TM(2:end);
        OPTXL(SEQ)  = SOL.PHASE(IdxPH).ST(2:end,1);
        OPTYL(SEQ)  = SOL.PHASE(IdxPH).ST(2:end,2);
        OPTAL(SEQ)  = SOL.PHASE(IdxPH).ST(2:end,6);
        OPTSA(SEQ)  = SOL.PHASE(IdxPH).ST(2:end,5);
        OPTUX(SEQ)  = SOL.PHASE(IdxPH).ST(2:end,7);
        OPTSR(SEQ)  = SOL.PHASE(IdxPH).CT(2:end,1);
        OPTAX(SEQ)  = SOL.PHASE(IdxPH).CT(2:end,2);
        SI          = SI + NSOL(IdxPH) - 1;
    end
end

% coordinate transformation
TRAJ                = ([OPTXL, OPTYL])*VCS.RM_L2G;
OPTX                = TRAJ(:,1) + VCS.VP(1);
OPTY                = TRAJ(:,2) + VCS.VP(2);
OPTA                = OPTAL + VCS.HA - pi/2;

OPTSOL.NSOL         = NSOL;
OPTSOL.OPTXL        = OPTXL;
OPTSOL.OPTYL        = OPTYL;
OPTSOL.OPTTM        = OPTTM';
OPTSOL.OPTX         = OPTX';
OPTSOL.OPTY         = OPTY';
OPTSOL.OPTA         = OPTA';
OPTSOL.OPTSA        = OPTSA';
OPTSOL.OPTUX        = OPTUX';
OPTSOL.OPTSR        = OPTSR';
OPTSOL.OPTAX        = OPTAX';
OPTSOL.X_END        = OPTX(end);
OPTSOL.Y_END        = OPTY(end);
OPTSOL.A_END        = OPTA(end);
OPTSOL.D_END        = norm(VCS.VP_GOAL_LOCAL - [OPTXL(end), OPTYL(end)]);
OPTSOL.A2GOAL       = atan2((VCS.VP_GOAL_LOCAL(2) - OPTYL(end)), ...
                            (VCS.VP_GOAL_LOCAL(1) - OPTXL(end)));
OPTSOL.A2GOAL       = mod(OPTSOL.A2GOAL + VCS.HA - pi/2, 2*pi);
OPTSOL.A_DIFF       = mod(OPTSOL.A_END - OPTSOL.A2GOAL, 2*pi);
if OPTSOL.A_DIFF > pi
    OPTSOL.A_DIFF   = 2*pi - OPTSOL.A_DIFF;
end
OPTSOL.TRAJECTORY   = [OPTSOL.OPTX', OPTSOL.OPTY'];
