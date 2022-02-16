function OCPINFO = STRUCTURE_JACOBIAN(OCPINFO)

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
NNLPCON                 = OCPINFO.NNLPCON;

CNT_EVENT_VAR1          = OCPINFO.DER_MAP.CNT_EVENT_VAR1;
DER_MAP_ENDP1           = OCPINFO.DER_MAP.ENDP1;

CNT_CONT_VAR1           = OCPINFO.DER_MAP.CNT_CONT_VAR1;
DER_MAP_CONT1           = OCPINFO.DER_MAP.CONT1;

NLP_MAP_ENDP            = OCPINFO.NLP_MAP.ENDP;
NLP_MAP_CONT            = OCPINFO.NLP_MAP.CONT;
if NEG ~= 0
    NLP_MAP_EVENT      	= OCPINFO.NLP_MAP.EVENT;
end

CLT                     = OCPINFO.CLT;

%% calculation
% preallocation
JACNLSTR                = zeros(1,2);
JACLIVEC               	= zeros(1,3);

% find nonlinear jacbian nonzeros
IdxJAC = 0; % pointer of Jacobian nonlinear part structure assignment
IdxLIN = 0; % pointer of Jacobian linear part assignment

for IdxPH = 1:NPH
    NST_IdxPH           = NST(IdxPH);
    NCT_IdxPH           = NCT(IdxPH);
    NPT_IdxPH           = NPT(IdxPH);
    NIN_IdxPH           = NIN(IdxPH);
    NNO_IdxPH           = NNO(IdxPH);
    
    % derivaitve map 
    DER_MAP_CONT_VAR1	= DER_MAP_CONT1(IdxPH).CONT_VAR1;
    DER_MAP_DYNA_FUN1   = DER_MAP_CONT1(IdxPH).DYNA_FUN1;
    DER_MAP_PATH_FUN1 	= DER_MAP_CONT1(IdxPH).PATH_FUN1;
    DER_MAP_INTG_FUN1   = DER_MAP_CONT1(IdxPH).INTG_FUN1;
    
    % NLP map
    NLP_MAP_TM          = NLP_MAP_CONT(IdxPH).TM;
    NLP_MAP_ST       	= NLP_MAP_CONT(IdxPH).ST;
    NLP_MAP_CT       	= NLP_MAP_CONT(IdxPH).CT;
    NLP_MAP_IN          = NLP_MAP_CONT(IdxPH).IN;
    
    NLP_MAP_DF          = NLP_MAP_CONT(IdxPH).DF;
    if NPT_IdxPH ~= 0
        NLP_MAP_PT      = NLP_MAP_CONT(IdxPH).PT;
    end
    NLP_MAP_IG          = NLP_MAP_CONT(IdxPH).IC;
    NLP_MAP_DU          = NLP_MAP_CONT(IdxPH).DU;

    % collocation matrix
    IV_IX               = CLT(IdxPH).IV_IX;
    IG_IX               = CLT(IdxPH).IG_IX;
    
    %% linear component of Jacobian
    
    % derivatives of defect constraints with respect to states
    for IdxST = 1:NST_IdxPH
        ROW = NLP_MAP_DF(1,IdxST) : NLP_MAP_DF(2,IdxST);
        COL = NLP_MAP_ST(1,IdxST) : NLP_MAP_ST(2,IdxST);
        
        LIN_SEQ                 = (IdxLIN + 1):(IdxLIN + size(IV_IX,1));
        JACLIVEC(LIN_SEQ,1)     = IV_IX(:,1) + ROW(1) - 1;
        JACLIVEC(LIN_SEQ,2)     = IV_IX(:,2) + COL(1) - 1;
        JACLIVEC(LIN_SEQ,3)     = -1;
        IdxLIN                  = LIN_SEQ(end);
        
        LIN_SEQ                	= (IdxLIN + 1):(IdxLIN + NNO_IdxPH);
        JACLIVEC(LIN_SEQ,1)     = ROW ;
        JACLIVEC(LIN_SEQ,2)     = COL(2:end);
        JACLIVEC(LIN_SEQ,3)     = 1;
        IdxLIN                  = LIN_SEQ(end);
    end
    
    % derivatives of duration constraints with respect to times
    IdxLIN                      = IdxLIN + 1;
    JACLIVEC(IdxLIN,1)          = NLP_MAP_DU;
    JACLIVEC(IdxLIN,2)          = NLP_MAP_TM(1);
    JACLIVEC(IdxLIN,3)          = -1;
    
    IdxLIN                      = IdxLIN + 1;
    JACLIVEC(IdxLIN,1)          = NLP_MAP_DU;
    JACLIVEC(IdxLIN,2)          = NLP_MAP_TM(2);
    JACLIVEC(IdxLIN,3)          = 1;
    
    % derivatives of integral constraints with respect to integral variable
    if NIN_IdxPH ~= 0
        for IdxIN = 1:NIN_IdxPH
            IdxLIN              = IdxLIN + 1;
            JACLIVEC(IdxLIN,1)  = NLP_MAP_IG(IdxIN); % integral constraint
            JACLIVEC(IdxLIN,2)  = NLP_MAP_IN(IdxIN); % integral variable
            JACLIVEC(IdxLIN,3)  = 1;
        end
    end

    %% Jacobian structure
    for IdxVAR1 = 1:CNT_CONT_VAR1(IdxPH)
        
        VAR_REF = DER_MAP_CONT_VAR1(IdxVAR1);
        
        if VAR_REF <= NST_IdxPH
            % derivative respect to state
            
            STATE_REF   = VAR_REF;
            COL         = NLP_MAP_ST(1,STATE_REF):(NLP_MAP_ST(2,STATE_REF)-1);
            
            % derivatives of defect constraint
            for IdxST = 1:NST_IdxPH
                if DER_MAP_DYNA_FUN1(IdxST,IdxVAR1) ~= 0
                    ROW                     = NLP_MAP_DF(1,IdxST);
                    JAC_SEQ                 = (IdxJAC + 1):(IdxJAC + size(IG_IX,1));
                    JACNLSTR(JAC_SEQ,1)     = IG_IX(:,1) + ROW - 1;
                    JACNLSTR(JAC_SEQ,2)     = IG_IX(:,2) + COL(1) - 1;
                    IdxJAC                  = JAC_SEQ(end);
                end
            end
            
            % derivatives of path constraints
            if NPT_IdxPH ~= 0
                for IdxPT = 1:NPT_IdxPH
                    if DER_MAP_PATH_FUN1(IdxPT,IdxVAR1) ~= 0
                        ROW                 = NLP_MAP_PT(1,IdxPT):NLP_MAP_PT(2,IdxPT);
                        JAC_SEQ             = (IdxJAC + 1):(IdxJAC + NNO_IdxPH);
                        JACNLSTR(JAC_SEQ,1) = ROW;
                        JACNLSTR(JAC_SEQ,2) = COL;
                        IdxJAC             	= JAC_SEQ(end);
                    end
                end
            end
            
            % derivatives of integral constraint
            if NIN_IdxPH ~= 0
                for IdxIN = 1:NIN_IdxPH
                    if DER_MAP_INTG_FUN1(IdxIN,IdxVAR1) ~= 0
                        ROW                 = NLP_MAP_IG(IdxIN);
                        JAC_SEQ             = (IdxJAC + 1):(IdxJAC + NNO_IdxPH);
                        JACNLSTR(JAC_SEQ,1) = ROW;
                        JACNLSTR(JAC_SEQ,2) = COL;
                        IdxJAC             	= JAC_SEQ(end);
                    end
                end
            end
            
        elseif VAR_REF <= NST_IdxPH + NCT_IdxPH;
            % derivative respect to control
            
            CONTROL_REF = VAR_REF-NST_IdxPH;
            COL         = NLP_MAP_CT(1,CONTROL_REF):NLP_MAP_CT(2,CONTROL_REF);
            
            % derivatives of defect constraint
            for IdxST = 1:NST_IdxPH
                if DER_MAP_DYNA_FUN1(IdxST,IdxVAR1) ~= 0
                    ROW                     = NLP_MAP_DF(1,IdxST);
                    JAC_SEQ                 = (IdxJAC + 1):(IdxJAC + size(IG_IX,1));
                    JACNLSTR(JAC_SEQ,1)     = IG_IX(:,1) + ROW - 1;
                    JACNLSTR(JAC_SEQ,2)     = IG_IX(:,2) + COL(1) - 1;
                    IdxJAC                  = JAC_SEQ(end);
                end
            end
            
            % derivatives of path constraints
            if NPT_IdxPH ~= 0
                for IdxPT = 1:NPT_IdxPH
                    if DER_MAP_PATH_FUN1(IdxPT,IdxVAR1) ~= 0
                        ROW                 = NLP_MAP_PT(1,IdxPT):NLP_MAP_PT(2,IdxPT);
                        JAC_SEQ             = (IdxJAC + 1):(IdxJAC + NNO_IdxPH);
                        JACNLSTR(JAC_SEQ,1) = ROW;
                        JACNLSTR(JAC_SEQ,2) = COL;
                        IdxJAC            	= JAC_SEQ(end);
                    end
                end
            end
            
            % derivatives of integral constraint
            if NIN_IdxPH ~= 0
                for IdxIN = 1:NIN_IdxPH
                    if DER_MAP_INTG_FUN1(IdxIN,IdxVAR1) ~= 0
                        ROW                 = NLP_MAP_IG(IdxIN);
                        JAC_SEQ             = (IdxJAC + 1):(IdxJAC + NNO_IdxPH);
                        JACNLSTR(JAC_SEQ,1) = ROW;
                        JACNLSTR(JAC_SEQ,2) = COL;
                        IdxJAC            	= JAC_SEQ(end);
                    end
                end
            end
        end
    end
    
    % derivatives with respect to time
    T0COL = NLP_MAP_TM(1);
    TFCOL = NLP_MAP_TM(2);
    
    % derivatives of defect constraint
    for IdxST = 1:NST_IdxPH
        ROW = NLP_MAP_DF(1,IdxST):NLP_MAP_DF(2,IdxST);
        % derivative respect to t0
        JAC_SEQ             = (IdxJAC + 1):(IdxJAC + NNO_IdxPH);
        JACNLSTR(JAC_SEQ,1) = ROW;
        JACNLSTR(JAC_SEQ,2) = T0COL;
        IdxJAC            	= JAC_SEQ(end);
        % derivative respect to tf
        JAC_SEQ             = (IdxJAC + 1):(IdxJAC + NNO_IdxPH);
        JACNLSTR(JAC_SEQ,1) = ROW;
        JACNLSTR(JAC_SEQ,2) = TFCOL;
        IdxJAC            	= JAC_SEQ(end);
    end
    % derivatives of integral constraint
    if NIN_IdxPH ~= 0
        for IdxIN = 1:NIN_IdxPH;
            ROW = NLP_MAP_IG(IdxIN);
            % derivative respect to t0
            IdxJAC = IdxJAC + 1;
            JACNLSTR(IdxJAC,1) = ROW;
            JACNLSTR(IdxJAC,2) = T0COL;
            % derivative respect to tf
            IdxJAC = IdxJAC + 1;
            JACNLSTR(IdxJAC,1) = ROW;
            JACNLSTR(IdxJAC,2) = TFCOL;
        end
    end
end

if NEG ~= 0
    DER_MAP_EVENT_VAR1 = DER_MAP_ENDP1.EVENT_VAR1;

    for IdxEG = 1:NEG
        TMP = DER_MAP_ENDP1.EVENT_FUN1(IdxEG).FIRST;
        for IdxVAR1 = 1:CNT_EVENT_VAR1
            COL = NLP_MAP_ENDP(DER_MAP_EVENT_VAR1(IdxVAR1));
            for IdxEV = 1:NEV(IdxEG)
                if TMP(IdxEV,IdxVAR1) ~= 0
                    ROW = NLP_MAP_EVENT(1,IdxEG) + IdxEV - 1;
                    IdxJAC = IdxJAC + 1;
                    JACNLSTR(IdxJAC,1) = ROW;
                    JACNLSTR(IdxJAC,2) = COL;
                end
            end
        end
    end
end

%% outputs
OCPINFO.JACLIMAT        = sparse( JACLIVEC(:,1),...
                                  JACLIVEC(:,2),...
                                  JACLIVEC(:,3),...
                                  NNLPCON,...
                                  NNLPVAR);
                             
OCPINFO.JACNLSTR        = JACNLSTR;
