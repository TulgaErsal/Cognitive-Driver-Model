function INPUT_ENDP = NLP2OCP_ENDP(ZIN, OCPINFO)

NPH                     = OCPINFO.NPH; 
NIN                     = OCPINFO.NIN; 

% preallocation
PHASE(NPH).IS           = [];
PHASE(NPH).FS           = [];
PHASE(NPH).IT           = [];
PHASE(NPH).FT           = [];
if sum(NIN,2) ~= 0  
    PHASE(NPH).IN       = [];
end

for IdxPH = 1:NPH
    NLP_MAP_CONT        = OCPINFO.NLP_MAP.CONT(IdxPH);
    PHASE(IdxPH).IS     = ZIN(NLP_MAP_CONT.ST(1,:))';
    PHASE(IdxPH).FS     = ZIN(NLP_MAP_CONT.ST(2,:))';
    PHASE(IdxPH).IT     = ZIN(NLP_MAP_CONT.TM(1));
    PHASE(IdxPH).FT     = ZIN(NLP_MAP_CONT.TM(2));
    if NIN(IdxPH) ~= 0
        PHASE(IdxPH).IN	= ZIN(NLP_MAP_CONT.IN)';
    end
end

INPUT_ENDP.PHASE        = PHASE;
INPUT_ENDP.AUXDATA      = OCPINFO.AUXDATA;