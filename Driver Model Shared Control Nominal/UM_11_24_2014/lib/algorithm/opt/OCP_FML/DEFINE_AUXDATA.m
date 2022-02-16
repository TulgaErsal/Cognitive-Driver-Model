function AUXDATA = DEFINE_AUXDATA(INPUT)

%% vehicle model information
if     INPUT.MODEL == 2
    NMST        = 6;
    NMCT        = 1;
elseif INPUT.MODEL == 3
    NMST        = 7;
    NMCT        = 2;
elseif INPUT.MODEL == 7
    NMST        = 14;
    NMCT        = 2;
end

XLOC            = 1;
YLOC            = 2;
ALOC            = 6;
ULOC            = 7;

mif.MODEL       = INPUT.MODEL;
mif.NMST        = NMST; 
mif.NMCT        = NMCT;
mif.XLOC        = XLOC;
mif.YLOC        = YLOC;
mif.ALOC        = ALOC;
mif.ULOC        = ULOC;

AUXDATA.mif     = mif;

%% vehicle parameters
load DATA_HMMWV_MODEL.mat

% parameters to be used by 2 DoF and 3 DoF vehicle model
veh.M           = DATA_HMMWV_MODEL.M;
veh.IZZ         = DATA_HMMWV_MODEL.IZZ;
veh.LA          = DATA_HMMWV_MODEL.LA;
veh.LB          = DATA_HMMWV_MODEL.LB;
veh.FZF0        = DATA_HMMWV_MODEL.FZF0;
veh.FZR0        = DATA_HMMWV_MODEL.FZR0;
veh.dF          = DATA_HMMWV_MODEL.dFZX_Coeff;
if INPUT.MODEL == 2
    veh.U0      = INPUT.U0;
end

% additional parameters for 5 DoF vehicle model
veh.RW          = DATA_HMMWV_MODEL.RW;
veh.IW          = DATA_HMMWV_MODEL.IW;
veh.Tau_LT      = DATA_HMMWV_MODEL.Tau_LT;

% additional parameters for 7 DoF vehicle model
veh.LC          = DATA_HMMWV_MODEL.LC;
veh.dFZX_Coeff  = DATA_HMMWV_MODEL.dFZX_Coeff;
veh.dFZYF_Coeff = DATA_HMMWV_MODEL.dFZYF_Coeff;
veh.dFZYR_Coeff = DATA_HMMWV_MODEL.dFZYR_Coeff;

AUXDATA.veh     = veh;

%% Optimal control problem formulation parameters and indicators
fml.PSI0        = pi/2;
fml.XY_GOAL  	= INPUT.XY_GOAL;
fml.HA_GOAL   	= INPUT.HA_GOAL;

% objective function
fml.OBJEC_IND  	= [ INPUT.OBJEC_IND.ITG,...
                  	INPUT.OBJEC_IND.D2G,...
                  	INPUT.OBJEC_IND.FAD,...
                 	INPUT.OBJEC_IND.FTM ];

fml.OBJEC_ADT	= INPUT.OBJEC_IND.ADT;

if fml.OBJEC_ADT == 1
    fml.OBJEC_R	= INPUT.OBJEC_IND.R;
else
    fml.OBJEC_R	= [];
end

% objective function weights
fml.OBJEC_W   	= [ INPUT.WEIGHTS.D2G,...
                    INPUT.WEIGHTS.FAD,...
                    INPUT.WEIGHTS.FTM ];
                                
fml.INTG_W      = [ INPUT.WEIGHTS.SASQ, ...
                    INPUT.WEIGHTS.UXSQ, ...
                   	INPUT.WEIGHTS.SRSQ, ...
                   	INPUT.WEIGHTS.AXSQ, ...
                   	INPUT.WEIGHTS.DIST];
                            
fml.REF_LINE   	= INPUT.REF_LINE;
                            
fml.PATH_IND  	= INPUT.PATH_IND;
fml.LINE_PTS   	= INPUT.LINE_PTS;

fml.EVENT_IND  	= INPUT.EVENT_IND;
if fml.EVENT_IND(1) == 1 || fml.EVENT_IND(2) == 1
    fml.REF_PT 	= INPUT.REF_PT;
end

AUXDATA.fml     = fml;

%% counter
NPH         = INPUT.NPH;
num.NPH   	= NPH;
num.NST     = NMST*ones(1, NPH);
num.NCT     = NMCT*ones(1, NPH);
num.NIN     = ones(1, NPH);
num.NPA     = 0;
num.PDU     = false*ones(1, NPH);
num.NPT     = sum(AUXDATA.fml.PATH_IND, 2)';
NEV_FS   	= sum(AUXDATA.fml.EVENT_IND);
num.NEV     = [(NMST + 1)*ones(1, NPH - 1), NEV_FS];
if NEV_FS == 0
    num.NEG = NPH - 1;
else
    num.NEG = NPH;
end

AUXDATA.num = num;

