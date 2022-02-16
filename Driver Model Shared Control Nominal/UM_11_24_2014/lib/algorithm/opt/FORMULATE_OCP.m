function INPUT = FORMULATE_OCP(PARA, VCS, OCP, ~)
% function INPUT = FORMULATE_OCP(PARA, VIS, OCP, SIM)

NPH = OCP.PhaseNum;

%% objective function
OBJEC_IND.ITG     	= 1; 
OBJEC_IND.D2G   	= 1;
OBJEC_IND.FAD       = 1;
OBJEC_IND.FTM   	= 0;

OBJEC_IND.ADT    	= 2;
% Double Lane Change Simulation Settings
if isfield(PARA, 'DLC')
    OBJEC_IND.ADT  = 3;
end

WEIGHTS.D2G         = 1/VCS.DIST2GOAL;
WEIGHTS.FAD         = 1;
WEIGHTS.FTM         = 0;

WEIGHTS.SASQ      	= 1;
WEIGHTS.UXSQ        = 0;
WEIGHTS.SRSQ     	= 10;
WEIGHTS.AXSQ     	= 0;

WEIGHTS.DIST      	= 0;

G_A                 = OCP.HATarget;
G_P                 = OCP.VPTarget;

if ~isempty(G_A)
    LC1             = sin(G_A);
    LC2             = - cos(G_A);
    LC3             = - LC1*G_P(1) - LC2*G_P(2);
    REF_LINE        = [LC1, LC2, LC3];
else
    REF_LINE        = [0,0,0];
end

%% paths: 
% preallocation
PATH_IND                = zeros(NPH, 5);
PTLB(NPH).LB            = [];
PTUB(NPH).UB            = [];
LINE_PTS(NPH).PTS       = [];

% dynamic steering angle limits
for i = 1:NPH
    if PARA.MODE == ConstantSpeed
        PATH_IND(i,1) 	= 1;
        PTLB(i).LB(1) 	= -inf;
        PTUB(i).UB(1) 	= inf;
    elseif PARA.MODE == VariableSpeed
        PATH_IND(i,1) 	= 1;
        PTLB(i).LB(1) 	= 0;
        PTUB(i).UB(1)  	= inf;
    end
end

%% paths - polar basic
if OCP.OCPType == 1
    for i = 1:NPH
        if      OCP.SecType(i) == 1
            PATH_IND(i,5) 	= 3;
            
            LINE_PTS(i).PTS = [ OCP.Points(i, 1:2), OCP.Points(i, 5:6);
                                OCP.Points(i, 3:4), OCP.Points(i, 5:6);
                                OCP.Points(i, 1:2), OCP.Points(i, 3:4) ];

            CX              = sum(OCP.Points(i, [1,3,5]))/3;
            CY              = sum(OCP.Points(i, [2,4,6]))/3;

            [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(1,:));   
            PTLB(i).LB(2) 	= LB;
            PTUB(i).UB(2)  	= UB;
            
            [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(2,:));   
            PTLB(i).LB(3) 	= LB;
            PTUB(i).UB(3)  	= UB;
            
            [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(3,:));   
            PTLB(i).LB(4) 	= LB;
            PTUB(i).UB(4)  	= UB;

        elseif  OCP.SecType(i) == -1
            PATH_IND(i,5) 	= 2;

            LINE_PTS(i).PTS = [ OCP.Points(i, 1:2), OCP.Points(i, 5:6);
                                OCP.Points(i, 3:4), OCP.Points(i, 5:6) ];

            CX              = sum(OCP.Points(i, [1,3,5]))/3;
            CY              = sum(OCP.Points(i, [2,4,6]))/3;

            [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(1,:));   
            PTLB(i).LB(2) 	= LB;
            PTUB(i).UB(2)  	= UB;
            
            [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(2,:));   
            PTLB(i).LB(3) 	= LB;
            PTUB(i).UB(3)  	= UB;
        end
    end
end
   
%% paths - phase1
if OCP.OCPType == 2
    % angle limits in polar coordinates
    PATH_IND(1,2)           = 1;
    PTLB(1).LB(2)           = OCP.P1_Angle(1);
    PTUB(1).UB(2)           = OCP.P1_Angle(2);
    
    % radius limits in polar coordinates
    PATH_IND(1,3)           = 1; 
    PTLB(1).LB(3)           = 0;
    PTUB(1).UB(3)           = OCP.P1_Radius;
    
    for i = 2:NPH
        % radius limits in polar coordinates
        PATH_IND(i,3)      	= 1;
        PTLB(i).LB(2)   	= OCP.P1_Radius;
        PTUB(i).UB(2)      	= inf;

        if      OCP.SecType(i-1) == 1
            PATH_IND(i,5) 	= 3;
            
            LINE_PTS(i).PTS = [ OCP.Points(i-1, 1:2), OCP.Points(i-1, 5:6);
                                OCP.Points(i-1, 3:4), OCP.Points(i-1, 5:6);
                                OCP.Points(i-1, 1:2), OCP.Points(i-1, 3:4) ];

            CX              = sum(OCP.Points(i-1, [1,3,5]))/3;
            CY              = sum(OCP.Points(i-1, [2,4,6]))/3;

            [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(1,:));   
            PTLB(i).LB(3) 	= LB;
            PTUB(i).UB(3)  	= UB;
            
            [LB, UB] = EVAL(CX, CY, LINE_PTS(i).PTS(2,:));   
            PTLB(i).LB(4) 	= LB;
            PTUB(i).UB(4)  	= UB;
            
            [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(3,:));   
            PTLB(i).LB(5) 	= LB;
            PTUB(i).UB(5)  	= UB;

        elseif  OCP.SecType(i-1) == -1
            PATH_IND(i,5) 	= 2;

            LINE_PTS(i).PTS = [ OCP.Points(i-1, 1:2), OCP.Points(i-1, 5:6);
                                OCP.Points(i-1, 3:4), OCP.Points(i-1, 5:6) ];

            CX              = sum(OCP.Points(i-1, [1,3,5]))/3;
            CY              = sum(OCP.Points(i-1, [2,4,6]))/3;

            [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(1,:));   
            PTLB(i).LB(3) 	= LB;
            PTUB(i).UB(3)  	= UB;
            
            [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(2,:));   
            PTLB(i).LB(4) 	= LB;
            PTUB(i).UB(4)  	= UB;
        end
    end
end

%% paths - hypothetical opening
if OCP.OCPType == 3
    for i = 1:NPH
        PATH_IND(i,5) 	= 3;

        LINE_PTS(i).PTS = [ OCP.Points(i, 1:2), OCP.Points(i, 5:6);
                            OCP.Points(i, 3:4), OCP.Points(i, 5:6);
                            OCP.Points(i, 1:2), OCP.Points(i, 3:4) ];

        CX              = sum(OCP.Points(i, [1,3,5]))/3;
        CY              = sum(OCP.Points(i, [2,4,6]))/3;

        [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(1,:));   
        PTLB(i).LB(2) 	= LB;
        PTUB(i).UB(2)  	= UB;

        [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(2,:));   
        PTLB(i).LB(3) 	= LB;
        PTUB(i).UB(3)  	= UB;

        [LB, UB]        = EVAL(CX, CY, LINE_PTS(i).PTS(3,:));   
        PTLB(i).LB(4) 	= LB;
        PTUB(i).UB(4)  	= UB;
    end
end

%% paths - convex
if OCP.OCPType == 4
    
    OP_I1           = OCP.OPVertIDX(2);
    OP_I2           = OCP.OPVertIDX(3);
    
    S_I1            = 1;
    S_I2            = length(OCP.Points(:, 1));
    
    OP_A1           = atan2(OCP.Points(OP_I1, 2), OCP.Points(OP_I1, 1));
    OP_A2           = atan2(OCP.Points(OP_I2, 2), OCP.Points(OP_I2, 1));
    
    OCP.EVLB        = min([OP_A1, OP_A2]);
    OCP.EVUB        = max([OP_A1, OP_A2]);
    OCP.REF_PT      = [0, 0];
    
    if DEBUG == 1
        figure
        hold on;
    end

    for i = 1:NPH
      	CNT = 0;
        
        VS = OCP.Indexes(OCP.PolySeq(i));
        VS = VS{1};
        
        for j = 1:length(VS) - 1
            if (VS(j) == OP_I1 && VS(j+1) == OP_I2) || (VS(j) == OP_I2 && VS(j+1) == OP_I1) || ...
               (VS(j) == S_I1 && VS(j+1) == S_I2) || (VS(j) == S_I2 && VS(j+1) == S_I1) 
            else
                CNT = CNT + 1;
                LINE_PTS(i).PTS(CNT,:) = [OCP.Points(VS(j), :), OCP.Points(VS(j+1), :)];
            end
        end
        
        if (VS(end) == OP_I1 && VS(1) == OP_I2) || (VS(end) == OP_I2 && VS(1) == OP_I1) || ...
           (VS(end) == S_I1 && VS(1) == S_I2) || (VS(end) == S_I2 && VS(1) == S_I1) 
        else
            CNT = CNT + 1;
            LINE_PTS(i).PTS(CNT,:) = [OCP.Points(VS(end), :), OCP.Points(VS(1), :)];
        end
        
        PATH_IND(i,5) 	= length(LINE_PTS(i).PTS(:, 1));
        
        CX = sum(OCP.Points(VS, 1))/length(VS);
        CY = sum(OCP.Points(VS, 2))/length(VS);

        for j = 1:PATH_IND(i,5)
            [LC2, UB] = EVAL(CX, CY, LINE_PTS(i).PTS(j,:));   
            PTLB(i).LB(j+1) 	= LC2;
            PTUB(i).UB(j+1)  	= UB;
        end
        
        if DEBUG == 1
            for j = 1:PATH_IND(i,5)
                plot([LINE_PTS(i).PTS(j, 1), LINE_PTS(i).PTS(j, 3)], ...
                     [LINE_PTS(i).PTS(j, 2), LINE_PTS(i).PTS(j, 4)], 'k')
            end
            plot(CX, CY, 'ro')
        end
    end
end

%% paths - convex
if OCP.OCPType == 5
    
    OP_I1 = OCP.OPVertIDX(2);
    OP_I2 = OCP.OPVertIDX(3);

    OP_PT1 = OCP.Points(OP_I1, :);
    OP_PT2 = OCP.Points(OP_I2, :);
    
    % ANGLE = atan2(OP_PT2(2) - OP_PT1(2), OP_PT2(1) - OP_PT1(1));
    % 
    % OCP.EVLB  	= [0,                     ANGLE];
    % OCP.EVUB   	= [norm(OP_PT2 - OP_PT1), ANGLE];
    % OCP.REF_PT 	= OP_PT1;
    
    ANGLE = atan2(OP_PT1(2) - OP_PT2(2), OP_PT1(1) - OP_PT2(1));

    OCP.EVLB     	= [0,                     ANGLE];
    OCP.EVUB     	= [norm(OP_PT1 - OP_PT2), ANGLE];
    OCP.REF_PT 	= OP_PT2;
    
    S_I1  = 1;
    S_I2  = length(OCP.Points(:, 1));
    
    if DEBUG == 1
        figure
        hold on;
        PT1 = OCP.REF_PT;
        PT2 = PT1 + OCP.EVUB(1)*[cos(OCP.EVUB(2)), sin(OCP.EVUB(2))];
        plot([PT1(1), PT2(1)], [PT1(2), PT2(2)], 'k', 'LineWidth', 3)
        plot([PT1(1), PT2(1)], [PT1(2), PT2(2)], 'r--', 'LineWidth', 2)
    end

    for i = 1:NPH
      	CNT = 0;
        
        VS = OCP.Indexes(OCP.PolySeq(i));
        VS = VS{1};
        
        for j = 1:length(VS) - 1
            if (VS(j) == S_I1 && VS(j+1) == S_I2) || (VS(j) == S_I2 && VS(j+1) == S_I1) 
            else
                CNT = CNT + 1;
                LINE_PTS(i).PTS(CNT,:) = [OCP.Points(VS(j), :), OCP.Points(VS(j+1), :)];
            end
        end
        
        if (VS(end) == S_I1 && VS(1) == S_I2) || (VS(end) == S_I2 && VS(1) == S_I1) 
        else
            CNT = CNT + 1;
            LINE_PTS(i).PTS(CNT,:) = [OCP.Points(VS(end), :), OCP.Points(VS(1), :)];
        end
        
        PATH_IND(i,5) 	= length(LINE_PTS(i).PTS(:, 1));
        
        CX = sum(OCP.Points(VS, 1))/length(VS);
        CY = sum(OCP.Points(VS, 2))/length(VS);

        for j = 1:PATH_IND(i,5)
            [LC2, UB] = EVAL(CX, CY, LINE_PTS(i).PTS(j,:));   
            PTLB(i).LB(j+1) 	= LC2;
            PTUB(i).UB(j+1)  	= UB;
        end
        
        if DEBUG == 1
            for j = 1:PATH_IND(i,5)
                plot([LINE_PTS(i).PTS(j, 1), LINE_PTS(i).PTS(j, 3)], ...
                     [LINE_PTS(i).PTS(j, 2), LINE_PTS(i).PTS(j, 4)], 'k')
            end
            plot(CX, CY, 'ro')
        end
    end
end

%% events
% preallocation
EVENT_IND           = zeros(1, 3);
EVLB                = [];
EVUB                = [];
REF_PT              = [];

if OCP.OCPType == 3
    EVENT_IND(1)    = 1;
    EVENT_IND(2)    = 1;
    EVLB            = OCP.EVLB;
    EVUB            = OCP.EVUB;
    REF_PT          = OCP.REF_PT;
elseif OCP.OCPType == 4
    EVENT_IND(2)    = 1;
    EVLB            = OCP.EVLB;
    EVUB            = OCP.EVUB;
    REF_PT          = OCP.REF_PT;
elseif OCP.OCPType == 5
    EVENT_IND(1)    = 1;
    EVENT_IND(2)    = 1;
    EVLB            = OCP.EVLB;
    EVUB            = OCP.EVUB;
    REF_PT          = OCP.REF_PT;
end

%% state and control variables
if PARA.MODE == ConstantSpeed
    MODEL       = 2;
    
    % state sequence: x, y, v, r, deltaf, psi
    % phase 1 initial states
    P1IS        = [0, 0, VCS.V0, VCS.R0, VCS.SA0, pi/2];
    % states lower bounds
    STLB        = - inf*ones(1, 6);
    STLB(5)     = PARA.SA_MIN;
    % states upper bounds
    STUB        = inf*ones(1, 6);
    STUB(5)     = PARA.SA_MAX;
    
    % control sequence: deltaf_dot
    % controls lower bounds
    CTLB        = PARA.SR_SYS_MIN;
    % controls upper bounds
    CTUB        = PARA.SR_SYS_MAX;
    
    INPUT.U0	= PARA.U_INIT;
    
elseif PARA.MODE == VariableSpeed
    MODEL       = 3;
    
    % state sequence: x, y, v, r, deltaf, psi, u
    % phase 1 initial states
    P1IS        = [0, 0, VCS.V0, VCS.R0, VCS.SA0, pi/2, VCS.U0];
    % states lower bounds
    STLB        = - inf*ones(1, 7);
    STLB(5)     = PARA.SA_SYS_MIN;
    STLB(7)     = PARA.U_MIN;
    % states upper bounds
    STUB        = inf*ones(1, 7);
    STUB(5)     = PARA.SA_SYS_MAX;
    STUB(7)     = PARA.U_MAX;
    
    % control sequence: deltaf_dot, ax
    % controls lower bounds
    CTLB        = [PARA.SR_SYS_MIN, PARA.AX_MIN ];
    % controls upper bounds
    CTUB        = [PARA.SR_SYS_MAX, PARA.AX_MAX ];
end

ISLB_NPH        = repmat(STLB, NPH, 1);
ISUB_NPH        = repmat(STUB, NPH, 1);
STLB_NPH        = repmat(STLB, NPH, 1);
STUB_NPH        = repmat(STUB, NPH, 1);
FSLB_NPH        = repmat(STLB, NPH, 1);
FSUB_NPH        = repmat(STUB, NPH, 1);
CTLB_NPH        = repmat(CTLB, NPH, 1);
CTUB_NPH        = repmat(CTUB, NPH, 1);
ISLB_NPH(1,:)	= P1IS;
ISUB_NPH(1,:)	= P1IS;

%% time
ITLB_NPH            = zeros(1, NPH);
ITUB_NPH            = zeros(1, NPH);
FTLB_NPH            = zeros(1, NPH);
FTUB_NPH            = zeros(1, NPH);

for i = 1:NPH
    TS = 0.01;
    ITLB_NPH(i)     = (i-1)*TS; 
    ITUB_NPH(i)     = PARA.PLANNING_TIME - (NPH - i + 1)*TS; 
    FTLB_NPH(i)     = i*TS; 
    FTUB_NPH(i)     = PARA.PLANNING_TIME - (NPH - i)*TS; 
end

ITLB_NPH(1)         = 0;
ITUB_NPH(1)         = 0;

FTUB_NPH(NPH)       = PARA.PLANNING_TIME;

if (OCP.OCPType == 1 || OCP.OCPType == 2 || OCP.OCPType == 4) && ...
    VCS.DIST2GOAL > PARA.PLANNING_DIST
    FTLB_NPH(NPH)	= PARA.PLANNING_TIME;
end

%% 
INPUT.NAME             	= 'OCP';
INPUT.NPH             	= NPH;
INPUT.XY_GOAL         	= G_P;
INPUT.HA_GOAL         	= G_A;

INPUT.OBJEC_IND      	= OBJEC_IND;
INPUT.WEIGHTS         	= WEIGHTS;
INPUT.REF_LINE          = REF_LINE;

INPUT.PATH_IND        	= PATH_IND;
INPUT.LINE_PTS          = LINE_PTS;

INPUT.EVENT_IND        	= EVENT_IND;
INPUT.REF_PT            = REF_PT;

INPUT.ITLB             	= ITLB_NPH;  
INPUT.ITUB             	= ITUB_NPH;
INPUT.FTLB            	= FTLB_NPH;
INPUT.FTUB             	= FTUB_NPH;
INPUT.ISLB            	= ISLB_NPH;
INPUT.ISUB            	= ISUB_NPH;
INPUT.STLB            	= STLB_NPH;
INPUT.STUB             	= STUB_NPH;
INPUT.FSLB            	= FSLB_NPH;
INPUT.FSUB             	= FSUB_NPH;
INPUT.CTLB           	= CTLB_NPH;
INPUT.CTUB             	= CTUB_NPH;
INPUT.INLB             	= 0*ones(1, NPH);
INPUT.INUB            	= LARGE_NUM*ones(1, NPH);
INPUT.PTLB             	= PTLB;
INPUT.PTUB            	= PTUB;
INPUT.EVLB           	= EVLB;
INPUT.EVUB          	= EVUB;

INPUT.MODEL             = MODEL;

end

function [LB, UB] = EVAL(CX, CY, PTS)
    if PTS(1) ~= PTS(3)
        SLOPE   = - (PTS(2) - PTS(4))/(PTS(1) - PTS(3));
        LINE    = (CY - PTS(2)) + SLOPE*(CX - PTS(1));
    else
        LINE    = (CX - PTS(1));
    end
    
    if LINE < 0
        LB = - inf;
        UB = 0.00001;
    else
        LB = - 0.00001;
        UB = inf;
    end
end