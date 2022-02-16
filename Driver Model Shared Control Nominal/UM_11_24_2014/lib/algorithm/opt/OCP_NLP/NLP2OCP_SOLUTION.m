function SOLUTION = NLP2OCP_SOLUTION(ZSOL, OCPINFO)

NPH = OCPINFO.NPH;
NST = OCPINFO.NST;
NCT = OCPINFO.NCT;
NIN = OCPINFO.NIN;
NNO	= OCPINFO.NNO;

PHASE(NPH).TM       = [];
PHASE(NPH).ST       = [];
if sum(NCT,2) ~= 0
    PHASE(NPH).CT   = [];
end
if sum(NIN,2) ~= 0
    PHASE(NPH).IN   = [];
end

for IdxPH = 1:NPH
    NST_IdxPH               = NST(IdxPH);
    NCT_IdxPH               = NCT(IdxPH);
    NIN_IdxPH               = NIN(IdxPH);
    NNO_IdxPH               = NNO(IdxPH);
    NLP_MAP_TIME            = OCPINFO.NLP_MAP.CONT(IdxPH).TM;
    NLP_MAP_STATE           = OCPINFO.NLP_MAP.CONT(IdxPH).ST;
    NLP_MAP_CONTROL         = OCPINFO.NLP_MAP.CONT(IdxPH).CT;
    NLP_MAP_INTVAR          = OCPINFO.NLP_MAP.CONT(IdxPH).IN;

    TAU                     = OCPINFO.CLT(IdxPH).TAU;
    TAUPLUS1                = [TAU; 1];
    T0                      = ZSOL(NLP_MAP_TIME(1));
    TF                      = ZSOL(NLP_MAP_TIME(2));
    TIME                    = (TAUPLUS1 + 1).*(TF - T0)./2 + T0;

    STATE                   = ZSOL(NLP_MAP_STATE(1,1):NLP_MAP_STATE(2,NST_IdxPH));
    
    PHASE(IdxPH).TM         = TIME;
    PHASE(IdxPH).ST         = reshape(STATE, NNO_IdxPH+1, NST_IdxPH);
    
    if NCT_IdxPH ~= 0
        CTRadau             = ZSOL(NLP_MAP_CONTROL(1,1):NLP_MAP_CONTROL(2,NCT_IdxPH));
        CTRadau             = reshape(CTRadau, NNO_IdxPH, NCT_IdxPH);
        CTExtrap            = interp1(TAU,CTRadau,1,'pchip','extrap');
        PHASE(IdxPH).CT     = [CTRadau; CTExtrap];
    end

    if NIN_IdxPH ~= 0
        PHASE(IdxPH).IN     = ZSOL(NLP_MAP_INTVAR)';
    end
end

SOLUTION.PHASE = PHASE;