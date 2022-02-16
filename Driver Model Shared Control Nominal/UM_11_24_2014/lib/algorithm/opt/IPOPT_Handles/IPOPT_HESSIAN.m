function H_OUT = IPOPT_HESSIAN(ZIN, SIGMA, LAMBDA, OCPINFO)

%% inputs
NPH                     = OCPINFO.NPH;
NST                     = OCPINFO.NST;
NCT                     = OCPINFO.NCT;
NPT                     = OCPINFO.NPT;
NIN                     = OCPINFO.NIN;
NEG                     = OCPINFO.NEG;
NEV                     = OCPINFO.NEV;
NNO                     = OCPINFO.NNO;
NNLPVAR                 = OCPINFO.NNLPVAR;

DER_MAP                 = OCPINFO.DER_MAP;

CNT_CONT_HESVAR         = DER_MAP.CNT_CONT_HESVAR;
CNT_ENDP_VAR2           = DER_MAP.CNT_ENDP_VAR2;
DER_MAP_OBJEC_FUN2      = DER_MAP.ENDP2.OBJEC_FUN2;

CNT_HES                 = size(OCPINFO.HESSTR,1);

if NEG ~= 0
    DER_MAP_EVENT_FUN2  = DER_MAP.ENDP2.EVENT_FUN2;
end

CLT                     = OCPINFO.CLT;    

HESSTR                  = OCPINFO.HESSTR;

OCPMULT                 = LAGRANGE_MULTIPLIERS(LAMBDA, OCPINFO);
if NEG ~= 0
    MULT_EVENT          = OCPMULT.EVENT;
end

%% NLP to OCP conversion
[INPUT_CONT, TP0, TPF]  = NLP2OCP_CONT(ZIN, OCPINFO);
INPUT_ENDP              = NLP2OCP_ENDP(ZIN, OCPINFO);

%% hessian evalution
if OCPINFO.AUXDATA.mif.MODEL == 2
    VALUE_GRD_CONT      = OCP_GRD_CONT_AP_2DOFNL(INPUT_CONT);
    VALUE_HES_CONT      = OCP_HES_CONT_AP_2DOFNL(INPUT_CONT);
elseif OCPINFO.AUXDATA.mif.MODEL == 3
    VALUE_GRD_CONT      = OCP_GRD_CONT_AP_3DOFNL(INPUT_CONT);
    VALUE_HES_CONT      = OCP_HES_CONT_AP_3DOFNL(INPUT_CONT);
elseif OCPINFO.AUXDATA.mif.MODEL == 7
    VALUE_GRD_CONT      = OCP_GRD_CONT_AP_7DOFNL(INPUT_CONT);
    VALUE_HES_CONT      = OCP_HES_CONT_AP_7DOFNL(INPUT_CONT);
end

VALUE_HES_OBJEC         = OCP_HES_ENDP_OBJEC(INPUT_ENDP);

if NEG ~= 0
    VALUE_HES_EVENT     = OCP_HES_ENDP_EVENT(INPUT_ENDP);
end

%% OCP to NLP conversion

% preallocation
HESNZ   = zeros(CNT_HES,1);

% loop through all phases to get the nonzero elements of the Hessian

IdxHES = 0; % pointer of Hessian assignment

for IdxPH = 1:NPH
    NST_IdxPH       = NST(IdxPH);
    NCT_IdxPH       = NCT(IdxPH);
    NPT_IdxPH       = NPT(IdxPH);
    NIN_IdxPH       = NIN(IdxPH);
    NNO_IdxPH       = NNO(IdxPH);
    
    % derivative map
    DER_MAP_CONT1   = DER_MAP.CONT1(IdxPH);
    DER_MAP_CONT2   = DER_MAP.CONT2(IdxPH);
    
    % collocation variables
    WGT             = CLT(IdxPH).WGT;
    IG_SP           = CLT(IdxPH).IG_SP;
    
    % multipliers
    MULT_DEFE    	= full(IG_SP' * OCPMULT.CONT(IdxPH).DEFE);
    MULT_PATH       = OCPMULT.CONT(IdxPH).PATH;
    MULT_INTG       = OCPMULT.CONT(IdxPH).INTG;

    % function values
    VALUE_GRD_DYNA 	= VALUE_GRD_CONT(IdxPH).DYNA;
    VALUE_GRD_INTG 	= VALUE_GRD_CONT(IdxPH).INTG;
    VALUE_HES_DYNA 	= VALUE_HES_CONT(IdxPH).DYNA;
    VALUE_HES_PATH 	= VALUE_HES_CONT(IdxPH).PATH;
    VALUE_HES_INTG	= VALUE_HES_CONT(IdxPH).INTG;
    
    % time difference / 2
    TDIFF           = (TPF(IdxPH) - TP0(IdxPH))/2;
    
    % calculate hessian value of all nonzero locations
    for IdxVAR2 = 1:CNT_CONT_HESVAR(IdxPH)
        
        % variable is referred by an index
        VAR_REF1    = DER_MAP_CONT2.CONT_HES(1,IdxVAR2);
        VAR_REF2    = DER_MAP_CONT2.CONT_HES(2,IdxVAR2);
        
        if VAR_REF1 <= NST_IdxPH + NCT_IdxPH
            % VAR_REF1 is either a state or a control
            % VAR_REF2 is either a state or a control
            
            PAIR_IDX = DER_MAP_CONT2.CONT_HES(4,IdxVAR2);

            % VECTOR A: defect second derivatives
            VEC_A               = zeros(NNO_IdxPH,1);
            % VECTOR B: path second derivatives
            VEC_B               = zeros(NNO_IdxPH,1);
            % VECTOR C: integral second derivatives
            VEC_C               = zeros(NNO_IdxPH,1);
            
            for IdxST = 1:NST_IdxPH
                DYNA_REF        = DER_MAP_CONT2.DYNA_FUN2(IdxST, PAIR_IDX);
                if DYNA_REF ~= 0
                    VEC_A       = VEC_A + MULT_DEFE(:,IdxST).*VALUE_HES_DYNA(:, DYNA_REF);
                end
            end
            
            if NPT_IdxPH ~= 0
                for IdxPT = 1:NPT_IdxPH
                    PATH_REF    = DER_MAP_CONT2.PATH_FUN2(IdxPT,PAIR_IDX);
                    if PATH_REF ~= 0
                        VEC_B   = VEC_B + MULT_PATH(:,IdxPT).*VALUE_HES_PATH(:, PATH_REF);
                    end
                end
            end
            
            if NIN_IdxPH ~= 0
                for IdxIN = 1:NIN_IdxPH
                    INTG_REF    = DER_MAP_CONT2.INTG_FUN2(IdxIN,PAIR_IDX);
                    if INTG_REF ~= 0
                        VEC_C   = VEC_C + MULT_INTG(  IdxIN).*VALUE_HES_INTG(:, INTG_REF);
                    end
                end
            end

            ASSIGN_SEQ          = (IdxHES + 1: IdxHES + NNO_IdxPH);
            HESNZ(ASSIGN_SEQ)   = - TDIFF.* VEC_A +  + VEC_B - TDIFF.* WGT.*VEC_C;
            
        	IdxHES              = IdxHES + NNO_IdxPH;
        else
            % VAR_REF1 is time
            % VAR_REF2 is either a state or a control

            VAR_REF3 = DER_MAP_CONT2.CONT_HES(3,IdxVAR2);
            
            % VECTOR A: defect second derivatives
            VEC_A = zeros(NNO_IdxPH,1);
            % VECTOR B: integral second derivatives
            VEC_B = zeros(NNO_IdxPH,1);
            
            if VAR_REF3 ~= 0
                for IdxST = 1:NST_IdxPH
                    DYNA_REF    = DER_MAP_CONT1.DYNA_FUN1(IdxST,VAR_REF3);
                    if DYNA_REF ~= 0
                        VEC_A   = VEC_A + MULT_DEFE(:,IdxST).*VALUE_GRD_DYNA(:,DYNA_REF);
                    end
                end
                
                if NIN_IdxPH ~= 0
                    for IdxIN = 1:NIN_IdxPH
                        INTG_REF = DER_MAP_CONT1.INTG_FUN1(IdxIN,VAR_REF3);
                        if INTG_REF ~= 0
                            VEC_B = VEC_B + MULT_INTG(IdxIN).*VALUE_GRD_INTG(:,INTG_REF);
                        end
                    end
                end
            end
            
            if VAR_REF1 == NST_IdxPH + NCT_IdxPH + 1
                if VAR_REF2 <= NST_IdxPH + NCT_IdxPH
                    % t0/state or t0/control
                    ASSIGN_SEQ          = (IdxHES + 1: IdxHES + NNO_IdxPH);
                    HESNZ(ASSIGN_SEQ)   = (VEC_A + WGT.*VEC_B)/2;
                    IdxHES              = IdxHES + NNO_IdxPH;
                    
                    % tf/state or tf/control
                    ASSIGN_SEQ          = (IdxHES + 1: IdxHES + NNO_IdxPH);
                    HESNZ(ASSIGN_SEQ)   = - (VEC_A + WGT.*VEC_B)/2;
                    IdxHES           	= IdxHES + NNO_IdxPH;
                end
            end
        end
    end
end

% end-point variables
for IdxENDP = 1:CNT_ENDP_VAR2
    HES             = 0;
    
    OBJEC_REF       = DER_MAP_OBJEC_FUN2(IdxENDP);
    
    if OBJEC_REF ~= 0
        HES         = HES + SIGMA*VALUE_HES_OBJEC(OBJEC_REF);
    end
    
    if NEG ~= 0
        for IdxEG = 1:NEG
            if NEV(IdxEG) ~= 0
                for IdxEV = 1:NEV(IdxEG)
                    EVENT_REF = DER_MAP_EVENT_FUN2(IdxEG).SECOND(IdxEV,IdxENDP);
                    
                    if EVENT_REF ~= 0
                        HES = HES + MULT_EVENT(IdxEG).EVENT(IdxEV) *...
                                    VALUE_HES_EVENT(IdxEG).EVENT(EVENT_REF);
                    end
                end
            end
        end
    end

    IdxHES           = IdxHES + 1;
    HESNZ(IdxHES)    = HES;
end

%% output
% Hessian matrix
H_OUT = sparse(  HESSTR(:,1),...
                 HESSTR(:,2),... 
                 HESNZ,...
                 NNLPVAR,... 
                 NNLPVAR     );

end

function OCPMULT = LAGRANGE_MULTIPLIERS(LAMBDA, OCPINFO)
    NPH                     = OCPINFO.NPH;
    NST                     = OCPINFO.NST;
    NPT                     = OCPINFO.NPT;
    NIN                     = OCPINFO.NIN;
    NEG                     = OCPINFO.NEG;
    NNO                     = OCPINFO.NNO;
    
    NLP_MAP                 = OCPINFO.NLP_MAP;

    % preallocation
    MULT_CONT(NPH).DEFE             = [];
    if sum(NPT,2) ~= 0
        MULT_CONT(NPH).PATH         = [];
    end
    if sum(NIN,2) ~= 0
        MULT_CONT(NPH).INTG         = [];
    end

    for IdxPH = 1:NPH
        NLP_MAP_DEFE                    = NLP_MAP.CONT(IdxPH).DF;
        NLP_MAP_PATH                    = NLP_MAP.CONT(IdxPH).PT;
        NLP_MAP_INTG                    = NLP_MAP.CONT(IdxPH).IC;

        % multiplers for defect constraints
        DEFECT_SEQ                      = NLP_MAP_DEFE(1,1):NLP_MAP_DEFE(2,NST(IdxPH));
        MULT_DEFE                       = LAMBDA(DEFECT_SEQ);
        MULT_CONT(IdxPH).DEFE           = reshape(MULT_DEFE,NNO(IdxPH),NST(IdxPH));
        
        % multipliers for path constraints
        if NPT(IdxPH) ~= 0
            PATH_SEQ                    = NLP_MAP_PATH(1,1):NLP_MAP_PATH(2,NPT(IdxPH));
            MULT_PATH                 	= LAMBDA(PATH_SEQ);
            MULT_CONT(IdxPH).PATH       = reshape(MULT_PATH,NNO(IdxPH),NPT(IdxPH));
        end
        
        % multipliers for integral constraints
        if NIN(IdxPH) ~= 0
            MULT_CONT(IdxPH).INTG       = LAMBDA(NLP_MAP_INTG)';
        end
    end
    
    OCPMULT.CONT                        = MULT_CONT;

    % multipliers for events
    if NEG ~= 0
        MULT_EVENT(NEG).EVENT = [];
        MAP_EVENT = NLP_MAP.EVENT;
        for IdxEG = 1:NEG
            MULT_EVENT(IdxEG).EVENT     = LAMBDA(MAP_EVENT(1,IdxEG):MAP_EVENT(2,IdxEG))';
        end
        OCPMULT.EVENT = MULT_EVENT;
    end
end
