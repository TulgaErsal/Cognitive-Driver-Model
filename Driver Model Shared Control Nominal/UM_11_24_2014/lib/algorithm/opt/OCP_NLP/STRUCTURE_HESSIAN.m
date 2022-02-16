function OCPINFO = STRUCTURE_HESSIAN(OCPINFO)

%% inputs
NPH                 = OCPINFO.NPH;
NST                 = OCPINFO.NST;
NCT                 = OCPINFO.NCT;
NNO                 = OCPINFO.NNO;

CNT_ENDP_VAR2       = OCPINFO.DER_MAP.CNT_ENDP_VAR2;
DER_MAP_ENDP_VAR2	= OCPINFO.DER_MAP.ENDP2.ENDP_VAR2;

CNT_CONT_HESVAR  	= OCPINFO.DER_MAP.CNT_CONT_HESVAR;
DER_MAP_CONT2       = OCPINFO.DER_MAP.CONT2;

NLP_MAP_CONT        = OCPINFO.NLP_MAP.CONT;
NLP_MAP_ENDP        = OCPINFO.NLP_MAP.ENDP;

%% calculation

% find Hessian nonzero locations

% preallocation
HESSTR = zeros(1,2);

IdxHES = 0; % pointer of hessian structure assignment

% loop through all phases
for IdxPH = 1:NPH
    NST_IdxPH           = NST(IdxPH);
    NCT_IdxPH           = NCT(IdxPH);
    NNO_IdxPH           = NNO(IdxPH);
    
    % derivaitve map 
    DER_MAP_CONT_HES 	= DER_MAP_CONT2(IdxPH).CONT_HES;
    
    % NLP map
    NLP_MAP_TM          = NLP_MAP_CONT(IdxPH).TM;
    NLP_MAP_ST          = NLP_MAP_CONT(IdxPH).ST;
    NLP_MAP_CT          = NLP_MAP_CONT(IdxPH).CT;

    % loop through all pairs of variables
    for IdxVAR = 1:CNT_CONT_HESVAR(IdxPH)
        % variable is referred by an index
        VAR_REF1 = DER_MAP_CONT_HES(1,IdxVAR);
        VAR_REF2 = DER_MAP_CONT_HES(2,IdxVAR); 
        
        % note: VARREF2 <= VARREF1 in the construction of DER_MAP_CONT_HES
        if VAR_REF1 <= NST_IdxPH
            % VAR_REF1 is a state and hence VAR_REF2
            REF1_ST                 = VAR_REF1;
            REF2_ST                 = VAR_REF2;
            
            ROWS = NLP_VAR_IDX_ST(NLP_MAP_ST, REF1_ST);
            COLS = NLP_VAR_IDX_ST(NLP_MAP_ST, REF2_ST);
            
            HES_SEQ                 = (IdxHES + 1):(IdxHES + NNO_IdxPH);
            HESSTR(HES_SEQ,1)       = ROWS;
            HESSTR(HES_SEQ,2)       = COLS;
            IdxHES                  = HES_SEQ(end);
            
        elseif VAR_REF1 <= NST_IdxPH + NCT_IdxPH
            % VAR_REF1 is a control, VAR_REF2 can be a state or a control
            REF1_CT                 = VAR_REF1 - NST_IdxPH;
            
            ROWS = NLP_VAR_IDX_CT(NLP_MAP_CT, REF1_CT);
            
            if VAR_REF2 <= NST_IdxPH
                % VAR_REF2 is a state
                REF2_ST             = VAR_REF2;
                COLS = NLP_VAR_IDX_ST(NLP_MAP_ST, REF2_ST);
            else
                % VAR_REF2 is a control
                REF2_CT             = VAR_REF2-NST_IdxPH;
                COLS = NLP_VAR_IDX_CT(NLP_MAP_CT, REF2_CT);
            end
            
            HES_SEQ                 = (IdxHES + 1):(IdxHES + NNO_IdxPH);
            HESSTR(HES_SEQ,1)       = ROWS;
            HESSTR(HES_SEQ,2)     	= COLS;
            IdxHES               	= HES_SEQ(end);
            
        elseif VAR_REF1 == NST_IdxPH + NCT_IdxPH + 1
            % VAR_REF1 is time variable, VAR_REF2 can be a state or a control

            if VAR_REF2 <= NST_IdxPH + NCT_IdxPH
                if VAR_REF2 <= NST_IdxPH
                    % VAR_REF2 is a state
                    REF2_ST      	= VAR_REF2;
                    COLS = NLP_VAR_IDX_ST(NLP_MAP_ST, REF2_ST);
                else
                    % VAR_REF2 is a control
                    REF2_CT        	= VAR_REF2 - NST_IdxPH;
                    COLS = NLP_VAR_IDX_CT(NLP_MAP_CT, REF2_CT);
                end
                
                HES_SEQ          	= (IdxHES + 1):(IdxHES + NNO_IdxPH);
                HESSTR(HES_SEQ,1)   = NLP_MAP_TM(1);
                HESSTR(HES_SEQ,2)   = COLS;
                IdxHES             	= HES_SEQ(end);

                HES_SEQ           	= (IdxHES + 1):(IdxHES + NNO_IdxPH);
                HESSTR(HES_SEQ,1)   = NLP_MAP_TM(2);
                HESSTR(HES_SEQ,2)   = COLS;
                IdxHES            	= HES_SEQ(end);
            end
        end
    end
end

% end point variables
for IdxENDP = 1:CNT_ENDP_VAR2
    VAR_REF1            = DER_MAP_ENDP_VAR2(1,IdxENDP);
    VAR_REF2            = DER_MAP_ENDP_VAR2(2,IdxENDP);
    
    NLPVAR1             = NLP_MAP_ENDP(VAR_REF1);
    NLPVAR2             = NLP_MAP_ENDP(VAR_REF2);
    
    IdxHES              = IdxHES + 1;
    HESSTR(IdxHES,1)    = max(NLPVAR1, NLPVAR2);
    HESSTR(IdxHES,2)    = min(NLPVAR1, NLPVAR2);
end

%% output
OCPINFO.HESSTR	= HESSTR;

end

function SEQ = NLP_VAR_IDX_ST(NLP_MAP_STATE, STATE_REF)
    SEQ = NLP_MAP_STATE(1, STATE_REF) : (NLP_MAP_STATE(2, STATE_REF) - 1);
end

function SEQ = NLP_VAR_IDX_CT(NLP_MAP_CONTROL, CONTROL_REF)
    SEQ = NLP_MAP_CONTROL(1, CONTROL_REF) : NLP_MAP_CONTROL(2, CONTROL_REF);
end