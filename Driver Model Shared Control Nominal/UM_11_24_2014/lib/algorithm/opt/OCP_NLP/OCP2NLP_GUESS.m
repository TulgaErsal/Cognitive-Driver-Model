function ZG = OCP2NLP_GUESS(SETUP, OCPINFO)

GUESS   = SETUP.GUESS;

NPH     = SETUP.AUXDATA.num.NPH;
NST     = SETUP.AUXDATA.num.NST;
NCT     = SETUP.AUXDATA.num.NCT;
NIN     = SETUP.AUXDATA.num.NIN;

% preallocation
ZG      = zeros(OCPINFO.NNLPVAR,1);

for IdxPH = 1:NPH
    GUESS_IdxPH     = GUESS.PH(IdxPH);
    
    NLP_MAP_CONT  	= OCPINFO.NLP_MAP.CONT(IdxPH);
    
    TAU             = OCPINFO.CLT(IdxPH).TAU;
    
    GUESS_TIME      = GUESS_IdxPH.TM;
    
    INTERP_TIME     = ([TAU; 1] + 1).*(GUESS_TIME(end,1) - GUESS_TIME(1,1))./2 + GUESS_TIME(1,1);
    
    for IdxST = 1:NST(IdxPH)
        Idx         = NLP_MAP_CONT.ST(1,IdxST):NLP_MAP_CONT.ST(2,IdxST);
        
        GUESS_STATE = GUESS_IdxPH.ST(:,IdxST);
        
        ZG(Idx)     = interp1f(GUESS_TIME, GUESS_STATE, INTERP_TIME, 'pchip');
    end
    
    if NCT(IdxPH) ~= 0
        for IdxCT = 1:NCT(IdxPH)
            Idx 	= NLP_MAP_CONT.CT(1,IdxCT):NLP_MAP_CONT.CT(2,IdxCT);
            
            GUESS_CONTROL   = GUESS_IdxPH.CT(:,IdxCT);
            
            ZG(Idx)	= interp1f(GUESS_TIME, GUESS_CONTROL, INTERP_TIME(1:(end-1)), 'pchip');
        end
    end
    
    Idx             = NLP_MAP_CONT.TM(1);
    ZG(Idx)         = GUESS_TIME(1);
    
    Idx             = NLP_MAP_CONT.TM(2);
    ZG(Idx)         = GUESS_TIME(end);
    
    if NIN(IdxPH) ~= 0
        for IdxIN = 1:NIN(IdxPH)
            Idx   	= NLP_MAP_CONT.IN(1,IdxIN);
            ZG(Idx)	= GUESS_IdxPH.IN(IdxIN);
        end
    end
end