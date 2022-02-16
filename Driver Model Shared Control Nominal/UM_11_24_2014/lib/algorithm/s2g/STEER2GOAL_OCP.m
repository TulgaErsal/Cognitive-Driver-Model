function INPUT = STEER2GOAL_OCP(PARA, VCS, S2G)

% number of phases
NPH                     = S2G.NPH;

% objective function
OBJEC_IND.ITG           = 1; 
OBJEC_IND.D2G           = S2G.OBJEC_D2G;
OBJEC_IND.FAD           = S2G.OBJEC_FAD;
OBJEC_IND.ADT           = S2G.OBJEC_ADT;
OBJEC_IND.FTM           = S2G.OBJEC_FTM;

% weights
WEIGHTS.SASQ          	= S2G.WEIGHTS(1);
WEIGHTS.UXSQ           	= S2G.WEIGHTS(2);
WEIGHTS.SRSQ            = S2G.WEIGHTS(3);
WEIGHTS.AXSQ            = S2G.WEIGHTS(4);

WEIGHTS.D2G             = S2G.WEIGHTS(5);
WEIGHTS.FAD             = S2G.WEIGHTS(6);
WEIGHTS.FTM             = S2G.WEIGHTS(7);

% additional termin in objective function for final heading angle requirement
G_A                     = VCS.HA_GOAL_LOCAL;
G_P                     = VCS.VP_GOAL_LOCAL;
if ~isempty(G_A)
    WEIGHTS.DIST      	= 1e-4; %#THLD#
    % coefficients of the reference line
    LC1                 =   sin(G_A);
    LC2                 = - cos(G_A);
    LC3                 = - LC1*G_P(1) - LC2*G_P(2);
    REF_LINE            = [LC1, LC2, LC3];
else
    WEIGHTS.DIST        = 0;
    REF_LINE            = [0,0,0];
end

% path constraints: preallocation
PATH_IND                = zeros(NPH, 5);
PTLB(NPH).LB            = [];
PTUB(NPH).UB            = [];
% LINE_PTS(NPH).PTS   	= [];

% event constraints: preallocation
EVENT_IND            	= zeros(1, 3);
EVLB                    = [];
EVUB                    = [];

if PARA.MODE == ConstantSpeed
    MODEL               = 2;
    
    % dynamic steering angle limits
    PATH_IND(:,1)   	= 1;
    PTLB(1).LB(1)      	= -inf;
    PTUB(1).UB(1)     	= inf;
    
    % state sequence: x, y, v, r, deltaf, psi
    % phase 1 initial states
    P1IS              	= [0, 0, VCS.V0, VCS.R0, VCS.SA0, pi/2];
    
    % states lower bounds
    STLB            	= - LARGE_NUM*ones(1, 6);
    STLB(5)           	= PARA.SA_MIN;
    % STLB(1)        	= VCS.XLB;
    % STLB(2)        	= VCS.YLB;
    % STLB(3)          	= VCS.VLB;
    % STLB(4)          	= VCS.RLB;
    % STLB(6)         	= VCS.PLB;
    
    % states upper bounds
    STUB             	= LARGE_NUM*ones(1, 6);
    STUB(5)           	= PARA.SA_MAX;
    % STUB(1)          	= VCS.XUB;
    % STUB(2)          	= VCS.YUB;
    % STUB(3)         	= VCS.VUB;
    % STUB(4)          	= VCS.RUB;
    % STUB(6)          	= VCS.PUB;
    
    % control sequence: deltaf_dot
    % controls lower bounds
    CTLB              	= PARA.SR_SYS_MIN;
    % controls upper bounds
    CTUB              	= PARA.SR_SYS_MAX;
    
    INPUT.U0         	= PARA.U_INIT;
    INPUT.SA_MAX      	= PARA.SA_MAX;
    
elseif PARA.MODE == VariableSpeed
    MODEL             	= 3;
    
    PATH_IND(:,1)      	= 1; % dynamic steering angle limits
    PTLB(1).LB(1)      	= 0;
    PTUB(1).UB(1)     	= LARGE_NUM;
    
    % state sequence: x, y, v, r, deltaf, psi, u
    % phase 1 initial states
    P1IS               	= [0, 0, VCS.V0, VCS.R0, VCS.SA0, pi/2, VCS.U0];
    
    % states lower bounds
    STLB               	= - LARGE_NUM*ones(1, 7);
    STLB(5)            	= PARA.SA_SYS_MIN;
    STLB(7)           	= PARA.U_MIN;
    
    % states upper bounds
    STUB              	= LARGE_NUM*ones(1, 7);
    STUB(5)           	= PARA.SA_SYS_MAX;
    STUB(7)           	= PARA.U_MAX;
    
    % control sequence: deltaf_dot, ax
    % controls lower bounds
    CTLB              	= [PARA.SR_SYS_MIN, PARA.AX_MIN ];
    % controls upper bounds
    CTUB             	= [PARA.SR_SYS_MAX, PARA.AX_MAX ];
end

FSLB                    = STLB;
FSUB                    = STUB;

if ~isempty(S2G.FXLB)
    FSLB(1)             = S2G.FXLB;
    FSUB(1)            	= S2G.FXUB;
    
    FSLB(2)           	= S2G.FYLB;
    FSUB(2)            	= S2G.FYUB;
end

if ~isempty(S2G.FSALB)
    FSLB(5)            	= S2G.FSALB;
    FSUB(5)            	= S2G.FSAUB;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
INPUT.NAME             	= S2G.NAME;

INPUT.MODEL             = MODEL;
INPUT.NPH             	= NPH;

INPUT.XY_GOAL         	= VCS.VP_GOAL_LOCAL;
INPUT.HA_GOAL         	= VCS.HA_GOAL_LOCAL;

INPUT.OBJEC_IND      	= OBJEC_IND;
INPUT.WEIGHTS         	= WEIGHTS;
INPUT.REF_LINE          = REF_LINE;

INPUT.PATH_IND        	= PATH_IND;
INPUT.LINE_PTS(NPH).PTS = [];

INPUT.EVENT_IND        	= EVENT_IND;

INPUT.ITLB             	= 0;  
INPUT.ITUB             	= 0;
INPUT.FTLB            	= S2G.FTLB;
INPUT.FTUB             	= S2G.FTUB;

INPUT.ISLB            	= P1IS;
INPUT.ISUB            	= P1IS;
INPUT.STLB            	= STLB;
INPUT.STUB             	= STUB;
INPUT.FSLB            	= FSLB;
INPUT.FSUB             	= FSUB;

INPUT.CTLB           	= CTLB;
INPUT.CTUB             	= CTUB;

INPUT.INLB             	= 0*ones(1, NPH);
INPUT.INUB            	= LARGE_NUM*ones(1, NPH);

INPUT.PTLB             	= PTLB;
INPUT.PTUB            	= PTUB;

INPUT.EVLB           	= EVLB;
INPUT.EVUB          	= EVUB;