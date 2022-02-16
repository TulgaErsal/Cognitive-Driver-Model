function [NLPBOUNDS, OCPINFO] = OCP2NLP_BOUNDS(SETUP, OCPINFO)

% this function defines variable bounds and constraint bounds for the 
% nonlinear program resulting from the Radau Pseudospectral Method

% it also creates a map of optimal control problem variables and
% constraints to the nonlinear program variables and constraints

% ZL and ZU represent the LOWER and UPPER bounds of the NLP variables
% FL and FU represent the LOWER and UPPER bounds of the NLP constraints

%% inputs
BOUNDS      = SETUP.BOUNDS;

NPH         = SETUP.AUXDATA.num.NPH; 
NST         = SETUP.AUXDATA.num.NST;
NCT         = SETUP.AUXDATA.num.NCT;
NIN         = SETUP.AUXDATA.num.NIN;
NPT         = SETUP.AUXDATA.num.NPT;
NEG         = SETUP.AUXDATA.num.NEG;
NEV         = SETUP.AUXDATA.num.NEV; 
PDU         = SETUP.AUXDATA.num.PDU;

NNO         = OCPINFO.NNO;

%% Counter
% number of NLP variables
NNLPVAR     = NST*(NNO+1)' + NCT*NNO' + 2*NPH + sum(NIN,2);
% number of NLP constraints
NNLPCON     = NST*NNO' + NPT*NNO' + sum(NIN,2) + NPH + sum(NEV,2);

%% Preallocation

% bounds
ZL                              = zeros(NNLPVAR,1);
ZU                              = zeros(NNLPVAR,1);
FL                              = zeros(NNLPCON,1);
FU                              = zeros(NNLPCON,1);

% maps
MAP_CONT(NPH).TM                = [];
MAP_CONT(NPH).ST                = [];
if sum(NCT,2) ~= 0
    MAP_CONT(NPH).CT            = [];
end
MAP_CONT(NPH).DF                = [];
if sum(NPT,2) ~= 0
    MAP_CONT(NPH).PT            = [];
end
if sum(NIN,2) ~= 0
    MAP_CONT(NPH).IN            = [];
    MAP_CONT(NPH).IC            = [];
end
MAP_CONT(NPH).DU                = [];

MAP_EPVAR                       = zeros(1,length(OCPINFO.NENDPVAR));

if NEG ~= 0
    MAP_EVENT                   = zeros(2,NEG);
end

%% Bounds and NLP map
Z_pr    = 0; % assignment pointer of the Z vector
F_pr    = 0; % assignment pointer of the F vector
E_pr	= 0; % assignment pointer of the end point variables vector

for IdxPH = 1:NPH
    % OCP info for phase
    NST_I       = NST(IdxPH);
    NCT_I       = NCT(IdxPH);
    NIN_I       = NIN(IdxPH);
    NPT_I       = NPT(IdxPH);
    PDU_I       = PDU(IdxPH);
    NNO_I       = NNO(IdxPH);
    OCPBOUNDS   = BOUNDS.PH(IdxPH);
    
    %% state variables and defect constraints
    % preallocation
    MAP_STATE           = zeros(2,NST_I);
    MAP_DEFECT          = zeros(2,NST_I);
    
    for IdxST = 1:NST_I
        
        Z_IDXS          = Z_pr + 1;
        Z_IDXE          = Z_pr + (NNO_I + 1);
        Z_IDX           = Z_IDXS+1:Z_IDXE-1;
        
        % Map for state variables 
        MAP_STATE(:,IdxST)       	= [Z_IDXS; Z_IDXE];
        
        % Bounds for state variables 
        ZL(Z_IDXS)      = OCPBOUNDS.IS.LB(IdxST);
        ZU(Z_IDXS)      = OCPBOUNDS.IS.UB(IdxST);
        ZL(Z_IDX)       = OCPBOUNDS.ST.LB(IdxST);
        ZU(Z_IDX)     	= OCPBOUNDS.ST.UB(IdxST);
        ZL(Z_IDXE)      = OCPBOUNDS.FS.LB(IdxST);
        ZU(Z_IDXE)      = OCPBOUNDS.FS.UB(IdxST);
        
        F_IDXS          = F_pr + 1;
        F_IDXE          = F_pr + NNO_I;
        
        % Map for defect constraints
        MAP_DEFECT(:,IdxST)         = [F_IDXS; F_IDXE]; 
        
        % Bounds for defect constraints
        % FL and FU are all 0s for defect constraints
        
        % initial states
        MAP_EPVAR(E_pr+IdxST)     	= Z_IDXS;  
        % final states
        MAP_EPVAR(E_pr+NST_I+IdxST) = Z_IDXE;      
        
      	Z_pr            = Z_IDXE;
        F_pr            = F_IDXE;
    end
    
    E_pr                = E_pr + 2*NST_I;
    
    MAP_CONT(IdxPH).ST  = MAP_STATE;
    MAP_CONT(IdxPH).DF  = MAP_DEFECT;
    
    %% control variables
    
    if NCT_I ~= 0
        % preallocation
        MAP_CONTROL         = zeros(2,NCT_I);
        
        for Idx_CT = 1:NCT_I
            Z_IDXS          = Z_pr + 1;
            Z_IDXE          = Z_pr + NNO_I;
            Z_IDX           = Z_IDXS:Z_IDXE;
            
            % Map for control variables
            MAP_CONTROL(:,Idx_CT) = [Z_IDXS; Z_IDXE];
            
            % Bounds for control variables
            ZL(Z_IDX)       = OCPBOUNDS.CT.LB(Idx_CT);
            ZU(Z_IDX)       = OCPBOUNDS.CT.UB(Idx_CT);
            
            Z_pr            = Z_IDXE;
        end
        
        MAP_CONT(IdxPH).CT	= MAP_CONTROL;
    end
    
    %% initial time and final time
    
    % Bounds for initial time
    Z_pr                    = Z_pr + 1;
    ZL(Z_pr)                = OCPBOUNDS.IT.LB;
    ZU(Z_pr)                = OCPBOUNDS.IT.UB;
    
    % Map for initial time
    MAP_CONT(IdxPH).TM(1,1)	= Z_pr;
    
    E_pr                    = E_pr + 1;
    MAP_EPVAR(E_pr)         = Z_pr;
    
    % Bounds for final time
    Z_pr                    = Z_pr + 1;
    ZL(Z_pr)                = OCPBOUNDS.FT.LB;
    ZU(Z_pr)                = OCPBOUNDS.FT.UB;

    % Map for final time
    MAP_CONT(IdxPH).TM(2,1)	= Z_pr;
    
	E_pr                    = E_pr + 1;
    MAP_EPVAR(E_pr)         = Z_pr;
    
    %% path constraints
    if NPT_I ~= 0
        % preallocation
        MAP_PATH                = zeros(2,NPT_I);
        
        for IdxPT = 1:NPT_I
            
            F_IDXS              = F_pr + 1;
            F_IDXE              = F_pr + NNO_I;
            F_IDX               = F_IDXS:F_IDXE;
            
            % Map for path constraints
            MAP_PATH(:,IdxPT)   = [F_IDXS; F_IDXE];
            
            % Bounds for path constraints
            FL(F_IDX)           = OCPBOUNDS.PT.LB(IdxPT);
            FU(F_IDX)           = OCPBOUNDS.PT.UB(IdxPT);
            
            F_pr                = F_IDXE;
        end
        
        MAP_CONT(IdxPH).PT      = MAP_PATH;
    end
    
    %% integrals variables and integral constraints

    if NIN_I ~= 0
        % preallocation
        MAP_INTVAR              = zeros(1,NIN_I);
        MAP_INTCON              = zeros(1,NIN_I);
        
        for IdxIN = 1:NIN_I
            Z_pr                = Z_pr + 1;
            
            % map for integrals variables
            MAP_INTVAR(IdxIN)	= Z_pr;
            
            % Bounds for integrals variables
            ZL(Z_pr)            = OCPBOUNDS.IN.LB(IdxIN);
            ZU(Z_pr)            = OCPBOUNDS.IN.UB(IdxIN);
            
            F_pr                = F_pr + 1;

            % map for integrals constraints
            MAP_INTCON(IdxIN)	= F_pr;

            % Bounds for integrals constraints
            FL(F_pr)            = 0;
            FU(F_pr)            = 0;
            
            MAP_EPVAR(E_pr+IdxIN)	= Z_pr;
        end
        
        E_pr                    = E_pr + NIN_I;
        
        MAP_CONT(IdxPH).IN      = MAP_INTVAR;
        MAP_CONT(IdxPH).IC      = MAP_INTCON;
    end
    
    %% duration constraints
    F_pr                    = F_pr + 1;
    
    % Map for duration constraints
    MAP_CONT(IdxPH).DU      = F_pr;
    
    % Bounds for duration constraints
    if PDU_I == true
        % Duration bounds DUUB >= TF - T0 >= DULB
        FL(F_pr)            = OCPBOUNDS.DU.LB;
        FU(F_pr)            = OCPBOUNDS.DU.UB;
    else
        % Default duration bounds: 2*(FTUB - ITLB) >= TF - T0 >= 0
        FL(F_pr)            = 0.01; %#CHECK#
        FU(F_pr)            = 2*(OCPBOUNDS.FT.UB - OCPBOUNDS.IT.LB);
    end
 
end

%% event constraints
if NEG ~= 0
    EVENTBOUNDS = BOUNDS.EG;
    for IdxEG = 1:NEG
        F_IDXS              = F_pr + 1;
        F_IDXE              = F_pr + NEV(IdxEG);
        F_IDX               = F_IDXS:F_IDXE;
        
        MAP_EVENT(1,IdxEG) 	= F_IDXS;
        MAP_EVENT(2,IdxEG) 	= F_IDXE;
        
        FL(F_IDX)           = EVENTBOUNDS(IdxEG).LB;
        FU(F_IDX)           = EVENTBOUNDS(IdxEG).UB;
        
        F_pr                = F_IDXE;
    end
end

%% outputs
NLPBOUNDS.ZL              	= ZL;
NLPBOUNDS.ZU              	= ZU;
NLPBOUNDS.FL                = FL;
NLPBOUNDS.FU              	= FU;

OCPINFO.NNLPVAR          	= NNLPVAR;
OCPINFO.NNLPCON            	= NNLPCON;

OCPINFO.NLP_MAP.ENDP     	= MAP_EPVAR;
if NEG ~= 0;
    OCPINFO.NLP_MAP.EVENT  	= MAP_EVENT;
end
OCPINFO.NLP_MAP.CONT       	= MAP_CONT;
