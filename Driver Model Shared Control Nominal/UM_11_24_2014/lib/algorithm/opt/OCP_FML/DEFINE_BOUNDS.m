function BOUNDS = DEFINE_BOUNDS(INPUT, AUXDATA)

for IdxPH = 1:INPUT.NPH
    % initial time, lower bound
    BOUNDS.PH(IdxPH).IT.LB	= INPUT.ITLB(IdxPH);  
    % initial time, upper bound
    BOUNDS.PH(IdxPH).IT.UB	= INPUT.ITUB(IdxPH);
    % final time, lower bound
    BOUNDS.PH(IdxPH).FT.LB	= INPUT.FTLB(IdxPH);
    % final time, upper bound
    BOUNDS.PH(IdxPH).FT.UB	= INPUT.FTUB(IdxPH);
    
    % initial states, lower bound
    BOUNDS.PH(IdxPH).IS.LB 	= INPUT.ISLB(IdxPH, :);
    % initial states, upper bound
    BOUNDS.PH(IdxPH).IS.UB 	= INPUT.ISUB(IdxPH, :);
    % states, lower bound
    BOUNDS.PH(IdxPH).ST.LB 	= INPUT.STLB(IdxPH, :);
    % states, upper bound
    BOUNDS.PH(IdxPH).ST.UB 	= INPUT.STUB(IdxPH, :);
    % final states, lower bound
    BOUNDS.PH(IdxPH).FS.LB 	= INPUT.FSLB(IdxPH, :);
    % final states, upper bound
    BOUNDS.PH(IdxPH).FS.UB 	= INPUT.FSUB(IdxPH, :);
    
    % controls, lower bound
    BOUNDS.PH(IdxPH).CT.LB 	= INPUT.CTLB(IdxPH, :);
    % controls, upper bound
    BOUNDS.PH(IdxPH).CT.UB 	= INPUT.CTUB(IdxPH, :);
    
    % integral, lower bound
    BOUNDS.PH(IdxPH).IN.LB 	= INPUT.INLB(IdxPH);
    % integral, upper bound
    BOUNDS.PH(IdxPH).IN.UB 	= INPUT.INUB(IdxPH);
    
    % path, lower bound
    BOUNDS.PH(IdxPH).PT.LB 	= INPUT.PTLB(IdxPH).LB;
    % path, upper bound
    BOUNDS.PH(IdxPH).PT.UB 	= INPUT.PTUB(IdxPH).UB;
end

% duration
BOUNDS.PH(INPUT.NPH).DU    	= [];

% event groups
NST                         = AUXDATA.num.NST;
for IdxEG = 1:INPUT.NPH - 1
    BOUNDS.EG(IdxEG).LB     = zeros(1, NST(IdxEG + 1) + 1);
    BOUNDS.EG(IdxEG).UB 	= zeros(1, NST(IdxEG + 1) + 1);
end

NEG                         = AUXDATA.num.NEG;
if NEG == INPUT.NPH
    BOUNDS.EG(INPUT.NPH).LB = INPUT.EVLB;
    BOUNDS.EG(INPUT.NPH).UB = INPUT.EVUB;
end