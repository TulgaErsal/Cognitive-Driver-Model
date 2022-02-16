function J_OUT = IPOPT_JACOBIAN(ZIN, OCPINFO)

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

CNT_CONT_VAR1           = OCPINFO.DER_MAP.CNT_CONT_VAR1;
DER_MAP_CONT1           = OCPINFO.DER_MAP.CONT1;

if NEG ~= 0
    CNT_EVENT_VAR1   	= OCPINFO.DER_MAP.CNT_EVENT_VAR1;
    DER_MAP_ENDP1     	= OCPINFO.DER_MAP.ENDP1;
end

CLT                     = OCPINFO.CLT;

JACLIMAT                = OCPINFO.JACLIMAT;
JACNLSTR                = OCPINFO.JACNLSTR;

%% NLP to OCP conversion
[INPUT_CONT, TP0, TPF]  = NLP2OCP_CONT(ZIN, OCPINFO);

INPUT_ENDP              = NLP2OCP_ENDP(ZIN, OCPINFO);

%% Jacobian evaluation
if OCPINFO.AUXDATA.mif.MODEL == 2
    VALUE_FCN_CONT      = OCP_FCN_CONT_AP_2DOFNL(INPUT_CONT);
    VALUE_GRD_CONT      = OCP_GRD_CONT_AP_2DOFNL(INPUT_CONT);
elseif OCPINFO.AUXDATA.mif.MODEL == 3
    VALUE_FCN_CONT      = OCP_FCN_CONT_AP_3DOFNL(INPUT_CONT);
    VALUE_GRD_CONT      = OCP_GRD_CONT_AP_3DOFNL(INPUT_CONT);
elseif OCPINFO.AUXDATA.mif.MODEL == 7
    VALUE_FCN_CONT      = OCP_FCN_CONT_AP_7DOFNL(INPUT_CONT);
    VALUE_GRD_CONT      = OCP_GRD_CONT_AP_7DOFNL(INPUT_CONT);
end

if NEG ~= 0
    VALUE_GRD_EVENT     = OCP_GRD_ENDP_EVENT(INPUT_ENDP);
end

%% OCP to NLP conversion

% preallocation
CNT_JACNL               = size(JACNLSTR,1);
JACNZ                   = zeros(CNT_JACNL, 1);

% loop through all phases to get the nonzero elements of the nonlinear Jacobian

IdxJAC = 0;  % pointer of Jacobian assignment

for IdxPH = 1:NPH
    NST_IdxPH           = NST(IdxPH);
    NCT_IdxPH           = NCT(IdxPH);
    NPT_IdxPH           = NPT(IdxPH);
    NIN_IdxPH           = NIN(IdxPH);
    NNO_IdxPH           = NNO(IdxPH);
    
    % derivative map
    DER_MAP_CONT_VAR1	= DER_MAP_CONT1(IdxPH).CONT_VAR1;
    DER_MAP_DYNA_FUN1   = DER_MAP_CONT1(IdxPH).DYNA_FUN1;
    DER_MAP_PATH_FUN1  	= DER_MAP_CONT1(IdxPH).PATH_FUN1;
    DER_MAP_INTG_FUN1   = DER_MAP_CONT1(IdxPH).INTG_FUN1;
    
    % collocation variables
    WGT                 = CLT(IdxPH).WGT;
    IG_IX               = CLT(IdxPH).IG_IX;
    IG_SP               = CLT(IdxPH).IG_SP;
    
    % function values
    VALUE_FUN_DYNA   	= VALUE_FCN_CONT(IdxPH).DYNA;
    VALUE_FUN_INTG    	= VALUE_FCN_CONT(IdxPH).INTG;
    VALUE_GRD_DYNA    	= VALUE_GRD_CONT(IdxPH).DYNA;
    VALUE_GRD_PATH   	= VALUE_GRD_CONT(IdxPH).PATH;
    VALUE_GRD_INTG   	= VALUE_GRD_CONT(IdxPH).INTG;
    
    % time difference / 2
    TDIFF               = (TPF(IdxPH) - TP0(IdxPH))/2;
    
    % calculate jacobian value of all nonzero locations
    for IdxVAR1 = 1:CNT_CONT_VAR1(IdxPH)
        
        VAR_REF = DER_MAP_CONT_VAR1(IdxVAR1);
        
        % derivative with respect to state and control
        
        if VAR_REF <= NST_IdxPH + NCT_IdxPH
            % derivatives of defect constraints
            for IdxDYNA = 1:NST_IdxPH
                DYNA_REF                    = DER_MAP_DYNA_FUN1(IdxDYNA,IdxVAR1);
                if DYNA_REF ~= 0
                    ASSIGN_SEQ              = (IdxJAC + 1):(IdxJAC + size(IG_IX,1));
                    JACNZ(ASSIGN_SEQ)    	= - TDIFF * IG_IX(:,3) .* VALUE_GRD_DYNA(IG_IX(:,2), DYNA_REF);
                    IdxJAC                  = ASSIGN_SEQ(end);
                end
            end
            
            % derivatives of path constraints
            if NPT_IdxPH ~= 0
                for IdxPATH = 1:NPT_IdxPH
                    PATH_REF                = DER_MAP_PATH_FUN1(IdxPATH,IdxVAR1);
                    if PATH_REF ~= 0
                        ASSIGN_SEQ          = (IdxJAC + 1):(IdxJAC + NNO_IdxPH);
                        JACNZ(ASSIGN_SEQ)   = VALUE_GRD_PATH(:,PATH_REF);
                        IdxJAC           	= ASSIGN_SEQ(end);
                    end
                end
            end
            
            % derivatives of integral constraint
            if NIN_IdxPH ~= 0
                for IdxINTG = 1:NIN_IdxPH
                    INTG_REF                = DER_MAP_INTG_FUN1(IdxINTG,IdxVAR1);
                    if INTG_REF ~= 0
                        ASSIGN_SEQ          = (IdxJAC + 1):(IdxJAC + NNO_IdxPH);
                        JACNZ(ASSIGN_SEQ)	= - TDIFF * WGT .* VALUE_GRD_INTG(:, INTG_REF);
                        IdxJAC           	= ASSIGN_SEQ(end);
                    end
                end
            end
        end
    end
    
    % derivatives with respect to time
    
    % derivatives of defect constraints
    for IdxDYNA = 1:NST_IdxPH
        % derivative respect to t0
        ASSIGN_SEQ          = (IdxJAC + 1):(IdxJAC + NNO_IdxPH);
        JACNZ(ASSIGN_SEQ)   =   full(IG_SP * VALUE_FUN_DYNA(:, IdxDYNA))/2;
        IdxJAC           	= ASSIGN_SEQ(end);
        % derivative respect to tf
        ASSIGN_SEQ          = (IdxJAC + 1):(IdxJAC + NNO_IdxPH);
        JACNZ(ASSIGN_SEQ)   = - full(IG_SP * VALUE_FUN_DYNA(:, IdxDYNA))/2;
        IdxJAC           	= ASSIGN_SEQ(end);
    end
    
    % derivative of path constraints
    
    % derivatives of integral constraints
    if NIN_IdxPH ~= 0
        for IdxINTG = 1:NIN_IdxPH
            % derivative respect to t0
            IdxJAC           = IdxJAC + 1;
            JACNZ(IdxJAC)    =   WGT' * VALUE_FUN_INTG(:, IdxINTG)/2;

            % derivative respect to tf
            IdxJAC           = IdxJAC + 1;
            JACNZ(IdxJAC)  	 = - WGT' * VALUE_FUN_INTG(:, IdxINTG)/2;
        end
    end
    
    % duration constraint
    % // no nonlinear part
    
    % integral constraint derivative respect to integral variable
    % // no nonlinear part
end

if NEG ~= 0
    for IdxEG = 1:NEG
        DER_MAP_EVENT_FUN1	= DER_MAP_ENDP1.EVENT_FUN1(IdxEG).FIRST;
        for IdxVAR = 1:CNT_EVENT_VAR1
            for IdxEV = 1:NEV(IdxEG)
                EVENT_REF   = DER_MAP_EVENT_FUN1(IdxEV,IdxVAR);
                if EVENT_REF ~= 0
                    % event derivatives
                    IdxJAC = IdxJAC + 1;
                    JACNZ(IdxJAC) = VALUE_GRD_EVENT(IdxEG).EVENT(EVENT_REF);
                end
            end
        end
    end
end

%% outputs
% Jacobian sparse matrix
J_OUT = sparse(  JACNLSTR(:,1), ...
                 JACNLSTR(:,2), ...
                 JACNZ, ...
                 NNLPCON, ...
                 NNLPVAR);

% complete Jacobian
J_OUT = J_OUT + JACLIMAT;
