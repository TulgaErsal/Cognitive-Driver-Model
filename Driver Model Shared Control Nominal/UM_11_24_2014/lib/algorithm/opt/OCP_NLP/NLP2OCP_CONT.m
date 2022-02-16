function [INPUT_CONT, TP0, TPF] = NLP2OCP_CONT(ZIN, OCPINFO)

NPH                     = OCPINFO.NPH;
NST                     = OCPINFO.NST;
NCT                     = OCPINFO.NCT;
NNO                     = OCPINFO.NNO;
NLP_MAP_CONT            = OCPINFO.NLP_MAP.CONT;
CLT                     = OCPINFO.CLT;

% preallocation
PHASE(NPH).TM           = [];
PHASE(NPH).ST           = [];
if sum(NCT,2) ~= 0
    PHASE(NPH).CT       = [];
end

TP0                     = zeros(1,NPH)*ZIN(1,1);
TPF                     = zeros(1,NPH)*ZIN(1,1);

for IdxPH = 1:NPH
    NLP_MAP_TM       	= NLP_MAP_CONT(IdxPH).TM;
    NLP_MAP_ST       	= NLP_MAP_CONT(IdxPH).ST;
    NLP_MAP_CT        	= NLP_MAP_CONT(IdxPH).CT;
    
    % state
    STATE              	= ZIN(NLP_MAP_ST(1,1):NLP_MAP_ST(2,NST(IdxPH)));
    
    STATE              	= reshape(STATE,NNO(IdxPH)+1,NST(IdxPH));
    
    PHASE(IdxPH).ST    	= STATE(1:NNO(IdxPH),:);
    
    % control
    if NCT(IdxPH) ~= 0
        CONTROL        	= ZIN(NLP_MAP_CT(1,1):NLP_MAP_CT(2,NCT(IdxPH)));
        
        PHASE(IdxPH).CT	= reshape(CONTROL,NNO(IdxPH),NCT(IdxPH));
    end
    
    % time
    TAU              	= CLT(IdxPH).TAU;
    
    T0               	= ZIN(NLP_MAP_TM(1));
    TF              	= ZIN(NLP_MAP_TM(2));
    
    TIME              	= (TAU + 1).*(TF - T0)./2 + T0;
    
    TP0(IdxPH)        	= T0;
    TPF(IdxPH)       	= TF;
    
    PHASE(IdxPH).TM  	= TIME;
end

INPUT_CONT.PHASE      	= PHASE;
INPUT_CONT.AUXDATA     	= OCPINFO.AUXDATA;