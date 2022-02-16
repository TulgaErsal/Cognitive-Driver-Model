function G_OUT = IPOPT_GRADIENT(ZIN, OCPINFO)

%% inputs
NNLPVAR                 = OCPINFO.NNLPVAR;

DER_MAP_OBJEC_VAR1   	= OCPINFO.DER_MAP.ENDP1.OBJEC_VAR1;
DER_MAP_OBJEC_FUN1   	= OCPINFO.DER_MAP.ENDP1.OBJEC_FUN1;

NLP_MAP_ENDP            = OCPINFO.NLP_MAP.ENDP;

%% NLP to OCP conversion
INPUT_ENDP              = NLP2OCP_ENDP(ZIN, OCPINFO);

%% gradient evaluation
VALUE_GRD_OBJEC         = OCP_GRD_ENDP_OBJEC(INPUT_ENDP);

%% OCP to NLP conversion
% gradient structure
GRD_STR                 = NLP_MAP_ENDP(DER_MAP_OBJEC_VAR1)';
% nonzeros of the gradient vector
GRD_NONZEROS            = VALUE_GRD_OBJEC(DER_MAP_OBJEC_FUN1)';

%% outputs
% preallocation
G_OUT                	= zeros(1,NNLPVAR); 
% assignment
G_OUT(GRD_STR)       	= GRD_NONZEROS;