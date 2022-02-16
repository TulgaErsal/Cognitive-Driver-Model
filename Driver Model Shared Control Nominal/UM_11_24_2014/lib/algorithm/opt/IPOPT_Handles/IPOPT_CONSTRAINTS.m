function F_OUT = IPOPT_CONSTRAINTS(ZIN, OCPINFO)

%% inputs
NPH                     = OCPINFO.NPH;
NST                     = OCPINFO.NST;
NPT                     = OCPINFO.NPT;
NIN                     = OCPINFO.NIN;
NEG                     = OCPINFO.NEG;
NEV                     = OCPINFO.NEV;
NNLPCON                 = OCPINFO.NNLPCON;

CLT                     = OCPINFO.CLT;      

NLP_MAP_CONT            = OCPINFO.NLP_MAP.CONT;
if NEG ~= 0
    NLP_MAP_EVENT       = OCPINFO.NLP_MAP.EVENT;
end

JACLIMAT                = OCPINFO.JACLIMAT;

%% NLP to OCP conversion
[INPUT_CONT, TP0, TPF]	= NLP2OCP_CONT(ZIN, OCPINFO);

if NEG ~= 0
    INPUT_ENDP          = NLP2OCP_ENDP(ZIN, OCPINFO);
end

%% constraint evaluation

if OCPINFO.AUXDATA.mif.MODEL == 2
    VALUE_FCN_CONT      = OCP_FCN_CONT_AP_2DOFNL(INPUT_CONT);
elseif OCPINFO.AUXDATA.mif.MODEL == 3
    VALUE_FCN_CONT      = OCP_FCN_CONT_AP_3DOFNL(INPUT_CONT);
elseif OCPINFO.AUXDATA.mif.MODEL == 7
    VALUE_FCN_CONT      = OCP_FCN_CONT_AP_7DOFNL(INPUT_CONT);
end

if NEG ~= 0
    VALUE_FCN_EVENT     = OCP_FCN_ENDP_EVENT(INPUT_ENDP);
end

%% OCP to NLP conversion

% preallocation
F_OUT               	= zeros(NNLPCON,1); 

% loop through all phases to calculate nonlinear parts of the constraints
for IdxPH = 1:NPH
    % collocation variables
    WGT                 = CLT(IdxPH).WGT;
    IG_SP               = CLT(IdxPH).IG_SP;
    
    % function values
    FUN_DYNAMICS        = VALUE_FCN_CONT(IdxPH).DYNA;
    FUN_PATH            = VALUE_FCN_CONT(IdxPH).PATH;
    FUN_INTEGRAND       = VALUE_FCN_CONT(IdxPH).INTG;

    % NLP map
    NLP_MAP_DEFE        = NLP_MAP_CONT(IdxPH).DF;
    NLP_MAP_PATH        = NLP_MAP_CONT(IdxPH).PT;
    NLP_MAP_INTG        = NLP_MAP_CONT(IdxPH).IC;
    
    % time difference / 2
    TDIFF               = (TPF(IdxPH) - TP0(IdxPH)) / 2;
    
    % defect constraints
    % // linear part   : x_m - x_0
    % // nonlinear part: - ((tf-t0)/2)*integral_matrix*fun_dynamics
    IdxF                = NLP_MAP_DEFE(1, 1):NLP_MAP_DEFE(2, NST(IdxPH));
    TMP                 = - TDIFF * ( full(IG_SP * FUN_DYNAMICS) );
    
    F_OUT(IdxF)       	= TMP(:);
    
    % path constraints
    if NPT(IdxPH) ~= 0
        IdxF            = NLP_MAP_PATH(1, 1):NLP_MAP_PATH(2, NPT(IdxPH));
        
        F_OUT(IdxF)  	= FUN_PATH(:);
    end
    
    % integral constraints
    % // linear part   : integral variable
    % // nonlinear part: - ((tf-t0)/2)*weight'*fun_integrand
    if NIN(IdxPH) ~= 0
        IdxF            = NLP_MAP_INTG;
        F_OUT(IdxF)   	= - TDIFF * WGT' * FUN_INTEGRAND;
    end
    
    % duration constraint 
    % // linear constraints
end

% event constraints
if NEG ~= 0
    for IdxEG = 1:NEG
        if NEV(IdxEG) ~= 0
            IdxF    	= NLP_MAP_EVENT(1,IdxEG):NLP_MAP_EVENT(2,IdxEG);
            
            F_OUT(IdxF)	= VALUE_FCN_EVENT(IdxEG).EVENT;
        end
    end
end

%% outputs
% add linear parts of the constraints
F_OUT = F_OUT + JACLIMAT*ZIN;
